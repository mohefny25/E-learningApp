import 'package:flutter/material.dart';
import 'package:your_academy/core/constants/app_colors.dart';

class AppThemes {
  // Dark surface / background tone. Kept local to the theme layer because
  // app_colors.dart is intentionally left untouched in this step; it can be
  // promoted into AppColors later if it becomes reused elsewhere.
  static const Color _darkSurface = Color(0xFF121212);

  // Shared brand-blue bottom navigation styling. Extracted once so it is not
  // duplicated between the light and dark themes; using it in both keeps the
  // navigation bar looking identical across them.
  static const BottomNavigationBarThemeData
  _bottomNavTheme = BottomNavigationBarThemeData(
    selectedItemColor: Colors.white,
    backgroundColor: AppColors.primaryColor,
    unselectedItemColor: Colors.grey,
    selectedIconTheme: IconThemeData(size: 28),
    unselectedIconTheme: IconThemeData(size: 22),
    selectedLabelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    unselectedLabelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
    type: BottomNavigationBarType.fixed,
  );

  // Explicit dark palette built from the existing AppColors (no
  // ColorScheme.fromSeed) so the brand identity stays fully under our control.
  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primaryColor,
    onPrimary: Colors.white,
    secondary: AppColors.secondaryColor,
    onSecondary: Colors.white,
    error: Color(0xFFCF6679),
    onError: Colors.black,
    surface: _darkSurface,
    onSurface: Colors.white,
  );

  // Light theme — kept visually identical to the current app. Same properties
  // and values as before (no explicit colorScheme, so default-colored widgets
  // such as CircularProgressIndicator render exactly as they do today).
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    bottomNavigationBarTheme: _bottomNavTheme,
  );

  // Dark theme — brand-consistent palette, ready for the upcoming
  // ThemeCubit / ThemeMode integration (Steps 3–4). Not active yet.
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    colorScheme: _darkColorScheme,
    scaffoldBackgroundColor: _darkSurface,
    bottomNavigationBarTheme: _bottomNavTheme,
  );
}
