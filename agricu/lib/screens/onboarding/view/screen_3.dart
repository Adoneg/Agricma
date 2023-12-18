import 'package:agricu/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: 200.h,
            width: 200.h,
            child: Image.asset("assets/images/onboarding3.png")),
        const Gap(40),
        Text(
          'Sell Your Products',
          style: AppStyles.bannerTitle,
        ),
        const Gap(20),
        Text(
          'With just one click Buy Agricultural\n Products',
          textAlign: TextAlign.center,
          style: AppStyles.input,
        )
      ],
    );
  }
}
