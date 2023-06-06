import '../../../export.dart';

class appikorn_animated_hover_box extends StatefulWidget {
  const appikorn_animated_hover_box(
      {Key? key,
      this.animationDuration,
      required this.child,
      required this.fromHeight,
      this.toHeight,
      this.fromWidth,
      this.toWidth,
      this.fromRadius,
      this.toRadius,
      this.fromColor,
      this.toColor,
      this.from_elevation,
      this.to_elevation,
      this.ontap,
      this.decoration_img,
      this.border_color,
      this.border_width,
      this.childFromColor,
      this.childToColor})
      : super(key: key);

  final Duration? animationDuration;
  final double fromHeight;
  final child;
  final Function? ontap;
  final double? toHeight;
  final double? fromWidth;
  final double? toWidth;
  final double? fromRadius;
  final double? toRadius;
  final Color? fromColor;
  final Color? toColor;
  final Color? border_color;
  final double? border_width;
  final double? from_elevation;
  final double? to_elevation;
  final DecorationImage? decoration_img;
  final Color? childFromColor;
  final Color? childToColor;

  @override
  State<appikorn_animated_hover_box> createState() => _appikorn_animated_hover_boxState();
}

class _appikorn_animated_hover_boxState extends State<appikorn_animated_hover_box> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (s) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (s) {
        setState(() {
          isHovered = false;
        });
      },
      child: GestureDetector(
          onTap: () {
            if (widget.ontap != null)
              setState(() {
                print("ontap");
                widget.ontap!();
              });
          },
          onTapDown: (s) {
            setState(() {
              isHovered = true;
            });
          },
          onTapUp: (s) {
            setState(() {
              isHovered = false;
            });
          },
          child: AnimatedContainer(
            height: isHovered ? widget.toHeight ?? widget.fromHeight : widget.fromHeight,
            width: isHovered ? widget.toWidth ?? widget.fromWidth : widget.fromWidth,
            duration: widget.animationDuration ?? const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              image: widget.decoration_img,
              border: Border.all(color: widget.border_color ?? Colors.transparent, width: widget.border_width ?? 0.0),
            ),
            child: Material(
              color: isHovered ? widget.toColor ?? widget.fromColor ?? primary_color : widget.fromColor ?? primary_color,
              borderRadius: BorderRadius.all(Radius.circular(isHovered ? widget.toRadius ?? widget.fromRadius ?? 5 : widget.fromRadius ?? 5)),
              elevation: isHovered ? widget.to_elevation ?? widget.from_elevation ?? 0.0 : (widget.from_elevation ?? 0.0).toDouble(),
              child: widget.child(hovered: isHovered),
            ),
          )),
    );
  }
}
