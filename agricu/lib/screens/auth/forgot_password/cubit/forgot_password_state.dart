part of 'forgot_password_cubit.dart';

class ForgotPasswordState {
  final String? email;
  final LoadingState? loadingState;

  ForgotPasswordState({this.loadingState = LoadingState.initial, this.email});

  ForgotPasswordState copyWith({String? email, LoadingState? loadingState}) {
    return ForgotPasswordState(
        email: email ?? this.email,
        loadingState: loadingState ?? this.loadingState);
  }
}
