// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart' show Locale, ThemeMode;

enum Currency {
  usd,
  brl,
}

class SettingsModel {
  ThemeMode _themeMode;
  Locale? _locale;
  Currency _currency;

  ThemeMode get themeMode => _themeMode;
  Locale? get locale => _locale;
  Currency get currency => _currency;

  set themeMode(ThemeMode value) {
    _themeMode = value;
  }

  set currency(Currency value) {
    _currency = value;
  }

  set locale(Locale? value) {
    _locale = value;
  }

  SettingsModel(
      {required ThemeMode themeMode,
      required Currency currency,
      Locale? locale})
      : _themeMode = themeMode,
        _locale = locale,
        _currency = currency;
}
