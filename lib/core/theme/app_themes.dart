import 'package:flutter/material.dart';
import 'package:your_academy/core/constants/app_colors.dart';

class AppThemes {
  static ThemeData lightTheme =ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      backgroundColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
      selectedIconTheme: IconThemeData(size: 28),
      unselectedIconTheme: IconThemeData(size: 22),
        selectedLabelStyle:   TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600
        ),
      unselectedLabelStyle:   TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400
      ),
      type: BottomNavigationBarType.fixed,

    )
  );
  static ThemeData darkTheme =ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
  );
}