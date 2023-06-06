import '../../export.dart';

class appikorn_stepper extends StatelessWidget {
  appikorn_stepper({Key? key, required this.len, required this.current_position, required this.radius}) : super(key: key);

  final int len;
  final int current_position;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var k = 0; k < len; k++)
          Row(
            children: [
              VxCircle(
                radius: radius,
                backgroundColor: current_position > k ? primary_color.withOpacity(0.5) : Colors.transparent,
                border: Border.all(color: Colors.blueAccent, width: 2),
                child: appikorn_text(
                  text: (k + 1).toString(),
                  size: f1,
                ).centered(),
              ),
              if (k < len - 1)
                Divider(
                  thickness: 2,
                  color: current_position > k + 1 ? primary_color : Colors.grey.withOpacity(0.4),
                ).w(30)
            ],
          )
      ],
    );
  }
}
