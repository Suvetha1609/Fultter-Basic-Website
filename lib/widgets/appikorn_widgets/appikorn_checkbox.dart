import 'package:flutter/material.dart';

import '../../utils/global_color.dart';

class appikorn_checkbox extends StatelessWidget {
  appikorn_checkbox({Key? key, required this.value, required this.onChanged, this.width, this.color}) : super(key: key);

  final bool value;
  final double? width;
  final Color? color;
  void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 40,
      child: Checkbox(
        activeColor: color ?? primary_color,
        value: value,
        onChanged: (s) {
          onChanged(s);
        },
      ),
    );
  }
}
