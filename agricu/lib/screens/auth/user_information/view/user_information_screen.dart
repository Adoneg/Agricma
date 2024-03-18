import 'package:agricu/screens/home/view/home.dart';
import 'package:agricu/themes/colors.dart';
import 'package:agricu/themes/style.dart';
import 'package:agricu/widgets/outline_button.dart';
import 'package:agricu/widgets/verifying.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(150),
              Text(
                'Enter Your Name',
                style: AppStyles.title.copyWith(fontSize: 18),
              ),
              const Gap(10),
              Container(
                height: 50,
                width: 320.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                    )),
                child: Center(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
              ),
              const Gap(40),
              Text('Add Address',
                  style: AppStyles.title.copyWith(fontSize: 18)),
              const Gap(10),
              Container(
                height: 100,
                width: 320.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                    )),
                child: Center(
                  child: TextFormField(
                    maxLines: 100,
                    decoration: const InputDecoration(
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
              ),
              const Gap(60),
              OutlineButtonWidget(
                width: 320.w,
                backgroundColor: lightGreen,
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Home()));
                },
                child: Text(
                  'VERIFY',
                  style: AppStyles.btn,
                ),
              ),
              Verifying()
            ],
          ),
        ),
      ),
    );
  }
}
