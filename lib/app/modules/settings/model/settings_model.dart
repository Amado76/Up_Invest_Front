import 'package:flutter/material.dart' show ThemeMode;

class SettingsModel {
  ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode value) {
    _themeMode = value;
  }

  SettingsModel({required ThemeMode themeMode}) : _themeMode = themeMode;
}
