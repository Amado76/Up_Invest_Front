// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings_bloc.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';

void main() {
  group('[SettingsEventChangeTheme]', () {
    String theme = 'theme';
    test('supports value comparisons', () {
      expect(SettingsEventChangeTheme(theme: theme),
          SettingsEventChangeTheme(theme: theme));
    });
  });
  group('[SettingsEventChangeTheme]', () {
    String language = 'language';
    test('supports value comparisons', () {
      expect(SettingsEventChangeLanguage(language: language),
          SettingsEventChangeLanguage(language: language));
    });
  });
  group('[SettingsEventFetchSavedSettings]', () {
    test('supports value comparisons', () {
      expect(
          SettingsEventFetchSavedSettings(), SettingsEventFetchSavedSettings());
    });
  });
  group('[SettingsEventChangeCurrency]', () {
    test('supports value comparisons', () {
      expect(SettingsEventChangeCurrency(currency: Currency.brl),
          SettingsEventChangeCurrency(currency: Currency.brl));
    });
  });
}
