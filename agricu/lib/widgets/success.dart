import 'package:agricu/themes/colors.dart';
import 'package:agricu/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Success extends StatelessWidget {
  const Success({super.key, required this.message, required this.onPressed});

  final String message;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: onPressed, icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 150,
              color: lightGreen,
            ),
            const Gap(50),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppStyles.labelStyle,
            )
          ],
        ),
      ),
    );
  }
}
