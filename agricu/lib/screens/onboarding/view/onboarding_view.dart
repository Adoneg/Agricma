import 'package:agricu/screens/onboarding/view/screen_1.dart';
import 'package:agricu/screens/onboarding/view/screen_2.dart';
import 'package:agricu/screens/onboarding/view/screen_3.dart';
import 'package:agricu/themes/colors.dart';
import 'package:agricu/themes/style.dart';
import 'package:agricu/widgets/outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<Widget> pages = [
    const ScreenOne(),
    const ScreenTwo(),
    const ScreenThree()
  ];
  final PageController controller = PageController();
  int currentPage = 0;
  changePage() {
    controller.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  skip() {
    controller.jumpToPage(2);
  }

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!.round();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              width: ScreenUtil.defaultSize.width,
              height: 400.h,
              child: PageView.builder(
                  controller: controller,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Gap(60),
                          index != 2
                              ? TextButton(
                                  onPressed: () {
                                    skip();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        'Skip',
                                        style: AppStyles.hintStyle,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          const Gap(20),
                          pages.elementAt(index),
                        ],
                      ),
                    );
                  }),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10.w,
                          width: 10.w,
                          decoration: BoxDecoration(
                              color:
                                  currentPage == 0 ? lightGreen : Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all()),
                        ),
                        const Gap(5),
                        Container(
                          height: 10.w,
                          width: 10.w,
                          decoration: BoxDecoration(
                              color:
                                  currentPage == 1 ? lightGreen : Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all()),
                        ),
                        const Gap(5),
                        Container(
                          height: 10.w,
                          width: 10.w,
                          decoration: BoxDecoration(
                              color:
                                  currentPage == 2 ? lightGreen : Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all()),
                        ),
                      ],
                    ),
                    const Gap(90),
                    OutlineButtonWidget(
                      onPressed: () {
                        if (currentPage != 2) {
                          changePage();
                        } else {
                          Navigator.of(context).pushNamed('/authStartUp');
                        }
                      },
                      backgroundColor: darkGreen,
                      width: 150.w,
                      child: Text(
                        currentPage == 2 ? 'Get Started' : 'Next',
                        style: AppStyles.btn,
                      ),
                    )
                  ],
                ))
          ],
        ));
  }
}
