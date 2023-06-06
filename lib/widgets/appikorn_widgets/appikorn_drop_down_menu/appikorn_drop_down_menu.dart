import 'package:newwatt/export.dart';
import 'package:newwatt/widgets/appikorn_widgets/appikorn_animated_hover_box.dart';
import "package:newwatt/widgets/appikorn_widgets/appikorn_drop_down_menu/dependancy.dart" as dp;

class appikorn_drop_down_menu extends StatelessWidget {
  const appikorn_drop_down_menu(
      {Key? key,
      this.fromColor,
      this.toColor,
      this.fromHeight,
      this.toHeight,
      this.fromWidth,
      this.toWidth,
      required this.parentWidget,
      required this.children,
      required this.offset,
      this.dropdownColor,
      this.dropdownElevation,
      this.dropdownRadius,
      this.itemHeight,
      required this.dropdownWidth,
      required this.dropdownHeight,
      this.fromRadius,
      this.tooltip,
      this.toRadius});

  final Widget parentWidget;
  final List<Widget> children;
  final Offset offset;
  final Color? dropdownColor;
  final double? dropdownRadius;
  final double dropdownWidth;
  final double dropdownHeight;
  final double? itemHeight;
  final int? dropdownElevation;
  final Color? fromColor;
  final Color? toColor;
  final double? fromHeight;
  final double? toHeight;
  final double? fromRadius;
  final double? toRadius;
  final double? fromWidth;
  final double? toWidth;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return appikorn_animated_hover_box(
      fromHeight: fromHeight ?? 30,
      fromWidth: fromWidth ?? 30,
      toHeight: toHeight,
      toWidth: toWidth,
      fromColor: fromColor ?? Colors.transparent,
      fromRadius: fromRadius ?? 100,
      toRadius: toRadius,
      toColor: toColor ?? secondary_color,
      child: ({hovered}) => Tooltip(
        decoration: BoxDecoration(
          color: primary_color,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        message: tooltip ?? "",
        child: DropdownButtonHideUnderline(
          child: dp.DropdownMenu(
            itemHeight: itemHeight ?? 36,
            isExpanded: true,
            customButton: parentWidget,
            items: children
                .map((item) => DropdownMenuItem<Widget>(
                      value: item,
                      child: item,
                    ))
                .toList(),
            onChanged: (value) {},
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            dropdownMaxHeight: dropdownHeight,
            dropdownWidth: dropdownWidth,
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(dropdownRadius ?? 10),
              color: dropdownColor ?? Colors.white,
            ),
            dropdownElevation: dropdownElevation ?? 2,
            scrollbarRadius: const Radius.circular(40),
            scrollbarThickness: 2,
            scrollbarAlwaysShow: true,
            offset: offset,
          ),
        ),
      ).centered(),
    );
  }
}
//////////////////////////////// HOW to USE /////////////////////////////////////////

// var children = [
//   IconButton(
//       onPressed: () {
//         print("presssed");
//       },
//       icon: Icon(Icons.add)),
//   "two".text.make(),
//   "three".text.make(),
//   "three".text.make(),
//   "three".text.make(),
//   "three".text.make(),
// ];

// VxBox(
// child: appikorn_drop_down_menu(
// offset: Offset(-50, -10),
// children: children,
// parentWidget: Icon(Icons.ac_unit),
// dropdownWidth: 200,
// dropdownHeight: 200,
// )).make().w(100).centered().pSymmetric(h: 40),
