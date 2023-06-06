import '../../Video_page/view/video_page_widgets.dart';
import '../../export.dart';
import '../../utils/global_size.dart';

Widget Gallery_Row_one_widget(){
  return Row(
    children: [
      s1.widthBox,
      Video_page_widget(image: "assets/Gallery_pics/img_5.png"),
      s1.widthBox,
      Video_page_widget(image: "assets/Gallery_pics/img_4.png"),
      s1.widthBox,
      Video_page_widget(image: "assets/Gallery_pics/img_2.png"),
    ],
  );
}

Widget Gallery_Row_three_widget(){
  return Row(
    children: [
      s1.widthBox,
      Video_page_widget(image: "assets/Gallery_pics/img_1.png"),
      s1.widthBox,
      Video_page_widget(image: "assets/Gallery_pics/img_3.png"),
      s1.widthBox,
      Container().w(400).flexible(),

    ],
  );
}