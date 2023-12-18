import 'dart:async';
import 'dart:convert';

import 'package:authentication_repository/src/constants.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_repository/user_repository.dart';

enum AuthenticationStatus {
  unknown,
  authenticated,
  newAuthenticated,
  newUser,
  visitor
}

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  final Dio service = Dio(BaseOptions(baseUrl: AuthConstants.BASE_URL));

  final UserRepository _storageService = UserRepository();

  Stream<AuthenticationStatus> get status async* {
    final hasToken = await _storageService.hasUser();
    yield AuthenticationStatus.unknown;
    if (!hasToken) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isOpened = prefs.getBool('first_screen_already_opened');

      // Need to push to another screen, if already opened
      if (isOpened == true) {
        yield AuthenticationStatus.visitor;
      } else {
        yield AuthenticationStatus.newUser;
      }
    } else {
      yield AuthenticationStatus.authenticated;
    }
    yield* _controller.stream.asBroadcastStream();
  }

  void changeStatus(AuthenticationStatus status) async {
    _controller.add(status);
  }

  Future<LoginResponseModel?> logIn({
    required String username,
    required String password,
  }) async {
    final data = {
      'phone': username,
      'password': password,
    };

    bool validateStatus(status) {
      return status < 400;
    }

    final options = Options(validateStatus: validateStatus);

    LoginResponseModel? userData;

    try {
      final response = await service.post(
        '/api/login',
        options: options,
        data: data,
      );

      userData = LoginResponseModel.fromJson(response.data);
      _storageService.setUser(jsonEncode(userData));
      await Future.delayed(
        const Duration(milliseconds: 1000),
        () => _controller.add(AuthenticationStatus.newAuthenticated),
      );
    } on DioError catch (e) {
      throw Exception(e);
    }

    return userData;
  }

  void logOut() {
    _storageService.deleteUser();
    _controller.add(AuthenticationStatus.visitor);
  }

  void dispose() => _controller.close();
}
