import 'package:newwatt/export.dart';

class appikorn_loader extends StatelessWidget {
  const appikorn_loader({Key? key, this.logo, this.height}) : super(key: key);

  final bool? logo;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          if (logo != null && logo == true)
            Container(
              height: 170,
              width: 170,
              child: Image.asset("assets/logo_icon.png"),
            ),
          if (logo != null && logo == true)
            SizedBox(
              height: 15,
            ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Loading...",
              style: TextStyle(color: Color(0xff1A4987)),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 15,
              height: 15,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff1A4987)),
                strokeWidth: 2,
              ),
            )
          ])
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ).h(height ?? 200),
    );
  }
}
