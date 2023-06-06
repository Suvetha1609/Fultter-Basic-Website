import '../../../../export.dart';

class appikorn_toggle_switch extends StatelessWidget {
  appikorn_toggle_switch({Key? key, required this.value, required this.onChanged, this.width, this.color}) : super(key: key);

  final bool value;
  final double? width;
  final Color? color;
  void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 40,
      child: Switch(activeColor: color ?? primary_color, value: value, onChanged: onChanged),
    );
  }
}
