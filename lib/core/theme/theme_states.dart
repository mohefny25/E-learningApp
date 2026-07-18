import 'package:flutter/material.dart';

/// States for [ThemeCubit]. Each state carries the current [ThemeMode] so the
/// UI can read it directly from the emitted state.
abstract class ThemeState {
  final ThemeMode themeMode;

  const ThemeState(this.themeMode);
}

class ThemeInitial extends ThemeState {
  const ThemeInitial(super.themeMode);
}

class ThemeChanged extends ThemeState {
  const ThemeChanged(super.themeMode);
}
