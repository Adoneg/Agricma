import 'package:agricu/themes/colors.dart';
import 'package:agricu/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Icon(
            Icons.check_circle_outline,
            size: 150,
            color: lightGreen,
          ),
          const Gap(50),
          Text(
            'Verification Code sent to \n Your Registered Mobile Number',
            textAlign: TextAlign.center,
            style: AppStyles.labelStyle,
          )
        ],
      ),
    );
  }
}
