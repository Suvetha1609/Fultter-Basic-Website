import 'package:newwatt/export.dart';
import '../../../../export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class appikorn_text_field_box extends StatelessWidget {
  const appikorn_text_field_box({Key? key, this.height, this.title, required this.width, required this.child}) : super(key: key);

  final double? height;
  final String? title;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 45,
        width: width,
        child: InputDecorator(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primary_color, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            enabled: true,
            labelText: title,
            labelStyle: TextStyle(
              color: primary_color,
              fontSize: f1,
            ),
          ),
          child: child,
        ));
  }
}
