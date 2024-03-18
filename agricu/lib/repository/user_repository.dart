import 'dart:convert';
import 'dart:developer';

import 'package:agricu/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepository {
  static UserRepository? instance;

  factory UserRepository() =>
      instance ??= UserRepository._(const FlutterSecureStorage());

  UserRepository._(this._secureStorage);

  final FlutterSecureStorage _secureStorage;
  final supabase = Supabase.instance;

  Future<void> insertUser(AppUser user) async {
    try {
      await supabase.client.from('USERS').insert(user.toJson());
      return;
    } on PostgrestException catch (e) {
      log('$e');
      return;
    }
  }

  Future<AppUser?> getCurrenUser() async {
    try {
      final user = await supabase.client
          .from('USERS')
          .select()
          .eq('user_id', supabase.client.auth.currentUser!.id)
          .single();
      log('$user');
      return AppUser.fromJson(user);
    } on PostgrestException catch (e) {
      log('$e');
      return null;
    }
  }

  Future<AppUser?> getUser(String id) async {
    try {
      final user = await supabase.client
          .from('USERS')
          .select()
          .eq('user_id', id)
          .single();
      return AppUser.fromJson(user);
    } on PostgrestException catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<AppUser>> getUSERS() async {
    try {
      final userMaps = await supabase.client.from('USERS').select();

      final USERS = userMaps.map((e) => AppUser.fromJson(e)).toList();

      return USERS;
    } on PostgrestException catch (e) {
      log('$e');
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<AppUser>> getUSERSPerIds(List<String> ids) async {
    try {
      final userMaps =
          await supabase.client.from('USERS').select().inFilter('id', ids);

      final USERS = userMaps.map((e) => AppUser.fromJson(e)).toList();

      return USERS;
    } on PostgrestException catch (e) {
      log('$e');
      return [];
    } catch (e) {
      log('$e');
      return [];
    }
  }

  // Future<void> updateUser(AppUser user) async {
  //   try {
  //     if (user.imageFile != null) {
  //       user.picture = await _uploadImage(user.imageFile!);
  //     }

  //     await supabase.client
  //         .from('USERS')
  //         .update(user.toJson())
  //         .eq('id', user.id);
  //     return;
  //   } on PostgrestException catch (e) {
  //     print(e);
  //   }

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

  Future<AppUser> getLocalUser() async {
    var udata;
    await _secureStorage
        .read(key: UserConstants.USER_KEY)
        .then((value) => udata = value);
    AppUser user = AppUser.fromJson(jsonDecode(udata));
    return user;
  }

  Future<AppUser> activeUser() async {
    var udata = await _secureStorage.read(key: UserConstants.USER_KEY);
    var data = jsonDecode(udata!);
    var user = AppUser.fromJson(data);
    return user;
  }

  Future<void> setUser(String userData) async {
    await _secureStorage.write(key: UserConstants.USER_KEY, value: userData);
  }
}

class UserConstants {
  static final USER_KEY = 'user';
}
