
import 'package:flutter/cupertino.dart';
import 'package:newwatt/export.dart';
import 'package:newwatt/widgets/appikorn_widgets/appikorn_box/appikorn_box.dart';

Widget page_first_part({image, text, content}){
  return appikorn_box(
    child: Stack(
      children: [
        Image.asset("$image",fit: BoxFit.cover,alignment: AlignmentDirectional.topCenter).wFull(Get.context!).h(500) ,
        appikorn_box(
            fill_color: Colors.black.withOpacity(0.6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
            Image.asset("assets/pics/img_10.png",).h(70).p(25),
                    Row(children: [
                      appikorn_text(text: "HOME", size: f1,color: Colors.white),
                      s5.widthBox,
                      appikorn_text(text: "ABOUT US", size: f1,color: Colors.white),
                      s5.widthBox,
                      appikorn_text(text: "SERVICES", size: f1,color: Colors.white),
                      s5.widthBox,
                      appikorn_text(text: "GALLERY", size: f1,color: Colors.white),
                      s5.widthBox,
                      appikorn_text(text: "VIDEOS", size: f1,color: Colors.white),
                      s5.widthBox,
                      appikorn_text(text: "FAQ", size: f1,color: Colors.white),
                      s5.widthBox,
                      appikorn_text(text: "REACH US", size: f1,color: Colors.white),
                      s4.widthBox,
                      VerticalDivider(
                        thickness: 1,
                         color: Colors.grey,
                      ).h(40),
                      s3.widthBox,
                      appikorn_button(width: 80,height: 30, onTap: () {} , text: "BOOK NOW", color: Colors.orange, textSize: f1, textColor: Colors.white,border: false, hover_border: true, radius: 4,),
                      s3.widthBox,
                    ],
                    ),
                  ],
                ).pOnly(bottom: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appikorn_text(text:"$text", size:40,color: Colors.white,),
                    s1.heightBox,
                    appikorn_text(text:"$content", size:f1,color: Colors.white60,),
                  ],
                ),//.pOn//.pOnly(top: 50)
              1.widthBox
            ],).h(500)
        ),
      ],
    )
  ).wFull(Get.context!).h(400);
}

Widget page_services_screen({required image, required text, required content, }) {
  return appikorn_box(
    fill_color: Colors.grey.withOpacity(0.1),
      child: Column(
        children: [
          Image.asset(image),s3.heightBox,
          appikorn_text(text: text, size: f2,maxLine: 10, color: Colors.black,),
          s1.heightBox,
          appikorn_text(text: content, size: f1, maxLine:10, color: Colors.grey[800],).p(25),
        ],
      )
  ).w(400).flexible();
}

Widget page_row_one_widget(){
  return Row(
    children: [
      25.widthBox,
      page_services_screen(
          image: "assets/pics/img_2.png",
          text: "Candid Photography",
          content: "Freezing moments as they are is like freezing memories from your wedding for you to treasure forever..."),
      25.widthBox,

      page_services_screen(
          image: "assets/pics/img_3.png",
          text: "Traditional Photography",
          content: "We say “Cheese” and you smile for us and these photos are some that let the memories never fade away..."),
      25.widthBox,
      page_services_screen(
          image: "assets/pics/img_4.png",
          text: "Traditional Videography",
          content: "Having a video that is a perfect documentation of your wedding is also quite important. A continuous video..."),
      25.widthBox,
    ],
  );
}

Widget page_row_two_widget(){
  return Row(
    children: [
      25.widthBox,
      page_services_screen(
          image: "assets/pics/img_5.png",
          text: "Cinematography",
          content: "A cinematic video of you wedding gives you the goose bumps of having fairy tale dreamy wedding..."),
      25.widthBox,

      page_services_screen(
          image: "assets/pics/img_6.png",
          text: "Pre-wedding Shoots",
          content: "Some of us love photo shoots. Decking up for it, clicking the picture and all of it is a lot of fun..."),
      25.widthBox,
      page_services_screen(
          image: "assets/pics/img_7.png",
          text: "Albums",
          content: "All that we have captured, coming together as a treasure for you is through the album. It has a story to say..."),
      25.widthBox,
    ],
  );
}

Widget page_row_three_widget(){
  return Row(
    children: [
      25.widthBox,
      page_services_screen(
          image: "assets/pics/img_8.png",
          text: "Photo Booth",
          content: "We create the space for you to pose for pictures as you wish and enjoy those moments. Your guests at your..."),

          Container().w(400).flexible(),
      Container().w(400).flexible(),
    ],
  );
}

Widget page_footer_widget() {
  return  appikorn_box(
    fill_color: Colors.black,
      child: Column(
         children: [
           Container(
             child: Row(
               children: [
                 Column(
                   children: [
                     70.heightBox,
                     appikorn_text(text: "Let's make something great together",size: f4, color: Colors.white).p(20),
                     appikorn_text(text:"Get in touch with us and send some basic info for a quick quote", size: f1, color: Colors.grey),
                   ],
                 ),
                 Spacer(),
                 appikorn_button(width: 100, onTap: () {}, text: "BOOK NOW",height:40,radius: 4,border: false,color: Colors.white,font_weight: FontWeight.w200,).p(35),
               ],
             ),
           ),
           s4.heightBox,
           Divider(
               color: Colors.grey,
             thickness: 0.1,
           ).p(30),
           Container(
             child: Row(
              children: [
                Image.asset("assets/pics/img_10.png",height: 70,),
                s2.widthBox,
                appikorn_text(text: "No:1/2, First Floor, Duraiswamy Rd,\nDr.Subbaraya Nagar, Vadapalani,Chennai, Tamil Nadu 600026",size: 18),
                s2.widthBox,
                appikorn_text(text: "+91 893 970 0777\nzerowattsstudios@gmail.com", size: 18,),
                (s2*3).widthBox,
                Icon(
                  Icons.facebook,
                  color: Colors.grey,
                ),
                s2.widthBox,
                Icon(
                  Icons.mail_outline,
                  color: Colors.grey,
                ),
                s2.widthBox,
                Icon(
                  Icons.adobe_outlined,
                  color: Colors.grey,
                ),
                s2.widthBox,
                Icon(
                  Icons.telegram,
                  color: Colors.grey,
                ),
              ],
             ),
           ),
           40.heightBox,
           Divider(
             color: Colors.grey,
             thickness: 0.1,
           ).p(30),
           appikorn_text(text: "Copyright © 2023 ZERO WATTS PHOTOGRAPHY. All rights reserved. Developed by appikorn", size: 10),
         ],
  ),
  ).wFull(Get.context!).h(500);
}



// Widget page_footer_widget(){
//   return appikorn_box(
//       fill_color: Colors.black,
//       child: Column(
//         children: [
//           30.heightBox,
//           appikorn_text(text: "Let's make something great together", size: f4,color: Colors.white,),
//           appikorn_text(text: "Get in touch with us and send some basic info for a quick quote", size: f2),
//           Row(
//             children: [
//               appikorn_button(width: 33, onTap: () {}, text: "mnvghg")
//             ],
//           )
//         ],
//       ).flexible(),
//   ).wFull(Get.context!).h(500);
// }



// Widget page_footer_widget() {
//   return Column(
//     children: [
//       appikorn_text(text: "Let's make something great together", size:f4,color: Colors.white,),
//       appikorn_text(text: "Get in touch with us and send some basic info for a quick quote", size:f2, color: Colors.grey,),
//       Row(
//
//       )
//     ],
//   ).color(Colors.black).wFull(Get.context!).h(500);
// }
