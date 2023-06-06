import 'package:newwatt/export.dart';

snakbar({type, msg}) {
  switch (type) {
    case "SUCCESS":
      Get.snackbar(
        "SUCCESS",
        msg,
        icon: Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Container(
              height: 80,
              width: 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(3),
                  ),
                  color: Colors.orangeAccent)),
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        borderRadius: 10,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 3),
        isDismissible: true,
        forwardAnimationCurve: Curves.bounceIn,
      );
      break;

    case "ERROR":
      Get.snackbar(
        "Error",
        msg.toString(),
        maxWidth: 400,
        icon: Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Container(
              height: 80,
              width: 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(3),
                  ),
                  color: Colors.orangeAccent)),
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: primary_color,
        borderRadius: 10,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 3),
        isDismissible: true,
        forwardAnimationCurve: Curves.bounceIn,
      );
      break;
  }
}
