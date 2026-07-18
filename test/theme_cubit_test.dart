// Verifies Phase A – Step 4: ThemeCubit persistence & restoration.
//
// There is no theme-switching UI yet, so this test is the verification path for
// light / dark / system selection, persistence, and restoration after restart.
//
// A real cold start awaits CacheHelper.init() (which loads the persisted store
// into the in-memory cache) and then reads the mode once. To emulate that
// process boundary between "save" and "restart" we call CacheHelper.updateData()
// (reload store -> cache) before constructing the post-restart cubit.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_academy/core/shared_pref/cache_helper.dart';
import 'package:your_academy/core/theme/theme_cubit.dart';

void main() {
  // CacheHelper stores SharedPreferences in a `late final` field, so it can only
  // be initialized once per test process.
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await CacheHelper.init();
  });

  setUp(() async {
    await CacheHelper.clearData();
  });

  test('defaults to ThemeMode.system when nothing is saved', () {
    final cubit = ThemeCubit();
    expect(cubit.themeMode, ThemeMode.system);
    expect(cubit.state.themeMode, ThemeMode.system);
  });

  test('setThemeMode updates the current mode and the emitted state', () async {
    final cubit = ThemeCubit();
    await cubit.setThemeMode(ThemeMode.dark);
    expect(cubit.themeMode, ThemeMode.dark);
    expect(cubit.state.themeMode, ThemeMode.dark);
  });

  test('persisted mode is restored after a restart', () async {
    await ThemeCubit().setThemeMode(ThemeMode.light);
    await CacheHelper.updateData(); // emulate cold-start store -> cache load

    final afterRestart = ThemeCubit();
    expect(afterRestart.themeMode, ThemeMode.light);
    expect(afterRestart.state.themeMode, ThemeMode.light);
  });

  test('all three modes round-trip through persistence', () async {
    for (final mode in ThemeMode.values) {
      await ThemeCubit().setThemeMode(mode);
      await CacheHelper.updateData(); // emulate cold-start store -> cache load
      expect(
        ThemeCubit().themeMode,
        mode,
        reason: 'mode $mode should be restored after a restart',
      );
    }
  });
}
