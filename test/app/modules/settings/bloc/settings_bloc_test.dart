import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings_bloc.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';
import 'package:up_invest_front/app/modules/settings/util/settings_error.dart';

import '../../../../mocks/core/adapter/shared_preferences_mock.dart';
import '../../../../mocks/settings/model/settings_model_mock.dart';
import '../../../../mocks/settings/repository/settings_repository_mock.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'en'));
  group('[SettingsBloc]', () {
    late SettingsBloc settingsBloc;
    late LocalStorageAdapterMock localStorageAdapterMock;
    late SettingsRepositoryMock settingsRepositoryMock;
    late SettingsModelMock settingsModelMock;

    setUp(() => {
          settingsModelMock = SettingsModelMock(),
          localStorageAdapterMock = LocalStorageAdapterMock(),
          settingsRepositoryMock =
              SettingsRepositoryMock(localStorageAdapterMock),
          settingsBloc =
              SettingsBloc(settingsRepository: settingsRepositoryMock),
          registerFallbackValue(SettingsModel(
              currency: Currency.usd,
              themeMode: ThemeMode.light,
              locale: const Locale('en'))),
        });

    //SettingsEventChangeTheme
    group('when [SettingsEventChangeTheme] is added ', () {
      blocTest<SettingsBloc, SettingsState>(
          'with ["system"]emits [SettingsStateGlobal] with [themeMode.system]',
          setUp: () {
            when(() => settingsRepositoryMock.saveSettingsToLocalStorage(any()))
                .thenAnswer((_) => Future.value());
          },
          build: () => settingsBloc,
          act: (bloc) =>
              settingsBloc.add(const SettingsEventChangeTheme(theme: 'system')),
          verify: (bloc) {
            expect((bloc.state as SettingsStateGlobal).settingsModel.themeMode,
                ThemeMode.system);
          });
      blocTest<SettingsBloc, SettingsState>(
          'with ["system"]emits [SettingsStateGlobal] with [themeMode.dark]',
          setUp: () {
            when(() => settingsRepositoryMock.saveSettingsToLocalStorage(any()))
                .thenAnswer((_) => Future.value());
          },
          build: () => settingsBloc,
          act: (bloc) =>
              settingsBloc.add(const SettingsEventChangeTheme(theme: 'dark')),
          verify: (bloc) {
            expect((bloc.state as SettingsStateGlobal).settingsModel.themeMode,
                ThemeMode.dark);
          });
      blocTest<SettingsBloc, SettingsState>(
          'with ["system"]emits [SettingsStateGlobal] with [themeMode.light]',
          setUp: () {
            when(() => settingsRepositoryMock.saveSettingsToLocalStorage(any()))
                .thenAnswer((_) => Future.value());
          },
          build: () => settingsBloc,
          act: (bloc) =>
              settingsBloc.add(const SettingsEventChangeTheme(theme: 'light')),
          verify: (bloc) {
            expect((bloc.state as SettingsStateGlobal).settingsModel.themeMode,
                ThemeMode.light);
          });
      blocTest<SettingsBloc, SettingsState>(
          'fails emits [SettingsStateGlobal] with [error)]',
          setUp: () {
            when(() => settingsRepositoryMock.saveSettingsToLocalStorage(any()))
                .thenThrow(Exception('error-on-save'));
          },
          build: () => settingsBloc,
          seed: () => SettingsStateGlobal(settingsModel: settingsModelMock),
          act: (bloc) =>
              settingsBloc.add(const SettingsEventChangeTheme(theme: 'light')),
          expect: () => <SettingsState>[
                SettingsStateGlobal(
                    settingsModel: settingsModelMock,
                    settingsError: SettingsErrorOnSave())
              ]);
    });
    group('when [SettingsEventChangeLanguage] is added', () {
      blocTest<SettingsBloc, SettingsState>(
          'with ["en"] emits [SettingsStateGlobal] with [Locale("en")]',
          setUp: () {
            when(() => settingsRepositoryMock.saveSettingsToLocalStorage(any()))
                .thenAnswer((_) => Future.value());
          },
          build: () => settingsBloc,
          act: (bloc) => settingsBloc
              .add(const SettingsEventChangeLanguage(language: 'en')),
          verify: (bloc) {
            expect((bloc.state as SettingsStateGlobal).settingsModel.locale,
                const Locale('en'));
          });
      blocTest<SettingsBloc, SettingsState>(
          'fails emits [SettingsStateGlobal] with [error)]',
          setUp: () {
            when(() => settingsRepositoryMock.saveSettingsToLocalStorage(any()))
                .thenThrow(Exception('error-on-save'));
          },
          build: () => settingsBloc,
          seed: () => SettingsStateGlobal(settingsModel: settingsModelMock),
          act: (bloc) => settingsBloc
              .add(const SettingsEventChangeLanguage(language: 'en')),
          expect: () => <SettingsState>[
                SettingsStateGlobal(
                    settingsModel: settingsModelMock,
                    settingsError: SettingsErrorOnSave())
              ]);
    });
    group('when [SettingsEventChangeCurrency] is added', () {
      blocTest<SettingsBloc, SettingsState>(
          'with ["Currency.brl"] emits [SettingsStateGlobal] with [Currency.brl]',
          setUp: () {
            when(() => settingsRepositoryMock.saveSettingsToLocalStorage(any()))
                .thenAnswer((_) => Future.value());
          },
          build: () => settingsBloc,
          seed: () => SettingsStateGlobal(settingsModel: settingsModelMock),
          act: (bloc) => settingsBloc
              .add(const SettingsEventChangeCurrency(currency: Currency.brl)),
          verify: (bloc) {
            expect((bloc.state as SettingsStateGlobal).settingsModel.currency,
                Currency.brl);
          });
      blocTest<SettingsBloc, SettingsState>(
          'fails emits [SettingsStateGlobal] with [error)]',
          setUp: () {
            when(() => settingsRepositoryMock.saveSettingsToLocalStorage(any()))
                .thenThrow(Exception('error-on-save'));
          },
          build: () => settingsBloc,
          seed: () => SettingsStateGlobal(settingsModel: settingsModelMock),
          act: (bloc) => settingsBloc
              .add(const SettingsEventChangeCurrency(currency: Currency.usd)),
          expect: () => <SettingsState>[
                SettingsStateGlobal(
                    settingsModel: settingsModelMock,
                    settingsError: SettingsErrorOnSave())
              ]);
    });
    group('when [SettingsEventFetchSavedSettings] is added', () {
      blocTest<SettingsBloc, SettingsState>(
        'emits [SettingsStateGlobal] with settingsModelMock]',
        setUp: () =>
            when(() => settingsRepositoryMock.fetchSettingsFromLocalStorage())
                .thenAnswer((_) async => settingsModelMock),
        build: () => settingsBloc,
        act: (bloc) =>
            settingsBloc.add(const SettingsEventFetchSavedSettings()),
        expect: () => <SettingsState>{
          SettingsStateGlobal(settingsModel: settingsModelMock)
        },
      );
    });
  });
}
