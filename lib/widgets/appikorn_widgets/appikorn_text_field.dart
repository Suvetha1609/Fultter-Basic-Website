import 'package:newwatt/export.dart';

class appikorn_text_field extends StatelessWidget {
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
  final TextInputAction? inputAction;
  final String? regx;
  final TextInputFormatter? special_regx;
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
  final TextCapitalization? caps;
  final bool? mandatory;
  final EdgeInsetsGeometry? contentPadding;
  final String? error_text;
  final String? heading;
  final double? radius;

  appikorn_text_field({
    super.key,
    this.centerText,
    this.contentPadding,
    this.height,
    this.maxLines,
    this.maxLength,
    this.textcolor,
    this.lable,
    this.mandatory,
    this.hint,
    this.readOnly,
    this.fillColor,
    this.borderColor,
    this.border,
    this.counter,
    this.textsize,
    this.validator,
    this.keyboardType,
    this.regx,
    this.special_regx,
    this.suffixicon,
    this.preffixxicon,
    this.onChanged,
    this.ontap,
    this.onSaved,
    this.controller,
    this.datePick,
    this.expand,
    this.inputAction,
    this.caps,
    this.error_text,
    this.radius,
    this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (heading != null && heading!.isNotEmpty)
          Row(
            children: [
              appikorn_text(
                mandatory: mandatory,
                text: heading!,
                color: textcolor,
                weight: heading1_weight,
                maxLine: 10,
                size: textsize ?? f1,
              ).pOnly(bottom: 10).flexible(),
            ],
          ),
        TextField(
          expands: expand ?? false,
          controller: controller,
          onChanged: (s) {
            print(s.length);
            print(s.length > (maxLength == null ? 20 : maxLength)! - 1);
            if (s.length > (maxLength == null ? 20 : maxLength)! - 1) {
              FocusScope.of(context).unfocus();
            }
            if (onChanged != null) {
              onChanged!(s);
            }
          },
          maxLength: maxLength == null ? 20 : maxLength,
          maxLines: maxLines,
          inputFormatters: [
            // FilteringTextInputFormatter.allow(),
            FilteringTextInputFormatter(RegExp(regx ?? allCharacterRegx), allow: true),
          ],
          textCapitalization: caps ?? TextCapitalization.words,
          keyboardType: keyboardType == null ? TextInputType.text : keyboardType,
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(color: textcolor ?? text_color, fontSize: textsize ?? f1),
          textAlign: (centerText == null || centerText == false) ? TextAlign.start : TextAlign.center,
          decoration: InputDecoration(
            counterText: (counter == null || counter == false) ? "" : null,
            errorStyle: TextStyle(fontSize: f0),
            errorText: error_text,
            contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            filled: true,
            fillColor: fillColor ?? Colors.transparent,
            label: lable == null
                ? null
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      appikorn_text(text: lable!, size: f1),
                      if (mandatory != null && mandatory == true && heading == null)
                        appikorn_text(
                          text: " *",
                          size: f1,
                          color: Colors.red,
                        ),
                    ],
                  ),
            labelStyle: TextStyle(color: Colors.grey, fontSize: f0),
            hintStyle: TextStyle(color: Colors.grey, fontSize: f0),
            border: (border == null || (border != null && border == false))
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(radius ?? 2)),
                    borderSide: BorderSide(color: borderColor ?? border_idle_color.withOpacity(0.3), width: 1.5),
                  )
                : null,
            enabledBorder: (border == null || (border != null && border == false))
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(radius ?? 2)),
                    borderSide: BorderSide(color: borderColor ?? border_idle_color.withOpacity(0.3), width: 1.5),
                  )
                : null,
            focusedBorder: (border == null || (border != null && border == false))
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(radius ?? 2)),
                    borderSide: BorderSide(color: borderColor ?? primary_color, width: 2.0),
                  )
                : null,
            hintText: hint,
            suffixIcon: suffixicon,
            prefixIcon: preffixxicon,
          ),
          onSubmitted: onSaved,
          onTap: ontap,
          textInputAction: inputAction ?? TextInputAction.next,
          readOnly: readOnly ?? false,
        ),
      ],
    );
  }
}
