import 'package:flutter/material.dart';

// Color primary_color = Color(0xff1A4987);
Color primary_color = Colors.green;
Color secondary_color = Colors.red;
Color text_color = Color(0xff575757);
Color border_idle_color = Color(0xff7C7D7D);
Color secondary_color_menu = Color(0xfff5a011);
Color primary_color_menu = Color(0xff0d5d50);

change_color_theme({required primary, required secondary}) {
  var prime = int.parse(primary ?? "0");
  var second = int.parse(secondary ?? "0");
  if (prime != 0) {
    primary_color = Color(prime);
  }
  if (second != 0) {
    print("second color $second");
    secondary_color = Color(second);
  }
}
