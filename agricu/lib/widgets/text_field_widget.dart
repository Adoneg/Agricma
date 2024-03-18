import 'package:agricu/themes/colors.dart';
import 'package:agricu/themes/style.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      this.validator,
      this.onchanged,
      this.hintText,
      this.maxLines,
      this.inputType = TextInputType.name,
      this.labelText});
  final String? Function(String?)? validator;
  final Function(String?)? onchanged;
  final String? hintText;
  final String? labelText;
  final int? maxLines;
  final TextInputType inputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: AppStyles.regular,
        maxLines: maxLines,
        onChanged: onchanged,
        validator: validator,
        keyboardType: inputType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          hintText: hintText,
          labelText: labelText,
          labelStyle: AppStyles.labelStyle,
          hintStyle: AppStyles.hintStyle,
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 1.5)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 1.5)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey, width: 1.5)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: darkGreen, width: 1.5),
          ),
        ));
  }
}
