import '../../export.dart';
import 'appikorn_wrap.dart';

class appikorn_search_chip extends StatefulWidget {
  appikorn_search_chip({Key? key, this.lable, required this.list, required this.height, required this.onChanged, required this.selected, this.heading, this.textcolor, this.textsize, this.mandatory})
      : super(key: key);
  final String? lable;
  final List<String> list;
  final double height;
  final Function(String) onChanged;
  final String selected;
  final String? heading;
  final Color? textcolor;
  final double? textsize;
  final bool? mandatory;

  @override
  State<appikorn_search_chip> createState() => _appikorn_search_chipState();
}

class _appikorn_search_chipState extends State<appikorn_search_chip> {
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
          if (widget.heading != null && widget.heading!.isNotEmpty)
            Row(
              children: [
                appikorn_text(
                  mandatory: widget.mandatory,
                  text: widget.heading!,
                  color: widget.textcolor,
                  weight: FontWeight.w600,
                  maxLine: 10,
                  size: widget.textsize ?? f1,
                ).pOnly(bottom: 10).flexible(),
              ],
            ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              (search.text != "" || (widget.list.length <= 10))
                  ? Container()
                  : TextButton(
                      onPressed: () {
                        setState(() {
                          load_more = !load_more;
                        });
                      },
                      child: appikorn_text(
                        text: "Load more",
                        size: f1,
                      )),
            ],
          ),
          load_more
              ? appikorn_list_view(child: ({index}) => card(widget.list[index]), count: (widget.list.length)).h(widget.list.length > 10 ? widget.height : 100)
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
                ).h(widget.list.length > 10 ? widget.height : 100),
          s2.heightBox,
        ],
      ),
    );
  }
}
