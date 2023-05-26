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
        'when [SettingsEventChangeTheme] is added with ["system"]emits [SettingsStateGlobal] with [themeMode.system]',
        build: () => settingsBloc,
        act: (bloc) =>
            settingsBloc.add(const SettingsEventChangeTheme(theme: 'system')),
        verify: (bloc) {
          expect((bloc.state as SettingsStateGlobal).settingsModel.themeMode,
              ThemeMode.system);
        });
    blocTest<SettingsBloc, SettingsState>(
        'when [SettingsEventChangeTheme] is added with ["system"]emits [SettingsStateGlobal] with [themeMode.dark]',
        build: () => settingsBloc,
        act: (bloc) =>
            settingsBloc.add(const SettingsEventChangeTheme(theme: 'dark')),
        verify: (bloc) {
          expect((bloc.state as SettingsStateGlobal).settingsModel.themeMode,
              ThemeMode.dark);
        });
    blocTest<SettingsBloc, SettingsState>(
        'when [SettingsEventChangeTheme] is added with ["system"]emits [SettingsStateGlobal] with [themeMode.light]',
        build: () => settingsBloc,
        act: (bloc) =>
            settingsBloc.add(const SettingsEventChangeTheme(theme: 'light')),
        verify: (bloc) {
          expect((bloc.state as SettingsStateGlobal).settingsModel.themeMode,
              ThemeMode.light);
        });
  });
}
