import '../../export.dart';

Widget faq_part_widget(){
  return appikorn_text(text: "FREQUENTLY ASKED QUESTIONS", size: f4,color: Colors.black,);
}

Widget faq_question_widget(){
  return Column(
    children: [
    Row(
      children: [
       appikorn_text(text: "1.WHAT ARE THE CHARGES FOR BOOKING ZERO WATTS FOR MY WEDDING?", size: f1)
      ],
    ),
    ],
  );
}

