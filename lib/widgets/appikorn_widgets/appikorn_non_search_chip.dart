import '../../export.dart';
import 'appikorn_wrap.dart';

class appikorn_non_search_chip extends StatefulWidget {
  appikorn_non_search_chip({Key? key, this.lable, required this.list, required this.height, required this.onChanged, required this.selected}) : super(key: key);
  final String? lable;
  final List<String> list;
  final double height;
  final Function(String) onChanged;
  final String selected;

  @override
  State<appikorn_non_search_chip> createState() => _appikorn_non_search_chipState();
}

class _appikorn_non_search_chipState extends State<appikorn_non_search_chip> {
  TextEditingController search = TextEditingController();
  var load_more = false;
  var select_index = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      if (widget.selected.toLowerCase().isNotEmpty) {
        load_more = true;
        search.text = widget.selected.toLowerCase() ?? "";
      }
      setState(() {});
    });
  }

  Widget sub_card(dat) {
    return appikorn_button(
      textColor: dat == widget.selected ? Colors.white : null,
      color: dat == widget.selected ? primary_color : Colors.transparent,
      width: 30,
      onTap: () {
        widget.onChanged(dat);
      },
      hovered_textColor: Colors.black,
      hover_border: true,
      text: dat,
      height: 40,
    );
  }

  Padding? card(dat) {
    return (search.text.isEmpty)
        ? sub_card(dat).pOnly(top: 2, bottom: 2)
        : (dat.toString().toLowerCase().trim().contains(search.text.toLowerCase().toString().trim()))
            ? sub_card(dat).pOnly(top: 2, bottom: 2)
            : null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          appikorn_text_field(
            maxLength: 200,
            regx: allCharacterRegx,
            suffixicon: Icon(search.text.isNotEmpty ? Icons.cancel : Icons.search).onTap(() {
              widget.onChanged("");
              search.text = "";
              load_more = false;
              setState(() {});
            }),
            lable: widget.lable,
            controller: search,
            onChanged: (s) {
              if (!load_more) {
                load_more = true;
              }
              setState(() {});
            },
          ),
          s3.heightBox,
          load_more
              ? appikorn_list_view(child: ({index}) => card(widget.list[index]), count: (widget.list.length)).h(widget.height)
              : appikorn_wrap(
                  spacing: 10,
                  controller: ScrollController(),
                  children: [
                    for (var k = 0; k <= 20; k++)
                      if (search.text.isEmpty && widget.list.length > k) ...[
                        sub_card(widget.list[k]).pOnly(top: 5, bottom: 5)
                      ] else if (widget.list.length > k && widget.list[k].toString().toLowerCase().contains(search.text.toLowerCase())) ...[
                        sub_card(widget.list[k]).pOnly(top: 5, bottom: 5)
                      ]
                  ],
                ).h(widget.height),
          s2.heightBox,
          search.text != ""
              ? Container()
              : appikorn_button(
                  width: 170,
                  onTap: () {
                    setState(() {
                      load_more = !load_more;
                    });
                  },
                  height: 40,
                  text: "Load more",
                  color: primary_color,
                  textColor: Colors.white,
                )
        ],
      ),
    );
  }
}
