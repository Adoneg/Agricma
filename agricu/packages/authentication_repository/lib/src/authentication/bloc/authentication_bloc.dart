import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) {
        add(AuthenticationStatusChanged(status));
      },
    );
  }

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  Future<void> _cleanIfFirstUseAfterUninstall() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('first_run') ?? true) {
      await prefs.setBool('first_run', false);
    }
  }

  @override
  AuthenticationState get initialState => AuthenticationState.unknown();

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }

  Future<void> _onAuthenticationStatusChanged(
    AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    // emit(AuthenticationState.unknown());
    final bool hasToken = await _userRepository.hasUser();
    if (hasToken) {
      LoginResponseModel? user;
      await _tryGetUser().then((value) => user = value);
      if (user?.user_id != null) {
        if (event.status.name == 'newAuthenticated') {
          return emit(AuthenticationState.newAthenticated(user!));
        }

        if (event.status.name != 'authenticated') {
          return emit(AuthenticationState.authenticated(user!));
        }
      } else {
        return emit(AuthenticationState.visitor());
      }
    } else {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isOpened = prefs.getBool('first_screen_already_opened');

      if (isOpened == true) {
        return emit(AuthenticationState.visitor());
      } else {
        return emit(AuthenticationState.newUser());
      }
    }
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    _userRepository.deleteUser();
    _authenticationRepository.logOut();
    emit(AuthenticationState.visitor());
  }

  Future<LoginResponseModel?> _tryGetUser() async {
    try {
      var data;
      await _userRepository.getUser().then((value) {
        data = value;
      });
      return data;
    } catch (e) {
      return null;
    }
  }
}
