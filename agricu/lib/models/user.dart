import 'package:agricu/enums/account_type_enum.dart';
import 'package:agricu/enums/signin_type_enum.dart';

class AppUser {
  final int? id;
  String? userId;
  final String? phone;
  final String? email;
  final String? picture;
  final String? name;
  final bool? emailVerified;
  final AccountType? accountType;
  final SigninType? signinType;
  DateTime? dateCreated;

  AppUser({
    this.id,
    this.userId,
    this.accountType,
    this.phone,
    this.email,
    this.picture,
    this.emailVerified,
    this.name,
    this.signinType,
    this.dateCreated,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'],
      userId: json['user_id'],
      accountType: AccountType.fromString(json['account_type']),
      phone: json['phone'],
      email: json['email'],
      name: json['name'],
      signinType: SigninType.fromString(json['signin_type']),
      dateCreated: DateTime.parse(json['created_at']),
      picture: json['picture'],
      emailVerified: json['email_verified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email_verified': emailVerified,
      'account_type': accountType?.toDBString(),
      'phone': phone,
      'email': email,
      'picture': picture,
      'created_at': dateCreated?.toIso8601String(),
      'name': name,
      'signin_type': signinType?.toDBString(),
      'user_id': userId,
    };
  }

  @override
  String toString() {
    return "User with ID $userId {}";
  }
}

final userDefault = AppUser();
