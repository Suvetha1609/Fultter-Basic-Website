import 'package:newwatt/export.dart';

class appikorn_text_field_with_heading extends StatelessWidget {
  final double width;
  final double? height;
  final int? maxLines;
  final int? maxCharacter;
  final Color textcolor;
  final String? lable;
  final String? heading;
  final String? hint;
  final Color fillColor;
  final Color? borderColor;
  final bool? border;
  final bool? readonly;
  final double? textsize;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String regx;
  void Function(String?)? onSaved;
  void Function(String?)? onChanged;
  TextEditingController? controller;
  final Widget? suffixicon;
  final Widget? preffixxicon;
  final EdgeInsetsGeometry? contentPadding;
  final bool? counter;
  final bool? mandatory;
  final Widget? child;

  appikorn_text_field_with_heading({
    super.key,
    required this.width,
    this.contentPadding,
    this.counter,
    this.height,
    this.maxCharacter,
    this.maxLines,
    required this.textcolor,
    this.lable,
    this.heading,
    this.hint,
    this.readonly,
    this.child,
    required this.fillColor,
    this.borderColor,
    this.border,
    this.textsize,
    this.validator,
    this.keyboardType,
    required this.regx,
    this.suffixicon,
    this.preffixxicon,
    this.onSaved,
    this.onChanged,
    this.controller,
    this.mandatory,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (heading != null && heading!.isNotEmpty)
            appikorn_text(
              mandatory: mandatory,
              text: heading!,
              color: textcolor,
              weight: heading1_weight,
              size: textsize ?? f1,
            ).pOnly(bottom: 10),
          (readonly != null && readonly == true)
              ? Container(
                  height: height ?? 45,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: borderColor ?? Colors.transparent, width: 1),
                    color: fillColor,
                  ),
                  child: child ??
                      Row(
                        children: [
                          if (preffixxicon != null) preffixxicon!.pOnly(right: 10),
                          ((hint == null) ? "" : hint).toString().text.color(textcolor).make(),
                          Spacer(),
                          if (suffixicon != null) suffixicon!.pOnly(right: 10),
                        ],
                      ).p(8))
              : appikorn_text_field(
                  contentPadding: contentPadding,
                  height: height,
                  counter: counter,
                  textcolor: textcolor,
                  readOnly: readonly,
                  fillColor: fillColor,
                  textsize: textsize,
                  maxLines: maxLines,
                  maxLength: maxCharacter,
                  lable: lable,
                  hint: hint,
                  borderColor: borderColor,
                  border: border,
                  validator: validator,
                  keyboardType: keyboardType,
                  regx: regx,
                  onChanged: onChanged,
                  onSaved: onSaved,
                  controller: controller,
                  suffixicon: suffixicon,
                  preffixxicon: preffixxicon,
                )
        ],
      ),
    );
  }
}
