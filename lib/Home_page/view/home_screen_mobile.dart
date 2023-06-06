import 'package:newwatt/export.dart';

import 'home_screen_widgets.dart';

class Home_page extends StatelessWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
       child: Column(
         children: [
           home_page_widget(),
           home_welcome_widget(),
           s5.heightBox,
           home_icon_cards_widget(),

         ],
       ),
    ),
    );
  }
}
