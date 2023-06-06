import 'package:newwatt/widgets/appikorn_widgets/appikorn_circle_image.dart';

import '../../export.dart';
import '../../widgets/appikorn_widgets/appikorn_box/appikorn_box.dart';

Widget home_page_widget(){
  return appikorn_box(
      child: Stack(
        children: [
          Image.asset("assets/Home_page_pics/img_3.png",fit: BoxFit.cover,).wFull(Get.context!).h(700) ,
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
                      appikorn_text(text:"""   ZERO  WATTS  PHOTOGRAPHY""", size:f1,color: Colors.white,),
                      s1.heightBox,
                      appikorn_text(text:"""   Best & Creative
    Photography""", size:70,color: Colors.white,),
                      s1.heightBox,
                      appikorn_button(width: 70, onTap: (){}, text: "EXPLORE WORK", height: 40,hover_border: true,textColor: Colors.white, color: Colors.orange,)
                    ],
                  ),//.pOn//.pOnly(top: 50)
                  1.widthBox
                ],).h(700)
          ),
        ],
      )
  ).wFull(Get.context!).h(700);
}

Widget home_welcome_widget(){
  return appikorn_box(
    fill_color: Colors.white12,
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appikorn_text(text: "Welcome to Zero Watts Photography", size: f1, color: Colors.orange,),
            s2.heightBox,
            appikorn_text(text: "Freeze Your Moment with Zero\nWatts!..", size: f4),
            s3.heightBox,
            appikorn_text(text: """Some moments that pass in a fraction of a second could be the 
ones that you want to carry in your heart forevermore. How about
some lovesome moments at your wedding? A one where you got
quite emotional, a one where you were over joyed, a one which
got you stunned and many tiny sprinkles of beautiful emotions.
Won’t you always want to visit those moments again? Freeze the
moment and it can never be bound by time. Freeze those
aesthetic moments and revisit them to re-experience the joy of 
living through those joyous moments. We at Zero Watts freeze
your aesthetic moments aesthetically.""", size:f1, maxLine: 50,),
            s2.heightBox,
            appikorn_button(icon: Icon(Icons.play_circle_fill_outlined, color: Colors.white, size: 20.0,),width: 100,color: Colors.black, onTap: (){}, text: "EXPLORE ZERO WATTS",height: 30,textColor: Colors.white,)
          ],
        ).p(50),
        s5.widthBox,
        Image.asset("assets/Home_page_pics/img.png",fit: BoxFit.cover,).wh(700, 600),
      ],
    ),
  );
}
Widget home_icon_cards_widget(){
  return appikorn_box(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(children: [
        appikorn_text(text: "We are Passionate & Creative; hence We deliver the Best!", size: f3,color: Colors.black,),
        s2.heightBox,
        appikorn_text(text: """     The Indian wedding photography and movie scene have transformed from simple
         coverage into thematic documentary style wedding films and albums. Our team works
               on telling simple wedding tales that are innovative yet exceptional.""", size: f1,maxLine: 50,),
          s5.heightBox,
          Row(
            children: [
          home_icon_cards_data_widget(image:"assets/Home_page_pics/img_8.png",text: "Perfection",content: """We never take a chance 
  when it comes to moments
   that add meaning.
  Composing frames, fitting in 
 lightings and capturing 
  moments aesthetically is
 what we call ourselves as
     perfectionists."""),
              home_icon_cards_data_widget(image:"assets/Home_page_pics/img_9.png",text:"Creative",content: """Having an eye for moments, 
   standing behind the lens 
  while adding our touch of 
   innovation, together has 
  brought out the beauty in 
   every moment we capture."""),
              home_icon_cards_data_widget(image: "assets/Home_page_pics/img_10.png", text:"Satisfaction", content: """Your happiness is what we
strive for. We wait to inner 
happiness on your face, be 
  it on the day of your
wedding or while looking at
 what we captured on the 
          day."""),
              home_icon_cards_data_widget(image: "assets/Home_page_pics/img_11.png", text: "Friendly Approach", content: """We are not photographers.
  Don’t call us your friends.
 We are your family. Talking 
to us is as easy as talking to 
  your family. We love what 
     we can do for you.""")
            ],
          ),
      ],
    )
  ],
  ),
  );
}

Widget home_icon_cards_data_widget({image,text,content}){
  return Row(
    children: [
      appikorn_box(
        radius: 2,
          border_color: Colors.grey,
          child: Column(
          children: [
            s4.heightBox,
            appikorn_circle_image(url:image,size: 100,),
            s2.heightBox,
            appikorn_text(text: text, size: f1),
            s1.heightBox,
            appikorn_text(text: content, size: f1,maxLine: 30,),
          ],
      ),
      ).w(250).h(350),
      s3.widthBox,
    ],
  );
}