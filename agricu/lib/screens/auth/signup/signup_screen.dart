import 'dart:developer';

import 'package:agricu/enums/loading_state_enum.dart';
import 'package:agricu/routes/route_names.dart';
import 'package:agricu/screens/auth/form_keys.dart';
import 'package:agricu/screens/auth/helpers.dart';
import 'package:agricu/screens/auth/signup/signup_bloc/signup_bloc.dart';
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

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state.loadingState == LoadingState.success) {
            log('Signup was successfull going to ${RoutePath.home}');
            context.go(RoutePath.home);
          }
          if (state.loadingState == LoadingState.failed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!,
                    style: AppStyles.regular.copyWith(color: Colors.white)),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            bottomSheet:
                state.googleAuthLoading != null && state.googleAuthLoading!
                    ? const LinearProgressIndicator(
                        color: darkGreen,
                      )
                    : const SizedBox(),
            body: Form(
              key: signupKey,
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Gap(60),
                            const Gap(10),
                            Text(
                              "Let's Get Started ",
                              style: AppStyles.bannerTitle,
                            ),
                            const Gap(5),
                            Text(
                              "Create an account",
                              style: AppStyles.labelStyle,
                            ),
                            const Gap(20),
                            CustomTextField(
                              onchanged: (name) {
                                context
                                    .read<SignupBloc>()
                                    .add(OnChangedName(name: name));
                              },
                              validator: (name) {
                                if (name == null || name.isEmpty) {
                                  return "Please Enter your full name";
                                }
                                if (name.length < 3) {
                                  return "Names should be atleast 3 chararcters";
                                }
                                return null;
                              },
                              hintText: "Enter your Full Name",
                              labelText: "Full Name",
                              prefixIcon: Icons.person_2_outlined,
                              showVisibility: false,
                              inputType: TextInputType.name,
                            ),
                            const Gap(10),
                            CustomTextField(
                              onchanged: (email) {
                                context
                                    .read<SignupBloc>()
                                    .add(OnChangedEmail(email: email));
                              },
                              validator: emailValidation,
                              hintText: "Enter your email address",
                              labelText: "Email",
                              prefixIcon: Icons.email_outlined,
                              showVisibility: false,
                              inputType: TextInputType.emailAddress,
                            ),
                            const Gap(10),
                            CustomTextField(
                              showVisibility: false,
                              inputType: TextInputType.phone,
                              onchanged: (phone) {
                                context
                                    .read<SignupBloc>()
                                    .add(OnChangedPhone(phone: phone));
                              },
                              validator: phoneValidation,
                              hintText: "Enter your phone number",
                              labelText: "Phone",
                              prefixIcon: Icons.phone,
                            ),
                            const Gap(10),
                            CustomTextField(
                              hintText: "Enter your password",
                              labelText: "Password",
                              onchanged: (password) {
                                context
                                    .read<SignupBloc>()
                                    .add(OnChangedPassword(password: password));
                              },
                              validator: (input) {
                                if (input!.length < 8) {
                                  return "password should be at least 8 characters";
                                }
                                return null;
                              },
                              prefixIcon: Icons.lock_outline_rounded,
                              showVisibility: true,
                              inputType: TextInputType.text,
                            ),
                            const Gap(10),
                            CustomTextField(
                              hintText: "confirm your password",
                              labelText: "Confirm password",
                              onchanged: (password) {
                                context.read<SignupBloc>().add(
                                    OnChangedConfirmPassword(
                                        confirm: password));
                              },
                              validator: (input) {
                                if (input != state.password) {
                                  return "Passwords don't match";
                                }

                                return null;
                              },
                              prefixIcon: Icons.lock_outline_rounded,
                              showVisibility: true,
                              inputType: TextInputType.text,
                            ),
                            const Gap(5),
                            const Gap(10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: OutlineButtonWidget(
                                  backgroundColor: darkGreen,
                                  width: double.infinity,
                                  onPressed: () {
                                    if (signupKey.currentState!.validate()) {
                                      context
                                          .read<SignupBloc>()
                                          .add(OnSignupClicked());
                                    }
                                  },
                                  child: state.loadingState ==
                                          LoadingState.loading
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 3,
                                        )
                                      : Text(
                                          "Sign up",
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
                            GoogleButton(
                              onPressed: () {
                                context
                                    .read<SignupBloc>()
                                    .add(OnGoogleSignIn());
                              },
                            )
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
                        "Already have an account? ",
                        style: AppStyles.labelStyle,
                      ),
                      TextButton(
                          onPressed: () {
                            context.replace(RoutePath.login);
                          },
                          child: Text(
                            "signin",
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
