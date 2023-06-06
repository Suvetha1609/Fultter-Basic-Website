import '../../export.dart';

class appikorn_chips extends StatelessWidget {
  const appikorn_chips({Key? key, required this.flag, required this.count, this.color}) : super(key: key);

  final String flag;
  final String count;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return VxContinuousRectangle(
            child: HStack(
              [
                appikorn_text(
                  text: "$flag",
                  size: f1,
                  color: primary_color,
                  weight: FontWeight.w700,
                ).centered().expand(),
                VxContinuousRectangle(
                  backgroundColor: color ?? primary_color,
                  child: appikorn_text(
                    text: "$count",
                    size: f2,
                    weight: FontWeight.w500,
                    color: Colors.white,
                  ).centered(),
                ).w(50).p4()
              ],
              alignment: MainAxisAlignment.spaceBetween,
              crossAlignment: CrossAxisAlignment.center,
            ),
            backgroundColor: Colors.white,
            borderSide: BorderSide(color: primary_color))
        .wh(160, 40);
  }
}
