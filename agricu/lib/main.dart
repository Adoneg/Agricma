import 'package:agricu/routes/routes.dart';
import 'package:agricu/screens/onboarding/view/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: dismissKeyboard,
      child: ScreenUtilInit(
        designSize: Size(width, height),
        minTextAdapt: true,
        splitScreenMode: true,
        child: const MaterialApp(
          title: 'Agricu',
          home: OnBoarding(),
          onGenerateRoute: RouterClass.onGenerateRoute,
        ),
      ),
    );
  }
}

void dismissKeyboard([BuildContext? context]) {
  if (context == null) {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    return;
  }

  final FocusScopeNode currentFocus = FocusScope.of(context);
  if (!(currentFocus.hasPrimaryFocus)) {
    currentFocus.unfocus();
  }
}
