import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key,
    required this.onPressed,
    required this.text
  });
  final VoidCallback onPressed;
  final String text;
  final Color color=AppColors.primaryColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(text,
          style: TextStyle(color: color,
              fontWeight: FontWeight.w500),));
  }
}
