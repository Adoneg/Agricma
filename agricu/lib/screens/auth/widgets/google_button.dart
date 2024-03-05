import 'package:agricu/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key, this.onPressed, this.width});
  final Function()? onPressed;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        width: width,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.grey.withOpacity(0.3))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/google-icon.png',
                  height: 25,
                  width: 25,
                ),
                const Gap(10),
                Text(
                  "Continue with Google",
                  style: AppStyles.regular,
                )
              ],
            )),
      ),
    );
  }
}
