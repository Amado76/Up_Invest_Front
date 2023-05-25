import 'package:flutter/material.dart' show ThemeMode;
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
    ThemeMode themeMode = _stringToThemeMode(theme ?? 'system');
    SettingsModel settingsModel = SettingsModel(themeMode: themeMode);
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

  @override
  Future<void> saveSettingsToLocalStorage(SettingsModel settingsModel) async {
    ThemeMode themeMode = settingsModel.themeMode;
    String theme = _themeModeToString(themeMode);
    await localStorageAdapter.saveStringToLocalStorage('theme', theme);
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
