import 'package:newwatt/export.dart';
import 'package:newwatt/first_page/view/page_widgets.dart';

import 'about_us_widgets.dart';

class About_us_page extends StatelessWidget {
  const About_us_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            page_first_part(image:"assets/About_US_pics/img.png",text:"About Us",content: ""),
            s1.heightBox,
            about_page_widget(),
            s3.heightBox,
            whyzerowatt_about_page_widget(),
            about_highlight_widget(),
           about_screen_card(),
            page_footer_widget(),

          ],
        ),
      ),
    );
  }
}


