import 'package:flutter/material.dart';

class OutlineButtonWidget extends StatelessWidget {
  const OutlineButtonWidget(
      {super.key,
      this.onPressed,
      this.backgroundColor,
      this.child,
      this.padding,
      this.width});
  final Function()? onPressed;
  final Color? backgroundColor;
  final Widget? child;
  final double? width;
  final double? padding;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.all(padding ?? 15)),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            backgroundColor: MaterialStatePropertyAll(backgroundColor),
          ),
          onPressed: onPressed,
          child: child),
    );
  }
}
