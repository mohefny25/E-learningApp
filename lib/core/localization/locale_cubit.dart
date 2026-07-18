import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_academy/core/shared_pref/cache_helper.dart';
import 'locale_states.dart';

/// Holds the app's current [Locale] (English / Arabic), notifies the UI when it
/// changes, and persists the selection via [CacheHelper] — mirroring the
/// philosophy of ThemeCubit.
///
/// The saved language is read synchronously in the constructor (CacheHelper is
/// initialized in `main()`), so the correct language is applied on the first
/// frame with no flicker. When nothing has been saved yet, it follows the device
/// language when supported, otherwise defaults to English.
class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial(_loadLocale())) {
    locale = state.locale;
  }

  static LocaleCubit get(context) => BlocProvider.of(context);

  Locale locale = english;

  static const Locale english = Locale('en');
  static const Locale arabic = Locale('ar');

  /// Storage key for the persisted language selection.
  static const String _localeKey = 'app_locale';

  /// Sets an explicit [Locale] and persists it. The state is emitted
  /// immediately (instant UI update); the save runs after.
  Future<void> setLocale(Locale newLocale) async {
    locale = newLocale;
    emit(LocaleChanged(newLocale));
    await CacheHelper.saveData(key: _localeKey, value: newLocale.languageCode);
  }

  /// Toggles between English and Arabic.
  Future<void> toggleLocale() =>
      setLocale(locale.languageCode == 'ar' ? english : arabic);

  /// Reads the persisted language, falling back to the device language (when
  /// supported) and then to English.
  static Locale _loadLocale() {
    final saved = CacheHelper.getData(key: _localeKey);
    if (saved is String) return _localeFromCode(saved);
    final deviceCode =
        WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    return deviceCode == 'ar' ? arabic : english;
  }

  static Locale _localeFromCode(String code) => code == 'ar' ? arabic : english;
}
