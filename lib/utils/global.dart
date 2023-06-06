import 'package:newwatt/export.dart';
 import 'package:intl/intl.dart';


var mobile_breaker = 600;
var text_field_height = 45.0;
var lable_size = 15.0;
var txt_size = 13.0;
var btn_height = 58.0;
var btn_width = 100.0;
var txt_field_spacing = 15.0;

var currency_comma_seporator = NumberFormat.simpleCurrency(decimalDigits: 3);
var date_format = "dd/MM/yyyy";
var time_zone = 3;
var local_currency = "OMR";
var selected_language = "English";

MainAxisAlignment form_align = MainAxisAlignment.start;
Transition page_transition = Transition.noTransition;
Duration page_transition_duration = Duration(milliseconds: 400);

var noSymbolregex = '[a-zA-Z0-9 ]';
var numberRegx = r'^[0-9]+';
var decimalRegx = r'^[0-9.]+';
var allCharacterRegx = r'^[a-zA-Z0-9_\-=@,\/.;!#%&*()$":? \r\n ]+$';
var stringRegx = r'[a-zA-Z ]+';
var noSimbolInUSFormat = new NumberFormat.currency(locale: "en_US", symbol: "");

var txt_field_radius = 10.0;
var txt_field_focus_color = Colors.blue;


snakbar({type, msg}) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: appikorn_text(
    text: msg,
    size: f0,
    color: Colors.red,
  )));
}

var restCallController_dat = Get.put(restCallController());
