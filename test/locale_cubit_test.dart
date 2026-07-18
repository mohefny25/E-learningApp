// Verifies Phase B: LocaleCubit selection, persistence and restart-restoration.
//
// Mirrors the ThemeCubit test. A real cold start awaits CacheHelper.init()
// (loads the persisted store into cache) and reads the locale once; to emulate
// the process boundary between "save" and "restart" we call
// CacheHelper.updateData() before constructing the post-restart cubit.

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_academy/core/localization/locale_cubit.dart';
import 'package:your_academy/core/shared_pref/cache_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await CacheHelper.init();
  });

  setUp(() async {
    await CacheHelper.clearData();
  });

  test('defaults to a supported locale when nothing is saved', () {
    final cubit = LocaleCubit();
    expect(cubit.locale, anyOf(LocaleCubit.english, LocaleCubit.arabic));
    expect(cubit.state.locale, cubit.locale);
  });

  test('setLocale updates the current locale and the emitted state', () async {
    final cubit = LocaleCubit();
    await cubit.setLocale(LocaleCubit.arabic);
    expect(cubit.locale, LocaleCubit.arabic);
    expect(cubit.state.locale, LocaleCubit.arabic);
  });

  test('persisted locale is restored after a restart', () async {
    await LocaleCubit().setLocale(LocaleCubit.arabic);
    await CacheHelper.updateData(); // emulate cold-start store -> cache load

    final afterRestart = LocaleCubit();
    expect(afterRestart.locale, LocaleCubit.arabic);
  });

  test('toggleLocale switches between English and Arabic', () async {
    final cubit = LocaleCubit();
    await cubit.setLocale(LocaleCubit.english);
    await cubit.toggleLocale();
    expect(cubit.locale, LocaleCubit.arabic);
    await cubit.toggleLocale();
    expect(cubit.locale, LocaleCubit.english);
  });
}
