import 'package:newwatt/widgets/appikorn_widgets/appikorn_circle_image.dart';

import '../../export.dart';
import '../../widgets/appikorn_widgets/appikorn_box/appikorn_box.dart';

Widget about_page_widget(){
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
appikorn_text(text: "ABOUT ZERO WATTS", size: f3),
          Divider(
            thickness: 8,
            color: Colors.black,
          ).wh(250,50),
         appikorn_text(text:"""Some moments that pass in a fraction of a second could be the ones that you want to 
carry in your heart forevermore. How about some lovesome moments at your wedding? A 
one where you got quite emotional, a one where you were over joyed, a one which got 
you stunned and many tiny sprinkles of beautiful emotions. Won’t you always want to 
visit those moments again? Freeze the moment and it can never be bound by time. 
Freeze those aesthetic moments and revisit them to re-experience the joy of living 
through those joyous moments. We at Zero Watts freeze your aesthetic moments 
aesthetically. We have been freezing moments, memories and joy since 2017. Ever since 
we started looking at your beauteous moments through our lens, we couldn’t stop 
ourselves from admiring them. We don’t stop with just setting frames, we search for your 
joy. We don’t stop with looking for angles, we freeze your emotions. We know how 
precious every moment at your wedding is so we have taken the effort to understand
what could mean boundlessly to you and we never give it a chance. Treasure your fairy 
tale wedding and double check that you do it with Zero Watts.""", size: f1,maxLine: 50,),
         s2.heightBox,
          appikorn_button(width: 80, onTap: (){}, text: "EXPLORE GALLERY", radius: 1,color: Colors.black,textColor: Colors.white,border: false),
        ],
      ),
      s5.widthBox,
      Image.asset("assets/About_US_pics/img_1.png",height: 350,).flexible(),
    ],
  ).p(50);
}


Widget whyzerowatt_about_page_widget(){
  return Row(
    children: [
      appikorn_box(
        fill_color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
            appikorn_text(text: "Why Zero Watts", size: f3, color: Colors.white,),
            s1.heightBox,
              appikorn_text(text: """• We are artistic when it comes to capturing your aesthetic moments.
• We are committed in providing you all that you’d need from our end; An ear to your requirements, 
  service to your comfort and work that reaches your expectations.
• We see beauty in everything and we believe that it has to be as it is.
• Our in-house photography and videography experts come together on your big day to make it even 
  more special for you.
• We are bound to our time limits and we deliver photos, videos and albums on time as we promise 
  you. We know you’re excited to see what we have captured.""", size: f1,color: Colors.grey,maxLine: 50),
            30.heightBox,
            appikorn_button(width: 50, onTap: (){}, text:"EXPLORE SERVICES",radius: 15,color: Colors.black ,textColor: Colors.white,height: 35,hover_border: true,hovered_textColor: Colors.black,),
      ],
          ).p(50),
      ).wh(850, 350),
      Image.asset("assets/About_US_pics/img_2.png",height: 350,).flexible(),
    ],
  );
}

// Widget about_highlight_widget(){
//   return Stack(
//     children: [
//       Image.asset("assets/About_US_pics/img_3.png").wFull(Get.context!).h(400),
//       appikorn_box(
//         child: Column(
//         children: [
//           appikorn_text(text: "OUR HIGHLIGHTS", size: f4),
//           Row(
//             children: [
//               appikorn_box(
//                 fill_color:Colors.red,
//                 child: Column(
//                 children: [
//                   Text("Perfection"),
//                   s1.heightBox,
//                   appikorn_text(text: """We never take a chance
// when it comes to
// moments that add
// meaning. Composing
// frames, fitting in
// lightings and capturing
// moments aesthetically is
// what we call ourselves
// as perfectionists.""", size: f1,maxLine: 30,)
//                 ],
//               ),
//               ).wh(200,300),
//             ],
//           )
//         ],
//
//       ),
//       ),
//     ],
//   ).wFull(Get.context!).h(400);
// }

// Widget about_highlight_widget(){
//   return Container(
//     decoration: BoxDecoration(
//       image: DecorationImage(
//         image: AssetImage("assets/About_US_pics/img_3.png"),
//         fit: BoxFit.cover,
//       )
//     ),
//   );
// }

Widget about_highlight_widget(){
  return appikorn_box(child: Stack(
    children: [
      Image.asset("assets/About_US_pics/img_3.png",fit: BoxFit.cover,).wFull(Get.context!).h(500),
      s2.heightBox,
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             appikorn_text(text: "OUR HIGHLIGHTS", size: 30,weight: FontWeight.w600,),
             s4.heightBox,
             Row(
               children: [
                 about_highlight_card_widget(text:"Perfection",content:"""We never take a chance 
   when it comes to 
   moments that add 
  meaning. Composing
   frames, fitting in 
  lightings and capturing 
 moments aesthetically is 
  what we call ourselves 
   as perfectionists.""" ),
                 about_highlight_card_widget(text:"Creative",content:""" Having an eye for
   moments, standing
  behind the lens while
   adding our touch of
  innovation, together has
   brought out the beauty
    in every moment we
        capture.""" ),
                 about_highlight_card_widget(text: "Satisfaction",content:  """ Your happiness is what
 we strive for. We wait to
 inner happiness on your
 face, be it on the day of
  your wedding or while
   looking at what we
  captured on the day."""),
                 about_highlight_card_widget(text: "Friendly Approach", content:"""   We are not
  photographers. Don’t
  call us your friends. We
  are your family. Talking
    to us is as easy as
  talking to your family.
  We love what we can do
        for you."""),
               ],
             )
//              Row(
//                children: [
//                  appikorn_box(
//                    fill_color: Colors.white,
//                    child: Column(
//                    children: [
//                      35.heightBox,
//                      appikorn_text(text: "Perfection", size: f1),
//                      10.heightBox,
//                      appikorn_text(text: """We never take a chance
//   when it comes to
//   moments that add
//  meaning. Composing
//   frames, fitting in
//  lightings and capturing
// moments aesthetically is
//  what we call ourselves
//   as perfectionists.""", size: f1,maxLine: 30,),
//                    ],
//                  ),
//                  ).wh(220, 300),30.widthBox,
//                  appikorn_box(
//                    fill_color: Colors.white,
//                    child: Column(
//                      children: [
//                        35.heightBox,
//                        appikorn_text(text: "Creative", size: f1),
//                        10.heightBox,
//                        appikorn_text(text: """ Having an eye for
//   moments, standing
//  behind the lens while
//   adding our touch of
//  innovation, together has
//   brought out the beauty
//    in every moment we
//        capture.""", size: f1,maxLine: 30,),
//                      ],
//                    ),
//                  ).wh(220, 300),30.widthBox,
//                  appikorn_box(
//                    fill_color: Colors.white,
//                    child: Column(
//                      children: [
//                        35.heightBox,
//                        appikorn_text(text: "Satisfaction", size: f1),
//                        10.heightBox,
//                        appikorn_text(text: """ Your happiness is what
// we strive for. We wait to
// inner happiness on your
// face, be it on the day of
//  your wedding or while
//   looking at what we
//  captured on the day.""", size: f1,maxLine: 30,),
//                      ],
//                    ),
//                  ).wh(220, 300),30.widthBox,
//                  appikorn_box(
//                    fill_color: Colors.white,
//                    child: Column(
//                      children: [
//                        35.heightBox,
//                        appikorn_text(text: "Friendly approach", size: f1),
//                        10.heightBox,
//                        appikorn_text(text: """   We are not
//  photographers. Don’t
//  call us your friends. We
//  are your family. Talking
//    to us is as easy as
//  talking to your family.
//  We love what we can do
//         for you.""", size: f1,maxLine: 30,),
//                      ],
//                    ),
//                  ).wh(220, 300),30.widthBox,
//                ],
//              ),
           ],
         ).p(60),
        ],
      ),
    ],
  ),
  ).wFull(Get.context!).h(500);
}

Widget about_highlight_card_widget({text, content}){
  return Row(
    children: [
      appikorn_box(
        fill_color: Colors.white,
        child: Column(
          children: [
            35.heightBox,
            appikorn_text(text: text, size: f1),
            10.heightBox,
            appikorn_text(text: content, size: f1,maxLine: 30,),
          ],
        ),
      ).wh(220, 300),30.widthBox,
    ],
  );

}

Widget about_screen_card({image,text, content,word}){
  return appikorn_box(
    fill_color: Colors.grey,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
      children: [
        Column(
          children: [
            appikorn_text(text: "WHAT PEOPLE SAY", size: f1),
            appikorn_text(text: "CLIENTS WORDS", size: f4,weight: FontWeight.w600,color: Colors.black,),
            Divider(
              thickness: 3,
              color: Colors.orange[900],
            ).wh(100,15),
            60.heightBox,
            Row(
              children: [
            about_screen_box_widget(image:"assets/avatar/img_3.png", text: """ For all the efforts you guys took,for
               being in touch constantly, for setting
               up the best team,for keeping intact
                 with all the poses and angles i
                 exactly needed and helping me
                 throughout set up each pose,the
               equipments,editing,setup,everything
                  was thoroughly professional👍🏻
                 surely top photography work in
                 Chennai, would like to collaborate
                          more in future ❤️""", content: "SANTU KASHYAP", words: "LOCAL GUIDE"),
            s3.widthBox,
            about_screen_box_widget(image: "assets/avatar/img_2.png", text: """  Planning a wedding during Covid is
  itself a daunting task but Zero Watts
   made it a lot easier for us when it
   came to photography. They even
  arranged a live streaming for us in
  the last minute. They were totally
   flexible and the price was very
  reasonable too. Above all the service
  was top notch. Thanks to the entire
                ZW team.! ️""", content: "ANUSHA KUMAR", words: "LOCAL GUIDE"),
                s3.widthBox,
                about_screen_box_widget(image: "assets/avatar/img.png", text: """  We have worked with zero watts..
  They are one of the best crew in the
  city and krithika is a person with the
  finest customer relationship quality
  who gets you the best deal you are
               in need of. ️""", content: "SIVAKUMAR SELVAKUMARAN", words: "LOCAL GUIDE"),
                s3.widthBox,
                about_screen_box_widget(image: "assets/avatar/img_1.png", text: """  Perfect crew, highly recommended
  for couple photography and wedding
   events. you have provided good &
        friendly customer service.""", content:"AGNA PANDIAN", words: "LOCAL GUIDE"),
                s3.widthBox,
                about_screen_box_widget(image:"assets/avatar/img_3.png", text:"""  The service provided by Zero watts
  was really wonderful. The camera
  man (NIRANJAN) made a fantastic
   job, indeed everyone in the team
  were really supportive and idealistic.
  (NANDHIYA) who assisted us for the
  edits, made sure we are satisfied in
         every pixels of the shots.
              SPLENDID TEAM!!!!
                    by
          SAM JENIX & SUNITHA  ️""", content:"SAM JENIX", words:"LOCAL GUIDE" )

              ],
            )
 //           Row(
 //              children: [
 //                appikorn_box(
 //                    elevation: 5,
 //                    fill_color: Colors.white,
 //                    child: Column(
 //                      children: [
 //                        appikorn_circle_image(url:"assets/avatar/img_3.png",size: 100,),
 //                        s2.heightBox,
 //                        appikorn_text(text:"""  For all the efforts you guys took,for
 // being in touch constantly, for setting
 //  up the best team,for keeping intact
 //    with all the poses and angles i
 //    exactly needed and helping me
 //   throughout set up each pose,the
 // equipments,editing,setup,everything
 //    was thoroughly professional👍🏻
 //    surely top photography work in
 //   Chennai, would like to collaborate
 //            more in future ❤️""", size: f1, maxLine: 30,alignment: TextAlign.center,),
 //                        s2.heightBox,
 //                        appikorn_text(text: "SANTU KASHYAP", size: f1 , maxLine: 30,alignment: TextAlign.center,color: Colors.black,),
 //                        appikorn_text(text: "LOCAL GUIDE", size: f1 , maxLine: 30,alignment: TextAlign.center,),
 //                      ],
 //                    )
 //                ).w(330).h(400),
 //                s3.widthBox,
 //                appikorn_box(
 //                    elevation: 5,
 //                    fill_color: Colors.white,
 //                    child: Column(
 //                      children: [
 //                        appikorn_circle_image(url:"assets/avatar/img_2.png",size: 100,),
 //                        s2.heightBox,
 //                        appikorn_text(text:"""  Planning a wedding during Covid is
 // itself a daunting task but Zero Watts
 //  made it a lot easier for us when it
 //  came to photography. They even
 // arranged a live streaming for us in
 // the last minute. They were totally
 //  flexible and the price was very
 // reasonable too. Above all the service
 // was top notch. Thanks to the entire
 //              ZW team.! ️""", size: f1, maxLine: 30,alignment: TextAlign.center,),
 //                        s2.heightBox,
 //                        appikorn_text(text: "ANUSHA KUMAR", size: f1 , maxLine: 30,alignment: TextAlign.center,color: Colors.black,),
 //                        appikorn_text(text: "LOCAL GUIDE", size: f1 , maxLine: 30,alignment: TextAlign.center,),
 //                      ],
 //                    )
 //                ).w(330).h(400),
 //                s3.widthBox,
 //                appikorn_box(elevation: 5,fill_color: Colors.white,
 //                    child: Column(children: [
 //                      appikorn_circle_image(url:"assets/avatar/img.png",size: 100,),
 //                      s2.heightBox,
 //                      appikorn_text(text:"""  We have worked with zero watts..
 // They are one of the best crew in the
 // city and krithika is a person with the
 // finest customer relationship quality
 // who gets you the best deal you are
 //              in need of. ️""", size: f1, maxLine: 30,alignment: TextAlign.center,),
 //                      s2.heightBox,
 //                      appikorn_text(text: "SIVAKUMAR SELVAKUMARAN", size: f1 , maxLine: 30,alignment: TextAlign.center,color: Colors.black,),
 //                      appikorn_text(text: "LOCAL GUIDE", size: f1 , maxLine: 30,alignment: TextAlign.center,),
 //                    ],
 //                    )
 //                ).w(330).h(400),
 //                s3.widthBox,
 //                appikorn_box(elevation: 5,fill_color: Colors.white,
 //                    child: Column(children: [
 //                      appikorn_circle_image(url:"assets/avatar/img_1.png",size: 100,),
 //                      s2.heightBox,
 //                      appikorn_text(text:"""  Perfect crew, highly recommended
 // for couple photography and wedding
 //  events. you have provided good &
 //      friendly customer service.""", size: f1, maxLine: 30,alignment: TextAlign.center,),
 //                      s2.heightBox,
 //                      appikorn_text(text: "AGNA PANDIAN", size: f1 , maxLine: 30,alignment: TextAlign.center,color: Colors.black,),
 //                      appikorn_text(text: "LOCAL GUIDE", size: f1 , maxLine: 30,alignment: TextAlign.center,),
 //                    ],
 //                    )
 //                ).w(330).h(400),
 //                s3.widthBox,
 //                appikorn_box(elevation: 5,fill_color: Colors.white,
 //                    child: Column(children: [
 //                      appikorn_circle_image(url:"assets/avatar/img_3.png",size: 100,),
 //                      s2.heightBox,
 //                      appikorn_text(text:"""  The service provided by Zero watts
 // was really wonderful. The camera
 // man (NIRANJAN) made a fantastic
 //  job, indeed everyone in the team
 // were really supportive and idealistic.
 // (NANDHIYA) who assisted us for the
 // edits, made sure we are satisfied in
 //      every pixels of the shots.
 //           SPLENDID TEAM!!!!
 //                 by
 //       SAM JENIX & SUNITHA  ️""", size: f1, maxLine: 30,alignment: TextAlign.center,),
 //                      s2.heightBox,
 //                      appikorn_text(text: "SAMM JENIX", size: f1 , maxLine: 30,alignment: TextAlign.center,color: Colors.black,),
 //                      appikorn_text(text: "LOCAL GUIDE", size: f1 , maxLine: 30,alignment: TextAlign.center,),
 //                    ],
 //                    )
 //                ).w(330).h(400),
 //              ],
 //            )
          ],
        )
      ],
  ),
    ),
  ).h(700);
}

Widget about_screen_box_widget({image, text, content, words}){
  return Row(
    children: [
      appikorn_box(
          elevation: 5,
          fill_color: Colors.white,
          child: Column(
            children: [
              appikorn_circle_image(url:image,size: 100,),
              s2.heightBox,
              appikorn_text(text: text, size: f1, maxLine: 30,alignment: TextAlign.center,),
              s2.heightBox,
              appikorn_text(text: content, size: f1 , maxLine: 30,alignment: TextAlign.center,color: Colors.black,),
              appikorn_text(text: words, size: f1 , maxLine: 30,alignment: TextAlign.center,),
            ],
          )
      ).w(330).h(400),
      s3.widthBox,
    ],
  );
}