import 'package:agricu/themes/colors.dart';
import 'package:agricu/themes/style.dart';
import 'package:agricu/widgets/otp_tex_field.dart';
import 'package:agricu/widgets/outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DigitCodeVerification extends StatefulWidget {
  const DigitCodeVerification({super.key});

  @override
  State<DigitCodeVerification> createState() => _DigitCodeVerificationState();
}

class _DigitCodeVerificationState extends State<DigitCodeVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Enter the 4 digit code that was \n sent to your Mobile number",
            textAlign: TextAlign.center,
            style: AppStyles.btn.copyWith(color: Colors.black),
          ),
          const Gap(20),
          OtpTextField(
            numberOfFields: 4,
            showFieldAsBox: true,
            fieldWidth: 60,
            borderRadius: BorderRadius.circular(30),
            onCodeChanged: (String code) {},
            onSubmit: (String verificationCode) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  });
            }, // end onSubmit
          ),
          const Gap(60),
          OutlineButtonWidget(
            width: 290.w,
            backgroundColor: lightGreen,
            onPressed: () {
              Navigator.of(context).pushNamed('/userInformation');
            },
            child: Text(
              'VERIFY',
              style: AppStyles.btn,
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Resend Again?',
                  style:
                      AppStyles.btn.copyWith(color: Colors.blue, fontSize: 15),
                ),
              ))
        ],
      ),
    ));
  }
}
