import 'package:newwatt/widgets/appikorn_widgets/appikorn_wrap.dart';

import '../../export.dart';
import 'appikorn_svg.dart';

class appikorn_selector_grid extends StatelessWidget {
  const appikorn_selector_grid(
      {Key? key,
      required this.selected,
      required this.dat,
      required this.onTap,
      this.chip_min_width,
      this.icons,
      required this.height,
      this.chip_height,
      this.running_height,
      this.heading,
      this.mandatory})
      : super(key: key);

  final String selected;
  final String? heading;
  final List<String> dat;
  final List<String>? icons;
  final Function(String) onTap;
  final double? chip_min_width;
  final double height;
  final double? chip_height;
  final double? running_height;
  final bool? mandatory;

  Widget icon_widgtet({dat, color, height, width}) {
    return appikorn_svg(
      fit: BoxFit.contain,
      height: height ?? 30,
      width: width ?? 30,
      source: dat,
      color: secondary_color,
    ).pOnly(right: 14);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (heading != null && heading!.isNotEmpty)
          Row(
            children: [
              appikorn_text(
                mandatory: mandatory,
                text: heading!,
                weight: heading1_weight,
                maxLine: 10,
                size: f1,
              ).pOnly(bottom: 10).flexible(),
            ],
          ),
        appikorn_wrap(
          runSpacing: running_height ?? 10,
          spacing: 5,
          controller: ScrollController(),
          children: [
            for (var i = 0; i < dat.length; i++)
              appikorn_button(
                height: chip_height ?? b1,
                width: chip_min_width ?? 100,
                onTap: () {
                  onTap!(dat[i]);
                },
                text: dat[i],
                hovered_textColor: Colors.black,
                hover_border: true,
                prefix_icon: (icons != null && icons!.isNotEmpty) ? icon_widgtet(dat: icons![i], color: selected == dat[i] ? Colors.white : null) : null,
                textColor: selected == dat[i] ? Colors.white : null,
                color: selected == dat[i] ? primary_color : Colors.transparent,
              )
          ],
        ).h(height ?? 200),
      ],
    );
  }
}
