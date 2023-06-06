import 'package:newwatt/export.dart';

class appikorn_cirle_loader extends StatelessWidget {
  const appikorn_cirle_loader({this.color, this.thickness, required this.size});

  final Color? color;
  final double? thickness;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(strokeWidth: thickness ?? 2, valueColor: AlwaysStoppedAnimation<Color>(color ?? primary_color)).wh(size, size),
      ],
    );
  }
}
