import 'package:newwatt/export.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class appikorn_dropdown_searchable_text_field extends StatelessWidget {
  appikorn_dropdown_searchable_text_field(
      {super.key,
      required this.context,
      required this.list,
      required this.controller,
      this.height,
      this.dropdownColor,
      this.maxLines,
      this.maxLength,
      this.textcolor,
      this.dropdown_textcolor,
      this.lable,
      this.hint,
      this.readOnly,
      this.fillColor,
      this.borderColor,
      this.border,
      this.textsize,
      this.validator,
      this.keyboardType,
      this.regx,
      this.suffixicon,
      this.preffixxicon,
      required this.onChanged,
      this.onSaved,
      this.onTap,
      this.bottom_sheet_height,
      this.center_text,
      this.only_drop_down,
      this.radius,
      this.dropdown_height,
      this.offset});

  final TextEditingController controller;
  final double? height;
  final Color? dropdownColor;
  final BuildContext context;
  final int? maxLines;
  final int? maxLength;
  final Color? textcolor;
  final Color? dropdown_textcolor;
  final String? lable;
  final String? hint;
  final Color? fillColor;
  final Color? borderColor;
  final bool? border;
  final double? textsize;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? regx;
  final void Function(dynamic?) onChanged;
  final void Function(dynamic)? onSaved;
  final void Function()? onTap;
  final Widget? suffixicon;
  final Widget? preffixxicon;
  final bool? readOnly;
  final bool? center_text;
  final bool? only_drop_down;
  final List<String> list;
  final double? bottom_sheet_height;
  final double? radius;
  final double? dropdown_height;
  final Offset? offset;
  var lablee = "";
  TextEditingController search_controller = TextEditingController();

  Widget bottomsheet() {
    return appikorn_text_field(
      borderColor: borderColor,
      height: height,
      border: border,
      controller: controller,
      suffixicon: suffixicon,
      readOnly: true,
      lable: lable,
      regx: noSymbolregex,
      ontap: show_model,
    );
  }

  //for mobile
  void show_model() {
    print("showing $list");
    search_controller.text = "";

    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width * .8,
              decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)), color: Colors.white),
              height: bottom_sheet_height ?? MediaQuery.of(context).size.height * .55,
              constraints: const BoxConstraints(minWidth: 400),
              child: Column(
                children: [
                  15.heightBox,
                  appikorn_text_field(
                    height: height,
                    hint: "Search",
                    border: border,
                    controller: search_controller,
                    onChanged: (s) {
                      mystate(() {});
                    },
                    suffixicon: const Icon(Icons.close).onTap(() {
                      Navigator.of(context).pop();
                    }),
                    regx: allCharacterRegx,
                  ),
                  SizedBox(
                    height: bottom_sheet_height != null ? (bottom_sheet_height! - 100) : MediaQuery.of(context).size.height * .45,
                    child: GestureDetector(
                      onTap: () {},
                      child: appikorn_list_view(count: list.length, child: bottom_sheet_card),
                    ),
                  )
                ],
              ),
            );
          });
        });
  }

  bottom_sheet_card({index}) {
    return !(list[index].toLowerCase().trim().contains(search_controller.text.toLowerCase().trim()))
        ? null
        : GestureDetector(
            onTap: () {
              print("this is clicked ${list[index]}");

              controller.text = list[index];
              onChanged!(list[index]);

              Navigator.of(context).pop();
            },
            child: Container(
              height: 50,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  1.heightBox,
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: appikorn_text(
                      maxLine: 3,
                      text: list[index],
                      size: f0,
                    ),
                  ),
                  const Divider(
                    height: 0.5,
                  )
                ],
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return (kIsWeb || (only_drop_down != null && only_drop_down == true)) ? test() : bottomsheet();
  }

  Widget test() {
    return TypeAheadFormField(
      textFieldConfiguration: TextFieldConfiguration(
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.emailAddress,
        maxLines: 1,
        decoration: InputDecoration(
          counterText: "",
          isDense: true,
          alignLabelWithHint: true,
          hintText: lablee == "" ? hint : "",
          hintStyle: TextStyle(
            color: text_color,
            fontSize: f1,
          ),
          filled: true,
          fillColor: fillColor ?? Colors.transparent,
          border: (border == null || (border != null && border == true))
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius ?? 2)),
                  borderSide: BorderSide(color: borderColor ?? border_idle_color.withOpacity(0.3), width: 1),
                )
              : InputBorder.none,
          enabledBorder: (border == null || (border != null && border == true))
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius ?? 2)),
                  borderSide: BorderSide(color: borderColor ?? border_idle_color.withOpacity(0.3), width: 1),
                )
              : InputBorder.none,
          focusedBorder: (border == null || (border != null && border == true))
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius ?? 2)),
                  borderSide: BorderSide(color: borderColor ?? primary_color, width: 1.0),
                )
              : InputBorder.none,
          suffixIcon: suffixicon,
          prefixIcon: preffixxicon,
        ),
      ),
      suggestionsCallback: (pattern) async {
        return list.where((option) => option.toLowerCase().contains(pattern.toLowerCase()));
      },
      itemBuilder: (context, optionData) {
        return ListTile(
          title: Text(optionData.toString()),
        );
      },

      onSuggestionSelected: (optionData) {
        controller.text = optionData.toString();
        onChanged(optionData);
      },
      suggestionsBoxVerticalOffset: 15.0, // set the dropdown offset here

      suggestionsBoxDecoration: SuggestionsBoxDecoration(
        constraints: BoxConstraints(
          maxHeight: 200.0,
        ),
      ),
    );
  }
}
