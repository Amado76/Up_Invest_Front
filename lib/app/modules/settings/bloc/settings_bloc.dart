// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable, visibleForTesting;
import 'package:flutter/material.dart' show Locale, ThemeMode;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';
import 'package:up_invest_front/app/modules/settings/repository/settings_repository.dart';

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
    on<SettingsEventFetchSavedSettings>((event, emit) async {
      _onGetSavedSettings();
    });
  }

  void _onChangeTheme(String theme) async {
    final currentState = state as SettingsStateGlobal;
    final currentSettings = currentState.settingsModel;
    SettingsModel newSettings =
        SettingsModel(themeMode: currentSettings.themeMode);
    newSettings.themeMode = (theme == 'system')
        ? ThemeMode.system
        : (theme == 'dark')
            ? ThemeMode.dark
            : ThemeMode.light;
    await saveSettings(newSettings);

    emit(SettingsStateGlobal(settingsModel: newSettings));
  }

  void _onGetSavedSettings() async {
    final SettingsModel fetchedSettingsModel;
    fetchedSettingsModel =
        await settingsRepository.getSettingsFromLocalStorage();
    emit(SettingsStateGlobal(settingsModel: fetchedSettingsModel));
  }

  @visibleForTesting
  Future<void> saveSettings(SettingsModel currentSettings) async {
    await settingsRepository.saveSettingsToLocalStorage(currentSettings);
  }
}
