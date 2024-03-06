part of 'login_bloc.dart';

class LoginState {
  final String? email;
  final String? password;
  final bool? googleAuthLoading;
  final String? errorMessage;
  final LoadingState? loadingState;

  LoginState(
      {this.loadingState,
      this.email,
      this.password,
      this.googleAuthLoading,
      this.errorMessage});

  LoginState copyWith({
    String? email,
    String? password,
    bool? googleAuthLoading,
    LoadingState? loadingState,
    String? errorMessage,
  }) {
    return LoginState(
      errorMessage: errorMessage ?? this.errorMessage,
      googleAuthLoading: googleAuthLoading ?? this.googleAuthLoading,
      email: email ?? this.email,
      password: password ?? this.password,
      loadingState: loadingState ?? this.loadingState,
    );
  }
}
