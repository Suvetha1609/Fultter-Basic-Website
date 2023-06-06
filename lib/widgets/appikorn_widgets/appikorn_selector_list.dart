import '../../export.dart';
import 'appikorn_svg.dart';

class appikorn_selector_list extends StatelessWidget {
  const appikorn_selector_list({Key? key, required this.selected, required this.dat, required this.onTap, this.min_width, this.icons, this.heading, this.mandatory, this.chip_height, this.spacing})
      : super(key: key);

  final String selected;

  final List<String> dat;
  final List<String>? icons;
  final Function(String) onTap;
  final double? min_width;
  final double? chip_height;
  final double? spacing;
  final String? heading;
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (heading != null && heading!.isNotEmpty)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appikorn_text(
                text: heading!,
                mandatory: mandatory,
                maxLine: 9,
                weight: heading1_weight,
                color: text_color,
                size: f1,
              ).pOnly(bottom: 10).flexible(),
            ],
          ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < dat.length; i++)
                appikorn_button(
                  height: chip_height ?? b1,
                  width: min_width ?? 100,
                  onTap: () {
                    onTap!(dat[i]);
                  },
                  text: dat[i],
                  hovered_textColor: Colors.black,
                  hover_border: true,
                  prefix_icon: (icons != null && icons!.isNotEmpty) ? icon_widgtet(dat: icons?[i], color: selected == dat[i] ? Colors.white : null) : null,
                  textColor: selected == dat[i] ? Colors.white : null,
                  color: selected == dat[i] ? primary_color : Colors.transparent,
                ).pOnly(right: spacing ?? hs1)
            ],
          ),
        ),
      ],
    );
  }
}
