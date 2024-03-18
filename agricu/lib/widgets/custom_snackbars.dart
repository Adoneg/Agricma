import 'package:agricu/themes/colors.dart';
import 'package:agricu/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

snackBar(String message, Function() dismiss, BuildContext context,
    {Color textColor = Colors.white}) {
  return SnackBar(
    dismissDirection: DismissDirection.horizontal,
    duration: const Duration(milliseconds: 3000),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.red,
    content: Row(
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
        const Gap(10),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Text(
            message,
            style: AppStyles.regular.copyWith(color: textColor),
            maxLines: 3,
          ),
        ),
      ],
    ),
    action: SnackBarAction(
      label: 'dismiss',
      onPressed: dismiss,
      textColor: Colors.white,
    ),
  );
}
