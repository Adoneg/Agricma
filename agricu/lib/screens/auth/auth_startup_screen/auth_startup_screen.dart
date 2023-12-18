import 'package:agricu/themes/style.dart';
import 'package:agricu/widgets/outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AuthStartUp extends StatefulWidget {
  const AuthStartUp({super.key});

  @override
  State<AuthStartUp> createState() => _AuthStartUpState();
}

class _AuthStartUpState extends State<AuthStartUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 200.h,
                  width: 200.h,
                  child: Image.asset(
                    'assets/images/agricma.png',
                    fit: BoxFit.cover,
                  )),
              const Gap(20),
              OutlineButtonWidget(
                padding: 20,
                backgroundColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushNamed('/phoneVerification');
                },
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    'Enter Your mobile Number',
                    style: AppStyles.btnAlt,
                  ),
                ]),
              ),
              const Gap(40),
              Text(
                'OR',
                style: AppStyles.btnAlt,
              ),
              const Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButtonWidget(
                    width: 160.w,
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: Image.asset('assets/icons/google.png'),
                          ),
                          const Gap(10),
                          Text(
                            'Log in with',
                            style: AppStyles.btnAlt,
                          ),
                        ]),
                  ),
                  OutlineButtonWidget(
                    width: 160.w,
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: Image.asset('assets/icons/facebook.png'),
                          ),
                          const Gap(10),
                          Text(
                            'Log in with',
                            style: AppStyles.btnAlt,
                          ),
                        ]),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
