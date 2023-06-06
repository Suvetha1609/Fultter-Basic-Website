import 'package:flutter/material.dart';
import 'package:newwatt/export.dart';

import '../../first_page/view/page_widgets.dart';
import 'FAQ_widgets.dart';

class FAQ_page extends StatelessWidget {
  const FAQ_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
           children: [
             page_first_part(image:"assets/FAQ_pics/img.png",text: "FAQ",content: ""),
             s3.heightBox,
             faq_part_widget(),
           ],
        ),
      ),
    );
  }
}
