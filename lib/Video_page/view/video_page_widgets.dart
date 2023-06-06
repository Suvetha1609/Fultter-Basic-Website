import 'package:flutter/material.dart';
import 'package:newwatt/export.dart';

Widget Video_page_widget({image}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
        Image.asset("$image",)
    ],
  ).flexible();
}

Widget Video_Row_one_widget(){
  return Row(
    children: [
      s1.widthBox,
      Video_page_widget(image: "assets/Videos_pics/img_1.png"),
      s1.widthBox,
      Video_page_widget(image: "assets/Videos_pics/img_2.png"),
      s1.widthBox,
      Video_page_widget(image: "assets/Videos_pics/img_11.png"),
    ],
  );
}

Widget Video_Row_two_widget(){
  return Row(
    children: [
      s1.widthBox,
      Video_page_widget(image: "assets/Videos_pics/img_4.png"),
      s1.widthBox,
      Video_page_widget(image: "assets/Videos_pics/img_5.png"),
      s1.widthBox,
      Video_page_widget(image: "assets/Videos_pics/img_6.png"),
    ],
  );
}

Widget Video_Row_three_widget(){
  return Row(
      children: [
      s1.widthBox,
      Video_page_widget(image: "assets/Videos_pics/img_7.png"),
  s1.widthBox,
  Video_page_widget(image: "assets/Videos_pics/img_8.png"),
  s1.widthBox,
  Video_page_widget(image: "assets/Videos_pics/img_9.png"),
  ],
  );
}
