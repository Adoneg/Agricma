enum SigninType {
  email,
  google;

  factory SigninType.fromString(String? type) {
    return switch (type) {
      'email' => SigninType.email,
      'google' => SigninType.google,
      String() => SigninType.email,
      null => SigninType.email,
    };
  }
  String? toDBString() {
    return switch (name) {
      'google' => 'google',
      'email' => 'email',
      String() => 'null',
    };
  }
}
