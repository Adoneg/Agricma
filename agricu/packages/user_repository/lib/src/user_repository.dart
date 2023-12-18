import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:user_repository/src/models/login_response_model.dart';

class UserRepository {
  static UserRepository? instance;

  factory UserRepository() =>
      instance ??= UserRepository._(FlutterSecureStorage());

  UserRepository._(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future<bool> hasUser() async {
    var value = await _secureStorage.read(key: UserConstants.USER_KEY);
    return value != null;
  }

  Future<void> deleteUser() async {
    return _secureStorage.delete(key: UserConstants.USER_KEY);
  }

  Future<LoginResponseModel> getUser() async {
    var udata;
    await _secureStorage
        .read(key: UserConstants.USER_KEY)
        .then((value) => udata = value);
    LoginResponseModel user = LoginResponseModel.fromJson(jsonDecode(udata));
    return user;
  }

  Future<LoginResponseModel> activeUser() async {
    var udata = await _secureStorage.read(key: UserConstants.USER_KEY);
    var data = jsonDecode(udata!);
    var user = LoginResponseModel.fromJson(data);
    return user;
  }

  Future<void> setUser(String userData) async {
    await _secureStorage.write(key: UserConstants.USER_KEY, value: userData);
  }
}

class UserConstants {
  static final USER_KEY = 'user';
}
