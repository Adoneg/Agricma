import 'package:agricu/themes/colors.dart';
import 'package:agricu/themes/style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.prefixIcon,
      this.validator,
      required this.showVisibility,
      required this.inputType,
      this.onchanged});
  final bool showVisibility;

  final IconData? prefixIcon;
  final String? labelText;
  final String? hintText;
  final TextInputType? inputType;
  final String? Function(String?)? validator;

  final Function(String?)? onchanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextFormField(
          onChanged: widget.onchanged,
          validator: widget.validator,
          obscureText: widget.showVisibility ? obscureText : false,
          keyboardType: widget.inputType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            prefixIcon: Icon(widget.prefixIcon),
            suffixIcon: !widget.showVisibility
                ? const SizedBox()
                : IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: obscureText
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined)),
            hintText: widget.hintText,
            labelText: widget.labelText,
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
          )),
    );
  }
}
