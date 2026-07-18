import 'package:flutter/material.dart';

/// States for [LocaleCubit]. Each state carries the current [Locale] so the UI
/// can read it directly from the emitted state.
abstract class LocaleState {
  final Locale locale;

  const LocaleState(this.locale);
}

class LocaleInitial extends LocaleState {
  const LocaleInitial(super.locale);
}

class LocaleChanged extends LocaleState {
  const LocaleChanged(super.locale);
}
