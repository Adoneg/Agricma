import 'dart:developer';

import 'package:agricu/enums/loading_state_enum.dart';
import 'package:agricu/routes/route_names.dart';
import 'package:agricu/screens/auth/form_keys.dart';
import 'package:agricu/screens/auth/helpers.dart';
import 'package:agricu/screens/auth/login/bloc/login_bloc.dart';
import 'package:agricu/screens/auth/widgets/custom_text_field.dart';
import 'package:agricu/screens/auth/widgets/google_button.dart';
import 'package:agricu/themes/colors.dart';
import 'package:agricu/themes/style.dart';
import 'package:agricu/widgets/outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.loadingState == LoadingState.success) {
            log('login was successfull going to ${RoutePath.home}');
            context.go(RoutePath.home);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: signinKey,
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Gap(60),
                            const Gap(20),
                            Text(
                              "Welcome Back!",
                              style: AppStyles.bannerTitle,
                            ),
                            const Gap(10),
                            Text(
                              "Sign in to your existing account",
                              style: AppStyles.labelStyle,
                            ),
                            const Gap(30),
                            CustomTextField(
                              validator: emailValidation,
                              onchanged: (email) {
                                context
                                    .read<LoginBloc>()
                                    .add(OnChangedEmail(email: email));
                              },
                              hintText: "Enter your email address",
                              labelText: "Email",
                              prefixIcon: Icons.email_outlined,
                              showVisibility: false,
                              inputType: TextInputType.emailAddress,
                            ),
                            const Gap(10),
                            CustomTextField(
                              hintText: "Enter your password",
                              labelText: "Password",
                              validator: (input) {
                                if (input == null || input.isEmpty) {
                                  return "Please enter your password";
                                }
                                return null;
                              },
                              onchanged: (password) {
                                context
                                    .read<LoginBloc>()
                                    .add(OnChangedPassword(password: password));
                              },
                              prefixIcon: Icons.lock_outline_rounded,
                              showVisibility: true,
                              inputType: TextInputType.visiblePassword,
                            ),
                            const Gap(5),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {
                                    context
                                        .goNamed(RoutePath.forgotPasswordSub);
                                  },
                                  child: Text(
                                    "Forgot Password?",
                                    style: AppStyles.labelStyle
                                        .copyWith(color: darkGreen),
                                  )),
                            ),
                            const Gap(10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: OutlineButtonWidget(
                                  backgroundColor: darkGreen,
                                  width: double.infinity,
                                  onPressed: () {
                                    if (signinKey.currentState!.validate()) {
                                      context
                                          .read<LoginBloc>()
                                          .add(OnSubmitClicked());
                                    }
                                  },
                                  child: state.loadingState ==
                                          LoadingState.loading
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2.5,
                                        )
                                      : Text(
                                          "Sign in",
                                          style: AppStyles.regular
                                              .copyWith(color: Colors.white),
                                        )),
                            ),
                            const Gap(20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  const Expanded(child: Divider()),
                                  const Gap(5),
                                  Text(
                                    "Or Sign in with",
                                    style: AppStyles.labelStyle
                                        .copyWith(fontSize: 12.sp),
                                  ),
                                  const Gap(5),
                                  const Expanded(child: Divider()),
                                ],
                              ),
                            ),
                            const Gap(20),
                            GoogleButton()
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: AppStyles.labelStyle,
                      ),
                      TextButton(
                          onPressed: () {
                            context.replace(RoutePath.signup);
                          },
                          child: Text(
                            "Signup",
                            style:
                                AppStyles.labelStyle.copyWith(color: darkGreen),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
