part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class OnChangedName extends SignupEvent {
  final String? name;
  OnChangedName({required this.name});
}

class OnChangedEmail extends SignupEvent {
  final String? email;
  OnChangedEmail({required this.email});
}

class OnChangedPhone extends SignupEvent {
  final String? phone;
  OnChangedPhone({this.phone});
}

class OnChangedPassword extends SignupEvent {
  final String? password;
  OnChangedPassword({required this.password});
}

class OnChangedConfirmPassword extends SignupEvent {
  final String? confirm;
  OnChangedConfirmPassword({this.confirm});
}

class OnSignupClicked extends SignupEvent {
  OnSignupClicked();
}

class OnGoogleSignIn extends SignupEvent {}
