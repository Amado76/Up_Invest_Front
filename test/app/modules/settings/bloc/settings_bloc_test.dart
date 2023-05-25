import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings_bloc.dart';
import 'package:up_invest_front/app/modules/settings/repository/settings_repository.dart';

import '../../../../mocks/adapter/shared_preferences_mock.dart';

void main() {
  group('[SettingsBloc]', () {
    late SettingsBloc settingsBloc;
    setUp(() => {
          settingsBloc = SettingsBloc(
              settingsRepository: SettingsRepository(
                  localStorageAdapter: LocalStorageAdapterMock()))
        });

    blocTest<SettingsBloc, SettingsState>(
        'when [SettingsEventChangeThemeToDark] is added emits [SettingsStateGlobal] with [themeMode.dark]',
        build: () => settingsBloc,
        act: (bloc) => settingsBloc.add(const SettingsEventChangeThemeToDark()),
        verify: (bloc) {
          expect((bloc.state as SettingsStateGlobal).settingsModel.themeMode,
              ThemeMode.dark);
        });
    blocTest<SettingsBloc, SettingsState>(
        'when [SettingsEventChangeThemeToLight] is added emits [SettingsStateGlobal] with [themeMode.light]',
        build: () => settingsBloc,
        act: (bloc) =>
            settingsBloc.add(const SettingsEventChangeThemeToLight()),
        verify: (bloc) {
          expect((bloc.state as SettingsStateGlobal).settingsModel.themeMode,
              ThemeMode.light);
        });
    blocTest<SettingsBloc, SettingsState>(
        'when [SettingsEventChangeThemeToSystem] is added emits [SettingsStateGlobal] with [themeMode.System]',
        build: () => settingsBloc,
        act: (bloc) =>
            settingsBloc.add(const SettingsEventChangeThemeToSystem()),
        verify: (bloc) {
          expect((bloc.state as SettingsStateGlobal).settingsModel.themeMode,
              ThemeMode.system);
        });
  });
}
