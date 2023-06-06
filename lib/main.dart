import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newwatt/reach_us_page/view/reach_us_mobile.dart';

import 'About_US_page/view/about_us_mobile.dart';
import 'FAQ/view/FAQ_mobile.dart';
import 'Gallery_page/view/gallery_mobile.dart';
import 'Home_page/view/home_screen_mobile.dart';
import 'Home_page/view/home_screen_widgets.dart';
import 'Video_page/view/Video_page_mobile.dart';
import 'first_page/view/first_page_mobile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ZERO WATTS",
      home: Home_page(),//About_us_page(),
    );
  }
}

