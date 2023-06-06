import '../../../../export.dart';
import '../../../../widgets/appikorn_widgets/appikorn_animated_hover_box.dart';
import '../../../../widgets/appikorn_widgets/appikorn_cirle_loader.dart';

class appikorn_button extends StatelessWidget {
  const appikorn_button(
      {Key? key,
      this.border,
      this.icon,
      this.prefix_icon,
      this.elevation,
      this.height,
      required this.width,
      this.radius,
      required this.onTap,
      required this.text,
      this.color,
      this.splashColor,
      this.textSize,
      this.textColor,
      this.load,
      this.font_weight,
      this.hover_border,
      this.hovered_textColor})
      : super(key: key);

  final double? elevation;
  final Widget? icon;
  final Widget? prefix_icon;
  final double? height;
  final double? width;
  final double? radius;
  final Function() onTap;
  final String text;
  final double? textSize;
  final FontWeight? font_weight;
  final Color? textColor;
  final Color? hovered_textColor;
  final Color? color;
  final Color? splashColor;
  final bool? load;
  final bool? border;
  final bool? hover_border;

  @override
  Widget build(BuildContext context) {
    return (load == null || load == false)
        ? (!kIsWeb)
            ? ButtonTheme(
                shape: RoundedRectangleBorder(
                    side: new BorderSide(color: color == null || color == Colors.transparent ? border_idle_color : Colors.transparent), borderRadius: new BorderRadius.circular(radius ?? 7)),
                child: MaterialButton(
                  splashColor: Colors.transparent,
                  elevation: elevation ?? 0,
                  height: height ?? b1,
                  minWidth: width,
                  color: (color == null || color == Colors.transparent) ? Colors.white : color,
                  onPressed: () {
                    onTap();
                    FocusScope.of(context).unfocus();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      prefix_icon ?? 0.widthBox,
                      appikorn_text(
                        text: text,
                        size: f1,
                        weight: font_weight,
                        color: textColor ?? text_color,
                      ),
                      icon ?? 0.widthBox
                    ],
                  ).fittedBox(fit: BoxFit.contain),
                ),
              )
            : appikorn_animated_hover_box(
                animationDuration: Duration(milliseconds: 10),
                fromColor: Colors.white,
                fromRadius: radius ?? 7,
                border_width: (border != null && border == false) ? 0 : 1,
                child: ({hovered}) => ButtonTheme(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: !hovered
                            ? (border != null && border == false)
                                ? Colors.transparent
                                : primary_color.withOpacity(0.5)
                            : (hover_border != null || hover_border == true)
                                ? secondary_color
                                : Colors.transparent),
                    borderRadius: BorderRadius.circular(radius ?? 7),
                  ),
                  child: MaterialButton(
                    splashColor: Colors.transparent,
                    elevation: 0,
                    height: height ?? b1,
                    minWidth: width,
                    color: hovered
                        ? (hover_border != null || hover_border == true)
                            ? Colors.white
                            : primary_color
                        : color == Colors.transparent
                            ? Colors.white
                            : color,
                    onPressed: () {
                      onTap();
                      FocusScope.of(context).unfocus();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        appikorn_text(
                          text: text,
                          size: f1,
                          color: hovered ? hovered_textColor ?? Colors.white : textColor ?? text_color,
                        ),
                        icon ?? 0.widthBox
                      ],
                    ).fittedBox(fit: BoxFit.contain),
                  ),
                ),
                fromHeight: height ?? b1,
                from_elevation: 0,
              )
        : SizedBox(
            height: b1,
            width: width,
            child: Center(
              child: appikorn_cirle_loader(
                size: height ?? b1 - 10,
                thickness: 3,
              ),
            ),
          );
  }
}
