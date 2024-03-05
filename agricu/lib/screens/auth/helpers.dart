String? emailValidation(String? email) {
  if (email == null || email.isEmpty) {
    return 'Please enter an email address.';
  }

  const pattern =
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(email.trim())) {
    return 'Please enter a valid email address.';
  }

  return null;
}

String? phoneValidation(String? phone) {
  if (phone == null || phone.isEmpty) {
    return "Please enter your phone number";
  }
  if (phone.length < 9 || phone.length > 9) {
    return "phone number has 9 digits only";
  }

  return null;
}
