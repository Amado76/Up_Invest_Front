// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable, visibleForTesting;
import 'package:flutter/material.dart' show Locale, ThemeMode;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';
import 'package:up_invest_front/app/modules/settings/repository/settings_repository.dart';
import 'package:up_invest_front/app/modules/settings/util/settings_error.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final ISettingsRepository settingsRepository;
  SettingsBloc({required this.settingsRepository})
      : super(SettingsStateGlobal(
            settingsModel: SettingsModel(themeMode: ThemeMode.system))) {
    on<SettingsEventChangeTheme>((event, emit) {
      _onChangeTheme(event.theme);
    });
    on<SettingsEventChangeLanguage>((event, emit) async {
      _onChangeLanguage(event.language);
    });
    on<SettingsEventFetchSavedSettings>((event, emit) async {
      _onFetchSavedSettings();
    });
  }

  void _onChangeTheme(String theme) async {
    SettingsModel currentSettings = _getCurrentSettings();

    try {
      SettingsModel newSettings = _generateNewSettings(currentSettings);
      newSettings.themeMode = (theme == 'system')
          ? ThemeMode.system
          : (theme == 'dark')
              ? ThemeMode.dark
              : ThemeMode.light;
      await saveSettings(newSettings);

      emit(SettingsStateGlobal(settingsModel: newSettings));
    } on Exception catch (e) {
      emit(SettingsStateGlobal(
          settingsModel: currentSettings,
          settingsError: SettingsError.from(e)));
    }
  }

  void _onChangeLanguage(String language) async {
    SettingsModel currentSettings = _getCurrentSettings();
    try {
      SettingsModel newSettings = _generateNewSettings(currentSettings);
      newSettings.locale = Locale(language);
      await saveSettings(newSettings);
      emit(SettingsStateGlobal(settingsModel: newSettings));
    } on Exception catch (e) {
      emit(SettingsStateGlobal(
          settingsModel: currentSettings,
          settingsError: SettingsError.from(e)));
    }
  }

  void _onFetchSavedSettings() async {
    final SettingsModel fetchedSettingsModel;
    fetchedSettingsModel =
        await settingsRepository.fetchSettingsFromLocalStorage();
    emit(SettingsStateGlobal(settingsModel: fetchedSettingsModel));
  }

  @visibleForTesting
  Future<void> saveSettings(SettingsModel currentSettings) async {
    await settingsRepository.saveSettingsToLocalStorage(currentSettings);
  }

  SettingsModel _generateNewSettings(SettingsModel currentSettings) {
    SettingsModel newSettings = SettingsModel(
        themeMode: currentSettings.themeMode, locale: currentSettings.locale);
    return newSettings;
  }

  SettingsModel _getCurrentSettings() {
    final currentState = state as SettingsStateGlobal;
    final currentSettings = currentState.settingsModel;
    return currentSettings;
  }
}
