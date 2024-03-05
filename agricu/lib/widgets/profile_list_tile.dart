import 'package:agricu/themes/style.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile(
      {super.key,
      this.leadingIcon,
      required this.title,
      this.onPressed,
      this.color});
  final IconData? leadingIcon;
  final String? title;
  final Color? color;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        leadingIcon,
        color: color,
      ),
      title: Text(
        "$title",
        style: AppStyles.regular,
      ),
      onTap: onPressed,
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    );
  }
}
