import 'package:newwatt/export.dart';
import 'package:newwatt/first_page/view/page_widgets.dart';
import 'package:newwatt/widgets/appikorn_widgets/appikorn_circle_image.dart';
import 'package:flutter/material.dart';
import 'package:newwatt/widgets/appikorn_widgets/appikorn_text_field_box.dart';

import '../../widgets/appikorn_widgets/appikorn_box/appikorn_box.dart';

class First_page extends StatelessWidget {
  const First_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            page_first_part(image:"assets/pics/img_9.png", text: "SERVICES"),
            50.heightBox,
            page_row_one_widget(),
            s3.heightBox,
            page_row_two_widget(),
            s3.heightBox,
            page_row_three_widget(),
            100.heightBox,
            page_footer_widget(),

          ],
        ),
      ),
    );

  }
}
