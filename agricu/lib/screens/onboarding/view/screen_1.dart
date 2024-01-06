import 'package:agricu/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: 150.h,
            width: 150.h,
            child: Image.asset("assets/images/onboarding1.png")),
        const Gap(40),
        Text(
          'E Shopping',
          style: AppStyles.bannerTitle,
        ),
        const Gap(20),
        Text(
          'Explore the local markets in Agriculture \n Just on your mobile device',
          textAlign: TextAlign.center,
          style: AppStyles.input,
        )
      ],
    );
  }
}
