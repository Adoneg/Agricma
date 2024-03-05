import 'package:agricu/themes/colors.dart';
import 'package:agricu/themes/style.dart';
import 'package:agricu/widgets/outline_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Email Verification",
            style: AppStyles.bannerTitle,
          ),
          const Gap(20),
          Text(
            "A verification link has been sent to your email.",
            style: AppStyles.regular,
          ),
          OutlineButtonWidget(
            backgroundColor: darkGreen,
            onPressed: () {},
            child: Text(
              "Verify",
              style: AppStyles.regular.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
