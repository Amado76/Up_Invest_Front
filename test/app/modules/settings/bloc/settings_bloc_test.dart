import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings_bloc.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';

import '../../../../mocks/adapter/shared_preferences_mock.dart';
import '../../../../mocks/repository/settings_repository_mock.dart';

void main() {
  group('[SettingsBloc]', () {
    late SettingsBloc settingsBloc;
    late LocalStorageAdapterMock localStorageAdapterMock;
    late SettingsRepositoryMock settingsRepositoryMock;

    setUp(() => {
          registerFallbackValue(SettingsModel(
              themeMode: ThemeMode.light, locale: const Locale('en'))),
          localStorageAdapterMock = LocalStorageAdapterMock(),
          settingsRepositoryMock =
              SettingsRepositoryMock(localStorageAdapterMock),
          settingsBloc =
              SettingsBloc(settingsRepository: settingsRepositoryMock),
          when(() => settingsRepositoryMock.saveSettingsToLocalStorage(any()))
              .thenAnswer((_) => Future.value()),
        });

    blocTest<SettingsBloc, SettingsState>(
        'when [SettingsEventChangeThemeToDark] is added emits [SettingsStateGlobal] with [themeMode.dark]',
        setUp: () {},
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
