import 'package:agricu/themes/colors.dart';
import 'package:agricu/themes/style.dart';
import 'package:agricu/widgets/outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({super.key});

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  FocusNode? focus;
  @override
  void initState() {
    focus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    focus?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(children: [
          Center(
            child: Container(
              width: 340.w,
              height: 40.h,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50.w,
                height: 40.h,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    '+237',
                    style: AppStyles.btn.copyWith(color: Colors.grey),
                  ),
                ),
              ),
              Container(
                  width: 290.w,
                  height: 40.h,
                  decoration: const BoxDecoration(
                      border: BorderDirectional(
                          top: BorderSide(),
                          bottom: BorderSide(),
                          end: BorderSide()),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: TextFormField(
                    autofocus: true,
                    focusNode: focus,
                    cursorColor: lightGreen,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ))
            ],
          ),
        ]),
        const Gap(50),
        OutlineButtonWidget(
          width: 290.w,
          backgroundColor: darkGreen,
          onPressed: () {
            Navigator.of(context).pushNamed('/digitCodeVerification');
          },
          child: Text(
            'Verify',
            style: AppStyles.btn,
          ),
        )
      ],
    ));
  }
}
