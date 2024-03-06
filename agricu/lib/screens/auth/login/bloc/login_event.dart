part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class OnChangedEmail extends LoginEvent {
  final String? email;
  OnChangedEmail({required this.email});
}

class OnChangedPassword extends LoginEvent {
  final String? password;
  OnChangedPassword({required this.password});
}

class OnSubmitClicked extends LoginEvent {
  OnSubmitClicked();
}

class OnGoogleSignIn extends LoginEvent {}
