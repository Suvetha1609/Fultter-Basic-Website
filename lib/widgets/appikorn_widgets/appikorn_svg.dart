import 'package:flutter_svg/svg.dart';

import '../../export.dart';

class appikorn_svg extends StatelessWidget {
  const appikorn_svg({Key? key, required this.height, required this.width, required this.source, this.fit, this.color}) : super(key: key);

  final double height;
  final double width;
  final String source;
  final BoxFit? fit;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: SvgPicture.asset(
        color: color ?? Colors.grey,
        source,
        fit: fit ?? BoxFit.contain,
      ),
    ).centered();
  }
}
