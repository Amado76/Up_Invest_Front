import 'package:flutter/material.dart' show Locale, ThemeMode;
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';

class SettingsModelMock extends Mock implements SettingsModel {
  ThemeMode _themeMode = ThemeMode.dark;
  Locale? _locale = const Locale('en');
  Currency _currency = Currency.usd;

  @override
  ThemeMode get themeMode => _themeMode;
  @override
  Locale? get locale => _locale;
  @override
  Currency get currency => _currency;

  @override
  set themeMode(ThemeMode value) {
    _themeMode = value;
  }

  @override
  set locale(Locale? value) {
    _locale = value;
  }

  @override
  set currency(Currency value) {
    _currency = value;
  }
}
