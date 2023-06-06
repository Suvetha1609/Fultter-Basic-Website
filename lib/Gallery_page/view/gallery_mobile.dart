import 'package:flutter/material.dart';
import 'package:newwatt/export.dart';
import 'package:newwatt/first_page/view/page_widgets.dart';

import '../../Video_page/view/video_page_widgets.dart';
import 'gallery_widgets.dart';

class Gallery_page extends StatelessWidget {
  const Gallery_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            page_first_part(image: "assets/Gallery_pics/img.png", text: "Gallery",content: " Choose from our wide range of portfolio layouts"),
            70.heightBox,
            Gallery_Row_one_widget(),
            s1.heightBox,
            Gallery_Row_three_widget(),
            s5.heightBox,
            page_footer_widget(),
          ],
        ),
      ),
    );
  }
}
