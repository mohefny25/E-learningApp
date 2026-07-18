import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_academy/core/shared_pref/cache_helper.dart';
import 'theme_states.dart';

/// Holds the app's current [ThemeMode] (light / dark / system), notifies the UI
/// when it changes, and persists the selection via [CacheHelper].
///
/// The saved mode is read synchronously in the constructor — CacheHelper is
/// initialized beforehand in `main()` — so the correct theme is available on the
/// very first frame and there is no startup flicker. When nothing has been saved
/// yet, the mode defaults to [ThemeMode.system].
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial(_loadThemeMode())) {
    themeMode = state.themeMode;
  }

  static ThemeCubit get(context) => BlocProvider.of(context);

  ThemeMode themeMode = ThemeMode.system;

  /// Storage key for the persisted theme selection.
  static const String _themeModeKey = 'theme_mode';

  /// Sets an explicit [ThemeMode] (light, dark or system) and persists it.
  /// The state is emitted immediately (instant UI update); the save runs after.
  Future<void> setThemeMode(ThemeMode mode) async {
    themeMode = mode;
    emit(ThemeChanged(mode));
    await CacheHelper.saveData(key: _themeModeKey, value: _modeToString(mode));
  }

  /// Toggles between light and dark. When the current mode is
  /// [ThemeMode.system], this makes an explicit choice by switching to dark.
  Future<void> toggleTheme() => setThemeMode(
    themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark,
  );

  /// Reads the persisted mode, defaulting to [ThemeMode.system] when absent.
  static ThemeMode _loadThemeMode() {
    final saved = CacheHelper.getData(key: _themeModeKey);
    return _modeFromString(saved is String ? saved : null);
  }

  // Conversion helpers keep the persisted string representation in a single
  // place, so literals like 'light' / 'dark' / 'system' are never spread around.
  static String _modeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }

  static ThemeMode _modeFromString(String? value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
