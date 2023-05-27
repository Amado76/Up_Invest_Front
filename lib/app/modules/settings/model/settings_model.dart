// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart' show Locale, ThemeMode;

class SettingsModel {
  ThemeMode _themeMode;
  Locale? _locale;

  ThemeMode get themeMode => _themeMode;
  Locale? get locale => _locale;

  set themeMode(ThemeMode value) {
    _themeMode = value;
  }

  set locale(Locale? value) {
    _locale = value;
  }

  SettingsModel({required ThemeMode themeMode, Locale? locale})
      : _themeMode = themeMode,
        _locale = locale;
}
