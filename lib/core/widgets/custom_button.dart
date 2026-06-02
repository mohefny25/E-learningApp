import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color borderColor;
  final Color textColor;
  final Color backgroundColor;
  final double borderRadius;
  final double borderWidth;
  final double fontSize;
  final EdgeInsetsGeometry? padding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isLoading;
  final bool isDisabled;
  final double height;
  final bool isSmall;
  final bool isProfile;
  final bool isLogOut;

   const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderColor = AppColors.borderColor,
    this.textColor = Colors.white,
    this.backgroundColor = AppColors.primaryColor,
    this.borderRadius = 12.0,
    this.borderWidth = 1.0,
    this.fontSize = 14,
    this.padding,
    this.prefixIcon,
    this.suffixIcon,
    this.isLoading = false,
    this.isDisabled = false,
    this.height = 30,
     this.isSmall = false,
     this.isProfile = false,
     this.isLogOut = false,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return OutlinedButton(
      onPressed: (isDisabled || isLoading) ? null : onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: isLogOut?Color(0xffF1F5F9):isProfile?AppColors.profileSecondaryColor:backgroundColor,
        foregroundColor: isLogOut?Colors.red:textColor,
        side: BorderSide(
          color: isDisabled ? Colors.grey : borderColor,
          width: borderWidth,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding ?? EdgeInsets.symmetric(
          horizontal: 16,
          vertical: isSmall?6:12,
        ),
        minimumSize: Size(double.infinity, height),
      ),
      child: isLoading
          ? SizedBox(
        height: 18,
        width: 18,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(textColor),
        ),
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefixIcon != null) ...[
            prefixIcon!,
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: fontSize,
              fontWeight: isProfile?FontWeight.w600:FontWeight.w700,
              color: isLogOut?Colors.red:isProfile?AppColors.primaryColor:textColor,
            ),
          ),
          if (suffixIcon != null) ...[
            const SizedBox(width: 8),
            suffixIcon!,
          ],
        ],
      ),
    );
  }
}