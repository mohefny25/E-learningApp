import 'package:flutter/material.dart';
import 'package:your_academy/core/constants/app_colors.dart';

/// Returns [lightColor] in light mode and the theme's `onSurface` color in dark
/// mode. This keeps light-theme text exactly as it was while making dark-mode
/// text readable (dark text on a dark surface would otherwise be unreadable).
Color adaptiveTextColor(BuildContext context, Color lightColor) =>
    Theme.of(context).brightness == Brightness.dark
        ? Theme.of(context).colorScheme.onSurface
        : lightColor;

class AppTextStyles {
  static TextStyle s30w700(BuildContext context) => TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: AppColors.headerColor,
  );
  static TextStyle s24w600(BuildContext context) =>
      TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white);
  static TextStyle s14w600(BuildContext context) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: adaptiveTextColor(context, Colors.black),
  );
  static TextStyle s18w600(BuildContext context) =>
      TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white);
  static TextStyle s20w700(BuildContext context) =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white);
  static TextStyle s12w600(BuildContext context) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: adaptiveTextColor(context, AppColors.cardCostColor),
  );
  static TextStyle s16w400(BuildContext context) =>
      TextStyle(fontSize: 12, color: Colors.black);
}
