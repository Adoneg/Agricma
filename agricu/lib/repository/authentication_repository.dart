import 'dart:convert';
import 'dart:developer';

import 'package:agricu/constants.dart';
import 'package:agricu/enums/account_type_enum.dart';
import 'package:agricu/enums/signin_type_enum.dart';
import 'package:agricu/models/user.dart';
import 'package:agricu/repository/user_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationRepository {
  final supabaseInstance = Supabase.instance;
  final userDB = UserRepository();

  Future<AppUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final response = await supabaseInstance.client.auth
          .signInWithPassword(email: email, password: password);

      final userId = response.user?.id;

      if (userId == null) {
        return null;
      }
      log(userId);

      //use "userId" to query db and get user then return this user
      final appUser = await userDB.getUser(userId);
      log('$appUser is the user');
      userDB.setUser(jsonEncode(appUser!.toJson()));
      return appUser;
    } catch (e) {
      throw handleAuthException(e);
    }
  }

  Future<AppUser?> signUpEmailAndPassword(
      AppUser appuser, String password) async {
    try {
      final response = await supabaseInstance.client.auth
          .signUp(email: appuser.email, password: password);

      appuser.userId = response.user?.id;
      appuser.dateCreated = DateTime.now();
      log('${appuser.userId}');
      await UserRepository().insertUser(appuser);

      final user = await userDB.getUser(appuser.userId!);

      await userDB.setUser(jsonEncode(user!.toJson()));
      return user;
    } catch (e) {
      throw handleAuthException(e);
    }
  }

  Future<AppUser> googleSignin() async {
    const webClientId =
        '1090800753020-djr8qdtkt0d3us8b63n337tq84t4omu9.apps.googleusercontent.com';

    //const iosClientId = 'my-ios.apps.googleusercontent.com';

    final GoogleSignIn googleSignIn = GoogleSignIn(
      //  clientId: iosClientId,
      serverClientId: webClientId,
    );
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw 'Google Authentication Failed or cancelled';
      }
      final googleAuth = await googleUser.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }

      final response = await supabaseInstance.client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      final user = await userDB.getUser(response.user!.id);
      if (user != null) {
        return user;
      } else {
        final appuser = AppUser(
          accountType: AccountType.user,
          email: googleUser.email,
          name: googleUser.displayName,
          signinType: SigninType.google,
          userId: response.user?.id,
          picture: googleUser.photoUrl,
          emailVerified: true,
          dateCreated: DateTime.now(),
        );
        await UserRepository().insertUser(appuser);
        final newuser = await userDB.getUser(appuser.userId!);
        await userDB.setUser(jsonEncode(newuser!.toJson()));
        return newuser;
      }
    } catch (e) {
      throw handleAuthException(e);
    }
  }

  Future<void> signOut() async {
    await supabaseInstance.client.auth.signOut();
    await userDB.deleteUser();
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

  Future setOnboarded() async {
    await prefs?.setBool('onboarded', true);
  }

  User? get currentUser => supabaseInstance.client.auth.currentUser;

  bool? get onboarded => prefs?.getBool('onboarded');
}
