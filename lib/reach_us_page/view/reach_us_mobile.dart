import 'package:flutter/material.dart';
import 'package:newwatt/export.dart';
import 'package:newwatt/reach_us_page/view/reach_us_widgets.dart';

import '../../first_page/view/page_widgets.dart';

class Reach_us_page extends StatelessWidget {
  const Reach_us_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Column(
           children: [
             page_first_part(image: "assets/Reach_us_pics/img.png", text: "Reach US", content: "To capture the best moments of life"),
             Reachus_row_one_widget(),
             Reachus_row_two_widget(),
             50.heightBox,
             Reachus_last_part(),
             page_footer_widget(),
           ],
    ),
    ),
    );
  }
}

