import 'package:agricu/routes/route_names.dart';
import 'package:agricu/screens/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:agricu/screens/auth/helpers.dart';
import 'package:agricu/screens/auth/widgets/custom_text_field.dart';
import 'package:agricu/themes/colors.dart';
import 'package:agricu/themes/style.dart';
import 'package:agricu/widgets/outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Password Reset",
            style: AppStyles.bannerTitle,
          ),
          Text(
            "A password reset link will be sent to you.",
            style: AppStyles.regular,
          ),
          const Gap(10),
          CustomTextField(
              validator: emailValidation,
              onchanged: (email) {
                context.read<ForgotPasswordCubit>().changedEmail(email);
              },
              showVisibility: true,
              inputType: TextInputType.text,
              hintText: "Enter your Email address",
              labelText: "Email",
              prefixIcon: Icons.email_outlined),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: OutlineButtonWidget(
                backgroundColor: darkGreen,
                width: double.infinity,
                onPressed: () {
                  context.read<ForgotPasswordCubit>().submitButtonClicked();
                },
                child: Text(
                  "Sign in",
                  style: AppStyles.regular.copyWith(color: Colors.white),
                )),
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
                    style: AppStyles.labelStyle.copyWith(color: darkGreen),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
