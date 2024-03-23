import 'dart:developer';

import 'package:agricu/enums/loading_state_enum.dart';
import 'package:agricu/repository/authentication_repository.dart';
import 'package:agricu/screens/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final auth = AuthenticationRepository();
  final ProfileBloc? profileBloc;
  LoginBloc({required this.profileBloc}) : super(LoginState()) {
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
          final user = await auth.signInWithEmailAndPassword(
              state.email!, state.password!);
          profileBloc?.add(OnSetCurrentUser(currentUser: user));
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
        final user = await auth.googleSignin();
        profileBloc?.add(OnSetCurrentUser(currentUser: user));
        emit(state.copyWith(loadingState: LoadingState.success));
      } catch (e) {
        log(e.toString());
        emit(state.copyWith(
            loadingState: LoadingState.failed, errorMessage: e.toString()));
      }
    }));
  }
}
