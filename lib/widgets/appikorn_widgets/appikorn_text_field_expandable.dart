import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utils/global_color.dart';
import '../../utils/global_size.dart';

class appikorn_text_field_expandable extends StatelessWidget {
  final double? height;
  final int? maxLines;
  final int? maxLength;
  final Color? textcolor;
  final String? lable;
  final String? hint;
  final Color? fillColor;
  final Color? borderColor;
  final bool? border;
  final bool? counter;
  final double? textsize;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String regx;
  void Function(String?)? onChanged;
  void Function()? ontap;
  void Function(String)? onSaved;
  TextEditingController? controller;
  final Widget? suffixicon;
  final Widget? preffixxicon;
  final bool? readOnly;
  final bool? centerText;
  final bool? datePick;
  final bool? expand;

  final EdgeInsetsGeometry? contentPadding;

  appikorn_text_field_expandable({
    super.key,
    this.centerText,
    this.contentPadding,
    this.height,
    this.maxLines,
    this.maxLength,
    this.textcolor,
    this.lable,
    this.hint,
    this.readOnly,
    this.fillColor,
    this.borderColor,
    this.border,
    this.counter,
    this.textsize,
    this.validator,
    this.keyboardType,
    required this.regx,
    this.suffixicon,
    this.preffixxicon,
    this.onChanged,
    this.ontap,
    this.onSaved,
    this.controller,
    this.datePick,
    this.expand,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      maxLength: maxLength == null ? 20 : maxLength,
      maxLines: maxLines == null ? 1 : maxLines,
      minLines: 1,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(regx == null ? r'^[a-zA-Z0-9_\-=@,\.;!#%&*()$":?]+$' : regx))],
      keyboardType: keyboardType == null ? keyboardType : TextInputType.text,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(color: textcolor == null ? primary_color : textcolor, fontSize: textsize == null ? f1 : textsize),
      textAlign: (centerText == null || centerText == false) ? TextAlign.start : TextAlign.center,
      decoration: InputDecoration(
        counterText: (counter == null || counter == false) ? "" : null,
        errorStyle: TextStyle(fontSize: 0),
        filled: true,
        fillColor: fillColor == null ? Colors.grey[100] : fillColor,
        label: lable == null ? null : lable!.text.make(),
        labelStyle: TextStyle(color: primary_color, fontSize: f0),
        contentPadding: contentPadding ?? EdgeInsets.only(top: 5, left: (centerText != null && centerText == true) ? 0 : 12),
        border: border == null
            ? null
            : OutlineInputBorder(
                borderSide: BorderSide(color: borderColor ?? Colors.white, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
        enabledBorder: border == null
            ? null
            : OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: borderColor ?? Colors.white, width: 1.0),
              ),
        focusedBorder: border == null
            ? null
            : OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: borderColor ?? Colors.white, width: 1.0),
              ),
        hintText: hint,
        suffixIcon: suffixicon,
        prefixIcon: preffixxicon,
      ),
      onSubmitted: onSaved,
      onTap: ontap,
      readOnly: readOnly ?? false,
    );
  }
}
