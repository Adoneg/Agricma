import 'dart:developer';

import 'package:agricu/enums/account_type_enum.dart';
import 'package:agricu/enums/loading_state_enum.dart';
import 'package:agricu/enums/signin_type_enum.dart';
import 'package:agricu/models/user.dart';
import 'package:agricu/repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final auth = AuthenticationRepository();
  SignupBloc() : super(const SignupState()) {
    on<OnChangedName>((event, emit) {
      emit(state.copyWith(fullName: event.name));
    });
    on<OnChangedEmail>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<OnChangedConfirmPassword>((event, emit) {
      emit(state.copyWith(confirmPassword: event.confirm));
    });
    on<OnChangedPassword>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<OnChangedPhone>((event, emit) {
      emit(state.copyWith(phone: event.phone));
    });

    on<OnSignupClicked>((event, emit) async {
      emit(state.copyWith(loadingState: LoadingState.loading));
      log('should be lading ${state.loadingState}');
      try {
        final appUser = AppUser(
          accountType: AccountType.user,
          phone: state.phone,
          email: state.email,
          name: state.fullName,
          signinType: SigninType.email,
        );

        log('${state.fullName}');
        await auth.signUpEmailAndPassword(appUser, state.password!);
        emit(state.copyWith(loadingState: LoadingState.success));
      } catch (e) {
        log('$e');
        emit(state.copyWith(loadingState: LoadingState.failed));
      }
    });
  }
}
