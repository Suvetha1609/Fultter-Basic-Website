import 'package:flutter/material.dart';
import 'package:newwatt/Video_page/view/video_page_widgets.dart';
import 'package:newwatt/export.dart';

import '../../first_page/view/page_widgets.dart';

class Video_page extends StatelessWidget {
  const Video_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            page_first_part(image: "assets/Videos_pics/img.png", text: "Videos", content: "Take a walk through on our Video portfolio"),
            70.heightBox,
            Video_Row_one_widget(),
            s1.heightBox,
            Video_Row_two_widget(),
            s1.heightBox,
            Video_Row_three_widget(),
            s5.heightBox,
            page_footer_widget(),
          ],
        ),
      ),
    );
  }
}
