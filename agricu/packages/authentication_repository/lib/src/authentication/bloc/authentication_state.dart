part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = userDefault,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(LoginResponseModel user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.newAthenticated(LoginResponseModel user)
      : this._(status: AuthenticationStatus.newAuthenticated, user: user);

  const AuthenticationState.newUser()
      : this._(status: AuthenticationStatus.newUser);

  const AuthenticationState.visitor()
      : this._(status: AuthenticationStatus.visitor);

  final AuthenticationStatus status;
  final LoginResponseModel? user;

  @override
  List<Object> get props => [status, user!];
}
