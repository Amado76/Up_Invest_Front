import 'package:flutter/material.dart' show Locale, ThemeMode;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/adapter/local_storage_adapter/local_storage_adapter_interface.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';
import 'package:up_invest_front/app/modules/settings/repository/settings_repository.dart';

import '../../../../mocks/core/adapter/shared_preferences_mock.dart';

void main() async {
  group('SettingsRepository', () {
    late SharedPreferencesAdapter localStorageAdapterMock;
    late SettingsRepository settingsRepository;

    setUp(() {
      localStorageAdapterMock = LocalStorageAdapterMock();
      settingsRepository =
          SettingsRepository(localStorageAdapter: localStorageAdapterMock);
    });

    group('[getSettingsFromLocalStorage]', () {
      test(
          'should return [SettingsModel] with [ThemeMode.dark] when [LocalStorageAdapter] return [dark]',
          () async {
        //Arrange
        when(() => localStorageAdapterMock.readStringFromLocalStorage('theme'))
            .thenAnswer((_) async => 'dark');
        when(() =>
                localStorageAdapterMock.readStringFromLocalStorage('language'))
            .thenAnswer((_) async => null);
        when(() =>
                localStorageAdapterMock.readStringFromLocalStorage('currency'))
            .thenAnswer((_) async => null);
        final SettingsModel settings;
        //Act
        settings = await settingsRepository.fetchSettingsFromLocalStorage();
        //Assert
        expect(settings.themeMode, ThemeMode.dark);
      });
      test(
          'should return [SettingsModel] with [ThemeMode.light] when [LocalStorageAdapter] return [light]',
          () async {
        //Arrange
        when(() => localStorageAdapterMock.readStringFromLocalStorage('theme'))
            .thenAnswer((_) async => 'light');
        when(() =>
                localStorageAdapterMock.readStringFromLocalStorage('language'))
            .thenAnswer((_) async => null);
        when(() =>
                localStorageAdapterMock.readStringFromLocalStorage('currency'))
            .thenAnswer((_) async => null);
        final SettingsModel settings;
        //Act
        settings = await settingsRepository.fetchSettingsFromLocalStorage();
        //Assert
        expect(settings.themeMode, ThemeMode.light);
      });
      test(
          'should return [SettingsModel] with [ThemeMode.system] when [LocalStorageAdapter] return [system]',
          () async {
        //Arrange
        when(() => localStorageAdapterMock.readStringFromLocalStorage('theme'))
            .thenAnswer((_) async => 'system');
        when(() =>
                localStorageAdapterMock.readStringFromLocalStorage('language'))
            .thenAnswer((_) async => null);
        when(() =>
                localStorageAdapterMock.readStringFromLocalStorage('currency'))
            .thenAnswer((_) async => null);
        final SettingsModel settings;
        //Act
        settings = await settingsRepository.fetchSettingsFromLocalStorage();
        //Assert
        expect(settings.themeMode, ThemeMode.system);
      });
      test(
          'should return [SettingsModel] with [ThemeMode.system] when [LocalStorageAdapter] return [null]',
          () async {
        //Arrange
        when(() => localStorageAdapterMock.readStringFromLocalStorage('theme'))
            .thenAnswer((_) async => null);
        when(() =>
                localStorageAdapterMock.readStringFromLocalStorage('language'))
            .thenAnswer((_) async => null);
        when(() =>
                localStorageAdapterMock.readStringFromLocalStorage('currency'))
            .thenAnswer((_) async => null);
        final SettingsModel settings;
        //Act
        settings = await settingsRepository.fetchSettingsFromLocalStorage();
        //Assert
        expect(settings.themeMode, ThemeMode.system);
      });
      test(
          'should return [SettingsModel] with [Locale("en")] when [LocalStorageAdapter] return ["en"]',
          () async {
        //Arrange
        when(() => localStorageAdapterMock.readStringFromLocalStorage('theme'))
            .thenAnswer((_) async => null);
        when(() =>
                localStorageAdapterMock.readStringFromLocalStorage('currency'))
            .thenAnswer((_) async => null);
        when(() =>
                localStorageAdapterMock.readStringFromLocalStorage('language'))
            .thenAnswer((_) async => 'en');
        final SettingsModel settings;
        //Act
        settings = await settingsRepository.fetchSettingsFromLocalStorage();
        //Assert
        expect(settings.locale, const Locale('en'));
      });
      test(
          'should return [SettingsModel] with [Currency.brl] when [LocalStorageAdapter] return [BRL]',
          () async {
        //Arrange
        when(() => localStorageAdapterMock.readStringFromLocalStorage('theme'))
            .thenAnswer((_) async => null);
        when(() =>
                localStorageAdapterMock.readStringFromLocalStorage('language'))
            .thenAnswer((_) async => null);
        when(() =>
                localStorageAdapterMock.readStringFromLocalStorage('currency'))
            .thenAnswer((_) async => 'BRL');
        final SettingsModel settings;
        //Act
        settings = await settingsRepository.fetchSettingsFromLocalStorage();
        //Assert
        expect(settings.currency, Currency.brl);
      });
      test(
          'should return [SettingsModel] with [Currency.usd] when [LocalStorageAdapter] return [USD]',
          () async {
        //Arrange
        when(() => localStorageAdapterMock.readStringFromLocalStorage('theme'))
            .thenAnswer((_) async => null);
        when(() =>
                localStorageAdapterMock.readStringFromLocalStorage('language'))
            .thenAnswer((_) async => null);
        when(() =>
                localStorageAdapterMock.readStringFromLocalStorage('currency'))
            .thenAnswer((_) async => 'USD');
        final SettingsModel settings;
        //Act
        settings = await settingsRepository.fetchSettingsFromLocalStorage();
        //Assert
        expect(settings.currency, Currency.usd);
      });
      test(
          'should return [SettingsModel] with [null] when [LocalStorageAdapter] return [null]',
          () async {
        //Arrange
        when(() => localStorageAdapterMock.readStringFromLocalStorage('theme'))
            .thenAnswer((_) async => null);
        when(() =>
                localStorageAdapterMock.readStringFromLocalStorage('language'))
            .thenAnswer((_) async => null);
        when(() =>
                localStorageAdapterMock.readStringFromLocalStorage('currency'))
            .thenAnswer((_) async => null);
        final SettingsModel settings;
        //Act
        settings = await settingsRepository.fetchSettingsFromLocalStorage();
        //Assert
        expect(settings.locale, null);
      });
    });

    group('[saveSettingsToLocalStorage]', () {
      test(
          'Should send string [dark] to [LocalStorageAdapter] when [SettingsModel] has [ThemeMode.dark]',
          () async {
        //Arrange
        final SettingsModel settingsModel =
            SettingsModel(themeMode: ThemeMode.dark, currency: Currency.usd);

        when(() => localStorageAdapterMock.saveStringToLocalStorage(
              'theme',
              'dark',
            )).thenAnswer((_) => Future.value(null));
        when(() => localStorageAdapterMock.saveStringToLocalStorage(
              'currency',
              'USD',
            )).thenAnswer((_) => Future.value(null));
        //Act
        await settingsRepository.saveSettingsToLocalStorage(settingsModel);
        //Assert
        verify(() => localStorageAdapterMock.saveStringToLocalStorage(
            'theme', 'dark')).called(1);
      });
      test(
          'Should send string [light] to [LocalStorageAdapter] when [SettingsModel] has [ThemeMode.ligth]',
          () async {
        //Arrange
        final SettingsModel settingsModel =
            SettingsModel(themeMode: ThemeMode.light, currency: Currency.usd);
        when(() => localStorageAdapterMock.saveStringToLocalStorage(
              'currency',
              'USD',
            )).thenAnswer((_) => Future.value(null));

        when(() => localStorageAdapterMock.saveStringToLocalStorage(
            'theme', 'light')).thenAnswer((_) => Future.value());
        //Act
        await settingsRepository.saveSettingsToLocalStorage(settingsModel);
        //Assert
        verify(() => localStorageAdapterMock.saveStringToLocalStorage(
            'theme', 'light')).called(1);
      });
      test(
          'Should send string [system] to [LocalStorageAdapter] when [SettingsModel] has [ThemeMode.system]',
          () async {
        //Arrange
        final SettingsModel settingsModel =
            SettingsModel(themeMode: ThemeMode.system, currency: Currency.brl);

        when(() => localStorageAdapterMock.saveStringToLocalStorage(
            'theme', 'system')).thenAnswer((_) => Future.value());
        when(() => localStorageAdapterMock.saveStringToLocalStorage(
              'currency',
              'BRL',
            )).thenAnswer((_) => Future.value(null));
        //Act
        await settingsRepository.saveSettingsToLocalStorage(settingsModel);
        //Assert
        verify(() => localStorageAdapterMock.saveStringToLocalStorage(
            'theme', 'system')).called(1);
      });
      test(
          'Should send string [en] to [LocalStorageAdapter] when [SettingsModel] has [Locale("en")]',
          () async {
        //Arrange
        final SettingsModel settingsModel = SettingsModel(
            themeMode: ThemeMode.system,
            locale: const Locale('en'),
            currency: Currency.usd);
        when(() => localStorageAdapterMock.saveStringToLocalStorage(
              'currency',
              'USD',
            )).thenAnswer((_) => Future.value(null));
        when(() => localStorageAdapterMock.saveStringToLocalStorage(
            'theme', 'system')).thenAnswer((_) => Future.value());
        when(() => localStorageAdapterMock.saveStringToLocalStorage(
            'language', 'en')).thenAnswer((_) => Future.value());
        //Act
        await settingsRepository.saveSettingsToLocalStorage(settingsModel);
        //Assert
        verify(() => localStorageAdapterMock.saveStringToLocalStorage(
            'language', 'en')).called(1);
      });
    });
  });
}
