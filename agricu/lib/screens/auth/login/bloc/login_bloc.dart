import 'dart:developer';

import 'package:agricu/enums/loading_state_enum.dart';
import 'package:agricu/repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final auth = AuthenticationRepository();
  LoginBloc() : super(LoginState()) {
    on<OnChangedEmail>(
      (event, emit) {
        emit(state.copyWith(email: event.email));
      },
    );
    on<OnChangedPassword>(
      (event, emit) {
        emit(state.copyWith(password: event.password));
      },
    );
    on<OnSubmitClicked>(
      (event, emit) async {
        emit(state.copyWith(loadingState: LoadingState.loading));
        log('Login fired ${state.email} and ${state.password}');
        try {
          await auth.signInWithEmailAndPassword(state.email!, state.password!);
          emit(state.copyWith(loadingState: LoadingState.success));
        } catch (e) {
          log(e.toString());
          emit(state.copyWith(
              loadingState: LoadingState.failed,
              errorMessage: e.toString(),
              googleAuthLoading: false));
        }
      },
    );
    on<OnGoogleSignIn>(((event, emit) async {
      emit(state.copyWith(loadingState: LoadingState.initial));
      try {
        await auth.googleSignin();
        emit(state.copyWith(loadingState: LoadingState.success));
      } catch (e) {
        log(e.toString());
        emit(state.copyWith(
            loadingState: LoadingState.failed, errorMessage: e.toString()));
      }
    }));
  }
}
