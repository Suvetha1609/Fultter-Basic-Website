import 'dart:async';

import 'package:newwatt/export.dart';

class DropdownEditingController<T> extends ChangeNotifier {
  T? _value;

  DropdownEditingController({T? value}) : _value = value;

  T? get value => _value;

  set value(T? newValue) {
    if (_value == newValue) return;
    _value = newValue;
    notifyListeners();
  }

  @override
  String toString() => '${describeIdentity(this)}($value)';
}

class DropdownFormField<T> extends StatefulWidget {
  final bool autoFocus;

  final bool Function(T item, String str)? filterFn;

  final bool Function(T? item1, T? item2)? selectedFn;

  final Future<List<T>> Function(String str) findFn;

  final Widget Function(
    T item,
    int position,
    bool focused,
    bool selected,
    Function() onTap,
  ) dropdownItemFn;

  /// Build widget to display selected item inside Form Field
  final Widget Function(T? item) displayItemFn;

  final InputDecoration? decoration;
  final Color? dropdownColor;
  final DropdownEditingController<T>? controller;
  final void Function(T item)? onChanged;
  final void Function(T?)? onSaved;
  final String? Function(T?)? validator;

  /// height of the dropdown overlay, Default: 240
  final double? dropdownHeight;

  /// Style the search box text
  final TextStyle? searchTextStyle;

  final Offset? offset;

  /// Message to disloay if the search dows not match with any item, Default : "No matching found!"
  final String emptyText;

  /// Give action text if you want handle the empty search.
  final String emptyActionText;

  /// this functon triggers on click of emptyAction button
  final Future<void> Function()? onEmptyActionPressed;
  final TextInputType? keyboardType;

  const DropdownFormField({
    Key? key,
    required this.dropdownItemFn,
    required this.displayItemFn,
    required this.findFn,
    this.filterFn,
    this.autoFocus = false,
    this.controller,
    this.validator,
    this.decoration,
    this.dropdownColor,
    this.onChanged,
    this.onSaved,
    this.dropdownHeight,
    this.searchTextStyle,
    this.emptyText = "No matching found!",
    this.emptyActionText = 'Create new',
    this.onEmptyActionPressed,
    this.selectedFn,
    this.offset,
    this.keyboardType,
  }) : super(key: key);

  @override
  DropdownFormFieldState createState() => DropdownFormFieldState<T>(keyboardType);
}

class DropdownFormFieldState<T> extends State<DropdownFormField> with SingleTickerProviderStateMixin {
  final FocusNode _widgetFocusNode = FocusNode();
  final FocusNode _searchFocusNode = FocusNode();
  final LayerLink _layerLink = LayerLink();
  final ValueNotifier<List<T>> _listItemsValueNotifier = ValueNotifier<List<T>>([]);
  final TextEditingController _searchTextController = TextEditingController();
  final DropdownEditingController<T> _controller = DropdownEditingController<T>();
  final TextInputType? keyboardType;

  final Function(T?, T?) _selectedFn = (dynamic item1, dynamic item2) => item1 == item2;

  bool get _isEmpty => _selectedItem == null;
  bool _isFocused = false;

  OverlayEntry? _overlayEntry;
  OverlayEntry? _overlayBackdropEntry;
  List<T>? _options;
  int _listItemFocusedPosition = 0;
  T? _selectedItem;
  Widget? _displayItem;
  Timer? _debounce;
  String? _lastSearchString;

  DropdownEditingController<dynamic>? get _effectiveController => widget.controller ?? _controller;

  DropdownFormFieldState(this.keyboardType) : super();

  @override
  void initState() {
    super.initState();

    if (widget.autoFocus) _widgetFocusNode.requestFocus();
    _selectedItem = _effectiveController!.value;

    _searchFocusNode.addListener(() {
      if (!_searchFocusNode.hasFocus && _overlayEntry != null) {
        _removeOverlay();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
    _searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print("_overlayEntry : $_overlayEntry");

    _displayItem = widget.displayItemFn(_selectedItem);

    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: () {
          _widgetFocusNode.requestFocus();
          _toggleOverlay();
        },
        child: Focus(
          autofocus: false,
          focusNode: _widgetFocusNode,
          onFocusChange: (focused) {
            setState(() {
              _isFocused = focused;
            });
          },
          child: FormField(
            validator: (str) {
              if (widget.validator != null) {
                widget.validator!(_effectiveController!.value);
              }
              return null;
            },
            onSaved: (str) {
              if (widget.onSaved != null) {
                widget.onSaved!(_effectiveController!.value);
              }
            },
            builder: (state) {
              return InputDecorator(
                decoration: widget.decoration ??
                    const InputDecoration(
                      border: UnderlineInputBorder(),
                    ),
                isEmpty: _isEmpty,
                isFocused: _isFocused,
                child: _overlayEntry != null
                    ? EditableText(
                        keyboardType: keyboardType,
                        autofocus: false,
                        style: const TextStyle(fontSize: 16, color: Colors.black87),
                        controller: _searchTextController,
                        cursorColor: Colors.black87,
                        focusNode: _searchFocusNode,
                        backgroundCursorColor: Colors.transparent,
                        onChanged: (str) {
                          if (_overlayEntry == null) {
                            _addOverlay();
                          }
                          _onTextChanged(str);
                        },
                        onSubmitted: (str) {
                          _searchTextController.value = const TextEditingValue(text: "");
                          _setValue();
                          _removeOverlay();
                          _widgetFocusNode.nextFocus();
                        },
                        onEditingComplete: () {},
                      )
                    : _displayItem ?? Container(),
              );
            },
          ),
        ),
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {
    final renderObject = context.findRenderObject() as RenderBox;
    // print(renderObject);
    final Size size = renderObject.size;

    var overlay = OverlayEntry(builder: (context) {
      return Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: widget.offset ?? Offset(0.0, size.height + 7),
          child: Material(
            color: Colors.transparent,
            child: Container(
                constraints: BoxConstraints(minHeight: 100, maxHeight: appikorn_text_field_dropdown_height),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                    color: Colors.white),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: widget.dropdownColor ?? Colors.white70,
                    ),
                    child: ValueListenableBuilder(
                        valueListenable: _listItemsValueNotifier,
                        builder: (context, List<T> items, child) {
                          return _options != null && _options!.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemCount: _options!.length,
                                  itemBuilder: (context, position) {
                                    T item = _options![position];
                                    onTap() {
                                      _listItemFocusedPosition = position;
                                      _searchTextController.value = const TextEditingValue(text: "");
                                      _removeOverlay();
                                      _setValue();
                                    }

                                    Widget card = widget.dropdownItemFn(
                                      item,
                                      position,
                                      position == _listItemFocusedPosition,
                                      (widget.selectedFn ?? _selectedFn)(_selectedItem, item),
                                      onTap,
                                    );

                                    return card;
                                  })
                              : Container(
                                  height: 70,
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      appikorn_text(text: "empty", size: f0)

                                      // if (widget.onEmptyActionPressed != null)
                                      //   TextButton(
                                      //     onPressed: () async {
                                      //       await widget.onEmptyActionPressed!();
                                      //       _search(_searchTextController.value.text);
                                      //     },
                                      //     child: Text(widget.emptyActionText),
                                      //   ),
                                    ],
                                  ),
                                );
                        }))),
          ),
        ),
      );
    });

    return overlay;
  }

  OverlayEntry _createBackdropOverlay() {
    return OverlayEntry(
        builder: (context) => Positioned(
            left: 0,
            top: 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GestureDetector(
              onTap: () {
                _removeOverlay();
              },
            )));
  }

  _addOverlay() {
    if (_overlayEntry == null) {
      _search("");
      _overlayBackdropEntry = _createBackdropOverlay();
      _overlayEntry = _createOverlayEntry();
      if (_overlayEntry != null) {
        // Overlay.of(context)!.insert(_overlayEntry!);
        Overlay.of(context)!.insertAll([_overlayBackdropEntry!, _overlayEntry!]);
        setState(() {
          _searchFocusNode.requestFocus();
        });
      }
    }
  }

  _removeOverlay() {
    if (_overlayEntry != null) {
      _overlayBackdropEntry!.remove();
      _overlayEntry!.remove();
      _overlayEntry = null;
      _searchTextController.value = TextEditingValue.empty;
      setState(() {});
    }
  }

  _toggleOverlay() {
    if (_overlayEntry == null) {
      _addOverlay();
    } else {
      _removeOverlay();
    }
  }

  _onTextChanged(String? str) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (_lastSearchString != str) {
        _lastSearchString = str;
        _search(str ?? "");
      }
    });
  }

  _search(String str) async {
    List<T> items = await widget.findFn(str) as List<T>;

    if (str.isNotEmpty && widget.filterFn != null) {
      items = items.where((item) => widget.filterFn!(item, str)).toList();
    }

    _options = items;

    _listItemsValueNotifier.value = items;

    // print('_search ${_options!.length}');
  }

  _setValue() {
    var item = _options![_listItemFocusedPosition];
    _selectedItem = item;

    _effectiveController!.value = _selectedItem;

    if (widget.onChanged != null) {
      widget.onChanged!(_selectedItem);
    }

    setState(() {});
  }
}
