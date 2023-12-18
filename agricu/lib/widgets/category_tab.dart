import 'package:agricu/themes/colors.dart';
import 'package:agricu/themes/style.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab(
      {super.key, required this.active, required this.title, this.onTap});
  final bool active;
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: active ? brown : Colors.white),
        child: Center(
          child: Text(
            title,
            style: AppStyles.labelStyle
                .copyWith(color: active ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
