class LoginResponseModel {
  final String? token;
  final int? user_id;
  final String? phone;
  final String? email;
  final String? picture;
  final String? last_name;
  final String? first_name;
  final String? role;
  final bool? is_client;
  final List? roles;
  final String? message;
  final String? pseudo;

  const LoginResponseModel({
    this.token,
    this.message,
    this.phone,
    this.email,
    this.last_name,
    this.first_name,
    this.role,
    this.roles,
    this.is_client,
    this.picture,
    this.user_id,
    this.pseudo,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel();
  }

  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String toString() {
    return "User with ID $user_id";
  }
}

const userDefault = LoginResponseModel();
