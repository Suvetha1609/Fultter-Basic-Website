import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../utils/global_color.dart';
import '../../../utils/language.dart' as language;
import 'dependencies.dart';



class appikorn_text extends StatelessWidget {
  appikorn_text( {Key? key, required this.text, required this.size, this.maxLine, this.color, this.weight, this.spacing, this.alignment, this.mandatory,}) : super(key: key);

  var text;
  final double size;
  final int? maxLine;
  final Color? color;
  final FontWeight? weight;
  final double? spacing;
  final TextAlign? alignment;
  final bool? mandatory;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      TextSpan(children: [
        TextSpan(
          text: language.language_source[text.toString().trim()] == null ? text : language.language_source[text],
        ),
        if (mandatory ?? false)
          TextSpan(
            text: ' *',
            style: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
      ]),
      style: GoogleFonts.roboto(
        fontSize: size,
        color: color ?? text_color,
        letterSpacing: spacing,
        fontWeight: weight,
      ),
      maxLines: maxLine ?? 2,
      textAlign: alignment,
      overflow: TextOverflow.ellipsis,
    );
  }
}
// style: GoogleFonts.roboto(
// fontWeight: FontWeight.w700,
// fontSize: 18,
// color: Colors.white,
// ),
