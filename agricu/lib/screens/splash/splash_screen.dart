import 'package:agricu/routes/route_names.dart';
import 'package:agricu/screens/profile/bloc/profile_bloc.dart';
import 'package:agricu/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.hasAppInitialized!) {
          context.go(RoutePath.home); //redirecting
        }
      },
      child: Scaffold(
        body: Container(
          color: lightGreen,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    'assets/images/agricma_logo.png',
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const LinearProgressIndicator(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
