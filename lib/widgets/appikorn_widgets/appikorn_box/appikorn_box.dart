import '../../../export.dart';

class appikorn_box extends StatelessWidget {
  const appikorn_box({Key? key, this.radius, this.border_color, this.fill_color, this.gradient_color, required this.child, this.elevation, this.border_thickness, this.border}) : super(key: key);

  final double? radius;
  final double? border_thickness;
  final double? elevation;
  final Color? border_color;
  final Color? fill_color;
  final Gradient? gradient_color;
  final Widget child;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
        elevation: elevation ?? 0,
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 0)),
        color: Colors.transparent,
        child: Container(
            child: child,
            decoration: BoxDecoration(
                gradient: gradient_color,
                border: border ?? Border.all(color: border_color ?? Colors.transparent, width: border_thickness ?? 1),
                borderRadius: border != null ? null : BorderRadius.all(Radius.circular(radius ?? 0)),
                color: fill_color ?? Colors.white)));
  }
}
