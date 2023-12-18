import 'package:agricu/screens/auth/auth_startup_screen/auth_startup_screen.dart';
import 'package:agricu/screens/auth/digit_code_verification/view/digit_code_verification.dart';
import 'package:agricu/screens/auth/phoneVerification/view/phone_verification_screen.dart';
import 'package:agricu/screens/auth/user_information/view/user_information_screen.dart';
import 'package:agricu/screens/home/view/home.dart';
import 'package:agricu/screens/onboarding/view/onboarding_view.dart';
import 'package:flutter/material.dart';

class RouterClass {
  static Route onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      '/' => MaterialPageRoute(builder: (context) {
          return const Home();
        }),
      '/authStartUp' => MaterialPageRoute(builder: (context) {
          return const AuthStartUp();
        }),
      '/phoneVerification' => MaterialPageRoute(builder: (context) {
          return PhoneVerification();
        }),
      '/digitCodeVerification' => MaterialPageRoute(builder: (context) {
          return DigitCodeVerification();
        }),
      '/userInformation' => MaterialPageRoute(builder: (context) {
          return UserInformation();
        }),
      '/onboarding' => MaterialPageRoute(builder: (context) {
          return const OnBoarding();
        }),
      // '/foodDetails' => MaterialPageRoute(builder: (context) {
      //     return ProductDetails(product: settings.,);
      //   }),
      '/shoppingCart' => MaterialPageRoute(builder: (context) {
          return AppBar();
        }),
      '/account' => MaterialPageRoute(builder: (context) {
          return AppBar();
        }),
      '/favourite' => MaterialPageRoute(builder: (context) {
          return AppBar();
        }),
      null => MaterialPageRoute(builder: (context) {
          return Container();
        }),
      String() => MaterialPageRoute(builder: (context) {
          return Container();
        }),
    };
  }
}
