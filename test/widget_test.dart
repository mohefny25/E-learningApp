// Minimal smoke test for YOUR ACADEMY.
//
// Verifies that the localization stack is wired correctly (English & Arabic
// resolve) and that the brand name is never translated. This replaces the
// default `flutter create` counter template, which never matched this app.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:your_academy/core/constants/app_strings.dart';
import 'package:your_academy/l10n/app_localizations.dart';

void main() {
  Future<AppLocalizations> pumpAndReadL10n(
    WidgetTester tester,
    Locale locale,
  ) async {
    late AppLocalizations l10n;
    await tester.pumpWidget(
      MaterialApp(
        locale: locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) {
            l10n = AppLocalizations.of(context)!;
            return const SizedBox();
          },
        ),
      ),
    );
    return l10n;
  }

  testWidgets('English localization resolves core strings', (tester) async {
    final l10n = await pumpAndReadL10n(tester, const Locale('en'));
    expect(l10n.login, 'Login');
    expect(l10n.profile, 'Profile');
  });

  testWidgets('Arabic localization resolves core strings', (tester) async {
    final l10n = await pumpAndReadL10n(tester, const Locale('ar'));
    expect(l10n.login, 'تسجيل الدخول');
  });

  test('brand name is never translated', () {
    expect(AppStrings.appName, 'YOUR ACADEMY');
  });
}
