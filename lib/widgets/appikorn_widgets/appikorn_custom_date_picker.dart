import 'package:newwatt/widgets/appikorn_widgets/appikorn_box/appikorn_box.dart';
import 'package:newwatt/widgets/appikorn_widgets/appikorn_selector_grid.dart';

import '../../export.dart';
import 'appikorn_cirle_loader.dart';

class appikorn_custom_date_picker extends StatefulWidget {
  appikorn_custom_date_picker(
      {Key? key,
      required this.start_year,
      required this.end_year,
      required this.future_date,
      this.child_widget,
      this.date_prefill,
      required this.onChange,
      this.heading,
      this.mandatory,
      this.loading,
      this.read_only})
      : super(key: key);

  final int start_year;
  final int end_year;
  final bool future_date;
  final Widget? child_widget;
  final String? date_prefill;
  final Function(String) onChange;
  final String? heading;
  final bool? mandatory;
  final bool? loading;
  final bool? read_only;

  @override
  State<appikorn_custom_date_picker> createState() => _appikorn_custom_date_pickerState();
}

class _appikorn_custom_date_pickerState extends State<appikorn_custom_date_picker> {
  var date = "";
  var month = "";
  var year = "";
  var selected = 0;
  var seporator = "";
  late var final_date = [date, month, year];

  List<Widget> format = [1.widthBox, 1.widthBox, 1.widthBox];

  get_date_format() {
    if (date_format.split("/").length > 1) {
      print("/");
      seporator = "/";

      var date_index = date_format.split("/").indexWhere((element) => element.toLowerCase().contains("dd"));
      var month_index = date_format.split("/").indexWhere((element) => element.toLowerCase().contains("mm"));
      var year_index = date_format.split("/").indexWhere((element) => element.toLowerCase().contains("yyyy"));

      format[date_index] = date_card(data: date == "" ? "DD" : date, ontap_index: 1);
      format[month_index] = month_widget();
      format[year_index] = year_widget();

      final_date[date_index] = date;
      final_date[month_index] = month;
      final_date[year_index] = year;
    } else if (date_format.split("-").length > 1) {
      print("-");
      seporator = "-";

      var date_index = date_format.split("-").indexWhere((element) => element.toLowerCase().contains("dd"));
      var month_index = date_format.split("-").indexWhere((element) => element.toLowerCase().contains("mm"));
      var year_index = date_format.split("-").indexWhere((element) => element.toLowerCase().contains("yyyy"));

      format[date_index] = date_card(data: date == "" ? "DD" : date, ontap_index: 1);
      format[month_index] = month_widget();
      format[year_index] = year_widget();
      final_date[date_index] = date;
      final_date[month_index] = month;
      final_date[year_index] = year;
    }
    setState(() {
      bind();
    });
  }

  date_widget() {
    return date_card(data: date == "" ? "DD" : date, ontap_index: 1);
  }

  month_widget() {
    return date_card(data: month == "" ? "MM" : month, ontap_index: 2);
  }

  int calculateAge(DateTime dateOfBirth) {
    DateTime now = DateTime.now();
    int age = now.year - dateOfBirth.year;
    if (now.month < dateOfBirth.month || (now.month == dateOfBirth.month && now.day < dateOfBirth.day)) {
      age--;
    }
    return age;
  }

  year_widget() {
    return date_card(data: year == "" ? "YYYY" : year, ontap_index: 3);
  }

  bind() {
    var output = final_date.join("/");
    print("this is sdate $output");
    widget.onChange(output);
  }

  @override
  void initState() {
    super.initState();
    print("this is prefill ${widget.date_prefill}");

    if (widget.date_prefill != null && widget.date_prefill!.isNotEmpty) {
      date = widget.date_prefill!.split("/")[0];
      month = widget.date_prefill!.split("/")[1];
      year = widget.date_prefill!.split("/")[2];
    }

    get_date_format();
  }

  Widget lst({required data, ontap, type}) {
    var dat = "";
    if (type == "DD") {
      dat = date;
    } else if (type == "MM") {
      dat = month;
    } else {
      dat = year;
    }
    return appikorn_box(
        border_color: Colors.grey.withOpacity(0.5),
        radius: 5,
        child: appikorn_selector_grid(
          running_height: 1,
          height: 150,
          chip_min_width: 60,
          selected: dat,
          dat: data,
          onTap: (s) {
            if (widget.read_only == null || widget.read_only == false) {
              setState(() {
                get_date_format();
                if (type == "DD") {
                  date = s;
                } else if (type == "MM") {
                  month = s;
                } else {
                  year = s;
                }
                selected = 0;
              });
              get_date_format();
            }
          },
          chip_height: 40,
        ).h(150).p(10));
  }

  Widget date_card({required data, required ontap_index}) {
    return appikorn_box(
            child: appikorn_text(
      text: "$data",
      weight: FontWeight.w500,
      size: f1 + 1,
    ).centered())
        .onTap(() {
      if (widget.read_only == null || widget.read_only == false) {
        setState(() {
          if (selected == ontap_index) {
            selected = 0;
          } else {
            selected = ontap_index;
          }
        });
      }
    }).expand();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.heading != null && widget.heading!.isNotEmpty)
          Row(
            children: [
              appikorn_text(
                size: f1,
                mandatory: widget.mandatory,
                text: widget.heading!,
                weight: FontWeight.w600,
                maxLine: 10,
              ).pOnly(bottom: 10).flexible(),
            ],
          ),
        (widget.loading != null && widget.loading == true)
            ? appikorn_cirle_loader(size: 40)
            : Container(
                height: b1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(0),
                    ),
                    border: Border.all(color: border_idle_color.withOpacity(0.3)),
                    color: Colors.transparent),
                child: Row(
                  children: [
                    if (widget.child_widget != null)
                      Container(
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: widget.child_widget,
                      ).expand(),
                    for (var k in format) ...[
                      VerticalDivider(
                        width: 1,
                      ),
                      k
                    ]
                  ],
                ),
              ),
        10.heightBox,
        if (selected == 1) ...[
          lst(data: [
            for (var k = 1; k <= 31; k++) k.toString().padLeft(2, '0'),
          ], type: "DD")
        ] else if (selected == 2) ...[
          lst(data: [for (var k = 1; k <= 12; k++) k.toString().toString().padLeft(2, '0')], type: "MM")
        ] else if (selected == 3) ...[
          lst(data: [for (int k = widget.start_year; k <= widget.end_year; k++) k.toString()], type: "YYYY")
        ]
      ],
    );
  }
}
