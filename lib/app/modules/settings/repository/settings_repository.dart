import 'package:flutter/material.dart' show Locale, ThemeMode;
import 'package:up_invest_front/app/core/adapter/local_storage_adapter/local_storage_adapter_interface.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';

sealed class ISettingsRepository {
  final ILocalStorageAdapter localStorageAdapter;
  ISettingsRepository({required this.localStorageAdapter});
  Future<void> saveSettingsToLocalStorage(SettingsModel settingsModel);
  Future<SettingsModel> fetchSettingsFromLocalStorage();
}

class SettingsRepository extends ISettingsRepository {
  SettingsRepository({required super.localStorageAdapter});

  @override
  Future<SettingsModel> fetchSettingsFromLocalStorage() async {
    String? theme =
        await localStorageAdapter.readStringFromLocalStorage('theme');
    String? language =
        await localStorageAdapter.readStringFromLocalStorage('language');
    String? fetchedCurrency =
        await localStorageAdapter.readStringFromLocalStorage('currency');
    ThemeMode themeMode = _stringToThemeMode(theme ?? 'system');
    Locale? locale = _stringToLocale(language);
    Currency currency = _stringToCurrency(fetchedCurrency ?? 'USD');
    SettingsModel settingsModel =
        SettingsModel(themeMode: themeMode, locale: locale, currency: currency);
    return settingsModel;
  }

  Currency _stringToCurrency(String currency) {
    if (currency == 'BRL') {
      return Currency.brl;
    }
    return Currency.usd;
  }

  ThemeMode _stringToThemeMode(String theme) {
    if (theme == 'dark') {
      return ThemeMode.dark;
    }
    if (theme == 'light') {
      return ThemeMode.light;
    }
    return ThemeMode.system;
  }

  Locale? _stringToLocale(String? language) {
    if (language == null) {
      return null;
    }
    return Locale(language);
  }

  @override
  Future<void> saveSettingsToLocalStorage(SettingsModel settingsModel) async {
    ThemeMode themeMode = settingsModel.themeMode;
    Locale? locale = settingsModel.locale;
    String currency = _currencyToString(settingsModel.currency);
    String theme = _themeModeToString(themeMode);
    String? language = _localeToString(locale);
    await localStorageAdapter.saveStringToLocalStorage('theme', theme);
    await localStorageAdapter.saveStringToLocalStorage('currency', currency);
    if (language != null) {
      await localStorageAdapter.saveStringToLocalStorage('language', language);
    }
  }

  String _currencyToString(Currency currency) {
    if (currency == Currency.brl) {
      return 'BRL';
    }
    return 'USD';
  }

  String? _localeToString(Locale? locale) {
    if (locale == null) {
      return null;
    }
    return locale.languageCode;
  }

  String _themeModeToString(ThemeMode themeMode) {
    if (themeMode == ThemeMode.dark) {
      return 'dark';
    }
    if (themeMode == ThemeMode.light) {
      return 'light';
    }
    return 'system';
  }
}
