part of 'signup_bloc.dart';

class SignupState {
  final String? fullName;
  final String? email;
  final String? phone;
  final String? password;
  final String? confirmPassword;
  final LoadingState? loadingState;

  const SignupState({
    this.fullName,
    this.email,
    this.phone,
    this.confirmPassword,
    this.loadingState = LoadingState.initial,
    this.password,
  });

  SignupState copyWith({
    String? fullName,
    String? email,
    String? phone,
    String? password,
    String? confirmPassword,
    LoadingState? loadingState,
  }) {
    return SignupState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      phone: phone ?? this.phone,
      loadingState: loadingState ?? this.loadingState,
    );
  }
}
