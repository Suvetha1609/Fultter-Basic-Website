import '../../export.dart';

class appikorn_linear_progress_indicator extends StatelessWidget {
  const appikorn_linear_progress_indicator({Key? key, required this.len, required this.current_position, this.size, required this.from_position}) : super(key: key);

  final double len;
  final double current_position;
  final double from_position;
  final size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TweenAnimationBuilder<double>(
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOut,
        tween: Tween<double>(
          begin: from_position,
          end: double.parse(current_position.toString()),
        ),
        builder: (context, value, _) => Stack(
          children: [
            LinearProgressIndicator(
              value: value,
              color: secondary_color,
              minHeight: 7,
            ),
            Transform.translate(
              offset: Offset(0, -9),
              child: Align(
                alignment: Alignment.lerp(Alignment.topLeft, Alignment.topRight, value)!,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      border: Border.all(color: secondary_color, width: 2),
                      color: Colors.white),
                  child: appikorn_text(
                    color: secondary_color,
                    text: "${(value * 100).round()}%",
                    size: f1,
                  ).centered(),
                ).wh(40, 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
