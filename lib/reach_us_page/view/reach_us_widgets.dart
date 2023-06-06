import '../../export.dart';
import '../../widgets/appikorn_widgets/appikorn_box/appikorn_box.dart';


Widget Reachus_row_one_widget(){
  return appikorn_box(
    fill_color: Colors.black12,
    child: Column(
    children: [
      Row(
        children: [
          Image.asset("assets/Reach_us_pics/img_1.png",width: 500,),
          Container(
            child: Column(
              children: [
                Image.asset("assets/Reach_us_pics/img_6.png",height: 70,),
                appikorn_text(text: "LET'S TALK", size: f1),
                appikorn_text(text: "Phone: 089397 00777", size: f1,color: Colors.black45,),
              ],
            ),
          ).w(700).flexible(),
          Row(
            children: [
              Image.asset("assets/Reach_us_pics/img_3.png",width: 500,),
            ],
          )
        ],
      )
    ],
  ),
  );
}

Widget Reachus_row_two_widget(){
  return appikorn_box(
    fill_color: Colors.black12,
    child: Column(
    children: [
      Row(
        children: [
          Container(
            child: Column(
              children: [
                Image.asset("assets/Reach_us_pics/img_5.png",height: 70,),
                appikorn_text(text: "CONTACT ADDRESS", size: f1),
                appikorn_text(text: "No:1/2, First Floor, Duraiswamy Rd,\nDr.Subbaraya Nagar, Vadapalani,", size: f1,color: Colors.black45,),
                appikorn_text(text: "Chennai-600026", size: f1,color: Colors.black45,),
              ],
            ),
          ).w(700).flexible(),
          Row(
            children: [
              Image.asset("assets/Reach_us_pics/img_2.png",width: 500,)
            ],
          ),
          Container(
            child: Column(
              children: [
                Image.asset("assets/Reach_us_pics/img_4.png",height: 40,),
                s1.heightBox,
                appikorn_text(text: "EMAIL US", size: f1),
                appikorn_text(text: "zerowattsstudios@gmail.com", size: f1,color: Colors.black45,),
              ],
            ),
          ).w(700).flexible(),
        ],
      )
    ],
  ),
  );
}


// Widget Reachus_last_part(){
//   return appikorn_box(
//     fill_color: Colors.black12,
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Column(
//       children: [
//         appikorn_text(text: "Ready to get started?", size: f1,color: Colors.black45,),
//       ],
//       ),
//     ],
//   ).wh(600, ),
//   );
// }

Widget Reachus_last_part(){
  return Row(
    children: [
      appikorn_box(
        fill_color: Colors.black12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ready to get started?"),
            s1.heightBox,
            appikorn_text_field(
              hint: "Name*",
              fillColor: Colors.white,
              radius: 5,
              borderColor: Colors.black45,
            ),
            s2.heightBox,
            appikorn_text_field(
              hint: "Mobile*",
              fillColor: Colors.white,
              radius: 5,
              borderColor: Colors.black45,
            ),
            s2.heightBox,
            appikorn_text_field(
              hint: "Email*",
              fillColor: Colors.white,
              radius: 5,
              borderColor: Colors.black45,
            ),
            s2.heightBox,
            appikorn_text_field(
              hint: "Subject",
              fillColor: Colors.white,
              radius: 5,
              borderColor: Colors.black45,
            ),
            s2.heightBox,
            appikorn_text_field(
              hint: "Message",
              fillColor: Colors.white,
              radius: 5,
              borderColor: Colors.black45,
              maxLines: 4,
            ),
            s2.heightBox,
            appikorn_button(width: 70,height: 30,onTap: (){}, text: "SEND MESSAGE",textColor: Colors.white,radius: 6,color: Colors.black,),
            s3.heightBox,
          ],
        ).p(20),
      ).wh(500, 550).p(35),
      s2.widthBox,
      appikorn_box(
        fill_color: Colors.black12,
        child: Column(
        children: [

        ],
      ),
      ).wh(500, 550).p(28),
    ],
  );
}




