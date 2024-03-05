import 'dart:convert';
import 'dart:developer';

import 'package:agricu/models/user.dart';
import 'package:agricu/repository/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationRepository {
  final supabaseInstance = Supabase.instance;
  final userDB = UserRepository();

  Future<AppUser?> signInWithEmailAndPassword(
      String email, String password) async {
    final response = await supabaseInstance.client.auth
        .signInWithPassword(email: email, password: password);

    final userId = response.user?.id;

    if (userId == null) {
      return null;
    }
    log('$userId');

    //use "userId" to query db and get user then return this user
    final appUser = await userDB.getUser(userId);
    log('$appUser is the user');
    userDB.setUser(jsonEncode(appUser!.toJson()));
    return appUser;
  }

  Future<AppUser?> signUpEmailAndPassword(
      AppUser appuser, String password) async {
    log('${appuser.email}');
    final response = await supabaseInstance.client.auth
        .signUp(email: appuser.email, password: password);

    appuser.userId = response.user?.id;
    appuser.dateCreated = DateTime.now();
    log('${appuser.userId}');
    await UserRepository().insertUser(appuser);

    final user = await userDB.getUser(appuser.userId!);
    log('${user}');
    await userDB.setUser(jsonEncode(user!.toJson()));
    return user;
  }

  Future<void> signOut() async {
    await supabaseInstance.client.auth.signOut();
    userDB.deleteUser();
    return;
  }

  String handleAuthException(dynamic exception) {
    if (exception is AuthException) {
      switch (exception.message) {
        case 'Invalid login credentials':
          return 'Invalid login credentials';

        case 'User not found':
          return 'User not found';

        case 'User already exists':
          return 'User already exists';

        case 'Invalid verification code':
          return 'Invalid verification code';

        default:
          return 'Unknown authentication error: ${exception.message}';
      }
    } else {
      return 'Unknown exception: $exception';
    }
  }

  User? get currentUser => supabaseInstance.client.auth.currentUser;
}
