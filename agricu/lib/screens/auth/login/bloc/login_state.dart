part of 'login_bloc.dart';

class LoginState {
  final String? email;
  final String? password;
  final LoadingState? loadingState;

  LoginState({this.loadingState, this.email, this.password});

  LoginState copyWith({
    String? email,
    String? password,
    LoadingState? loadingState,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      loadingState: loadingState ?? this.loadingState,
    );
  }
}
