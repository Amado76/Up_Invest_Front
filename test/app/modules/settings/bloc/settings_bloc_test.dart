import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings_bloc.dart';

void main() {
  group('[SettingsBloc]', () {
    late SettingsBloc settingsBloc;
    setUp(() => {settingsBloc = SettingsBloc()});

    blocTest<SettingsBloc, SettingsState>(
        'when [SettingsEventChangeThemeToDark] is added emits [SettingsStateGlobal] with [themeMode.dark]',
        build: () => settingsBloc,
        act: (bloc) => settingsBloc.add(const SettingsEventChangeThemeToDark()),
        verify: (bloc) {
          expect((bloc.state as SettingsStateGlobal).themeMode, ThemeMode.dark);
        });
    blocTest<SettingsBloc, SettingsState>(
        'when [SettingsEventChangeThemeToLight] is added emits [SettingsStateGlobal] with [themeMode.light]',
        build: () => settingsBloc,
        act: (bloc) =>
            settingsBloc.add(const SettingsEventChangeThemeToLight()),
        verify: (bloc) {
          expect(
              (bloc.state as SettingsStateGlobal).themeMode, ThemeMode.light);
        });
  });
}
