import 'package:agricu/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: 200.h,
            width: 200.h,
            child: Image.asset("assets/images/onboarding2.png")),
        const Gap(40),
        Text(
          'Delivery On the way',
          style: AppStyles.bannerTitle,
        ),
        const Gap(20),
        Text(
          'Get your offer by speed delivery',
          textAlign: TextAlign.center,
          style: AppStyles.input,
        )
      ],
    );
  }
}
