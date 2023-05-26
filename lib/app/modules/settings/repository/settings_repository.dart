import 'package:flutter/material.dart' show Locale, ThemeMode;
import 'package:up_invest_front/app/core/adapter/local_storage_adapter/local_storage_adapter_interface.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';

sealed class ISettingsRepository {
  final ILocalStorageAdapter localStorageAdapter;
  ISettingsRepository({required this.localStorageAdapter});
  Future<void> saveSettingsToLocalStorage(SettingsModel settingsModel);
  Future<SettingsModel> getSettingsFromLocalStorage();
}

class SettingsRepository extends ISettingsRepository {
  SettingsRepository({required super.localStorageAdapter});

  @override
  Future<SettingsModel> getSettingsFromLocalStorage() async {
    String? theme =
        await localStorageAdapter.readStringFromLocalStorage('theme');
    String? language =
        await localStorageAdapter.readStringFromLocalStorage('language');
    ThemeMode themeMode = _stringToThemeMode(theme ?? 'system');
    Locale? locale = _stringToLocale(language);
    SettingsModel settingsModel =
        SettingsModel(themeMode: themeMode, locale: locale);
    return settingsModel;
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
    String theme = _themeModeToString(themeMode);
    String? language = _localeToString(locale);
    await localStorageAdapter.saveStringToLocalStorage('theme', theme);
    if (language != null) {
      await localStorageAdapter.saveStringToLocalStorage('language', language);
    }
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
