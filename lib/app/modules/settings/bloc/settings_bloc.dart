import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc()
      : super(SettingsStateGlobal(
            settingsModel: SettingsModel(themeMode: ThemeMode.system))) {
    on<SettingsEventChangeThemeToDark>((event, emit) {
      final currentState = state as SettingsStateGlobal;
      final currentSettings = currentState.settingsModel;
      currentSettings.themeMode = ThemeMode.dark;
      emit(SettingsStateGlobal(settingsModel: currentSettings));
    });
    on<SettingsEventChangeThemeToLight>((event, emit) {
      final currentState = state as SettingsStateGlobal;
      final currentSettings = currentState.settingsModel;
      currentSettings.themeMode = ThemeMode.light;
      emit(SettingsStateGlobal(settingsModel: currentSettings));
    });
  }
}
