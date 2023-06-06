import 'package:newwatt/export.dart';

class appikornTable extends StatelessWidget {
  appikornTable(
      {required this.titleWidget, required this.contentWidget, required this.count, this.headerColor, this.divider, this.width, required this.previous_ontap, required this.next_ontap, this.page_no});

  final List titleWidget;
  final List contentWidget;
  Colors? headerColor;
  final int count;
  final int? divider;
  final double? width;
  final Function() previous_ontap;
  final Function() next_ontap;
  final String? page_no;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DataTable2(
            showBottomBorder: true,
            minWidth: width ?? 1100,
            border: TableBorder(
              left: BorderSide(color: primary_color),
              right: BorderSide(color: primary_color),
              bottom: BorderSide(color: primary_color),
            ),
            headingRowColor: MaterialStateProperty.all(primary_color_menu),
            sortAscending: true,
            horizontalMargin: 10,
            fixedLeftColumns: divider ?? 0,
            columnSpacing: 0,
            columns: [
              for (var l in titleWidget)
                DataColumn2(
                  fixedWidth: l[1] == 0 ? null : double.parse(l[1].toString()),
                  // size: l[1] == "S" ? ColumnSize.S : null,
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      appikorn_text(
                        text: l[0],
                        size: f1,
                        color: Colors.white,
                      ),
                      l.length > 2 ? l[2] : Container()
                    ],
                  ),
                )
            ],
            rows: List<DataRow>.generate(
                count,
                (index) => DataRow(cells: [
                      for (var l in contentWidget) DataCell(Center(child: l(index: index))),
                    ]))).expand(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            appikorn_drop_down_menu(
                parentWidget: Row(
                  children: [
                    appikorn_text(
                      text: "${100}",
                      size: f1,
                      color: primary_color,
                    ),
                    Icon(
                      Icons.arrow_drop_down_sharp,
                      color: primary_color,
                    ).pOnly(bottom: 5)
                  ],
                ),
                offset: Offset(-MediaQuery.of(context).size.width * .007, MediaQuery.of(context).size.height * .15),
                dropdownWidth: 65,
                dropdownHeight: MediaQuery.of(context).size.height * .12,
                children: [
                  appikorn_text(
                    text: "50",
                    size: f0,
                    color: primary_color,
                  ).onTap(() {
                    print("50");
                  }),
                  appikorn_text(
                    text: "100",
                    size: f0,
                    color: primary_color,
                  ),
                  appikorn_text(
                    text: "200",
                    size: f0,
                    color: primary_color,
                  ),
                ]).w(50),
            10.widthBox,
            for (var k = 1; k < 4; k++)
              appikorn_text(
                text: "${k} | ",
                size: f1,
                color: page_no == k ? primary_color : secondary_color,
              ),
            IconButton(
                splashRadius: 20,
                onPressed: previous_ontap,
                icon: Icon(
                  Icons.arrow_circle_left_outlined,
                  color: primary_color,
                )),
            appikorn_text(
              text: "Prev",
              size: f0,
              color: primary_color,
            ),
            10.widthBox,
            appikorn_text(
              text: "|",
              size: f1,
              color: primary_color,
            ),
            10.widthBox,
            appikorn_text(
              text: "Next",
              size: f0,
              color: primary_color,
            ),
            IconButton(
                splashRadius: 20,
                onPressed: next_ontap,
                icon: Icon(
                  Icons.arrow_circle_right_outlined,
                  color: primary_color,
                )),
            10.widthBox,
            appikorn_text(
              text: "Go to Page:",
              size: f0,
              color: primary_color,
            ),
            5.widthBox,
            appikorn_text_field(
              controller: TextEditingController(text: page_no ?? "0"),
              contentPadding: EdgeInsets.zero,
              centerText: true,
              regx: numberRegx,
              borderColor: primary_color,
              border: true,
            ).wh(40, 30),
            5.widthBox,
            appikorn_button(width: 40, height: 40, onTap: () {}, text: "Go").wh(48, 30),
            20.widthBox
          ],
        )
      ],
    );
  }
}
