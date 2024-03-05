enum AccountType {
  user,
  seller;

  factory AccountType.fromString(String? type) {
    return switch (type) {
      'user' => AccountType.user,
      'seller' => AccountType.seller,
      String() => AccountType.user,
      null => AccountType.user,
    };
  }
  String? toDBString() {
    return switch (name) {
      'user' => 'user',
      'seller' => 'seller',
      String() => 'user',
    };
  }
}
