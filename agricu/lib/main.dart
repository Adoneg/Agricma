import 'package:agricu/constants.dart';
import 'package:agricu/repository/authentication_repository.dart';
import 'package:agricu/routes/routes.dart';
import 'package:agricu/screens/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://eeaishkcqlgpesbzcssy.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVlYWlzaGtjcWxncGVzYnpjc3N5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDg1MTg1NzksImV4cCI6MjAyNDA5NDU3OX0.dWBjVH9kukKNCIxceJ-712cE8pGmHiy5f-IR9I-k4-8',
  );
  prefs = await SharedPreferences.getInstance();

  final routes = RouterClass.instance;
  runApp(MyApp(routes: routes.getRoutes()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.routes});
  final GoRouter routes;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: dismissKeyboard,
      child: ScreenUtilInit(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              lazy: false,
              create: (context) =>
                  ProfileBloc(auth: AuthenticationRepository())..add(OnInit()),
            ),
          ],
          child: MaterialApp.router(
            title: 'Agricu',
            routerConfig: routes,
          ),
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
