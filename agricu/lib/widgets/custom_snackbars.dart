import 'package:agricu/themes/colors.dart';
import 'package:agricu/themes/style.dart';
import 'package:flutter/material.dart';

snackBar(String message, Function() dismiss, BuildContext context,
    {Color textColor = Colors.white}) {
  return SnackBar(
    dismissDirection: DismissDirection.horizontal,
    duration: const Duration(milliseconds: 1000),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.red,
    content: Row(
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
        Text(
          message,
          style: AppStyles.regular.copyWith(color: textColor),
        ),
      ],
    ),
    action: SnackBarAction(
      label: 'dismiss',
      onPressed: dismiss,
      textColor: darkGreen,
    ),
  );
}
