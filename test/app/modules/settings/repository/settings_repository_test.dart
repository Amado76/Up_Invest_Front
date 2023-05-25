import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/adapter/local_storage_adapter/local_storage_adapter_interface.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';
import 'package:up_invest_front/app/modules/settings/repository/settings_repository.dart';

class LocalStorageAdapterMock extends Mock implements LocalStorageAdapter {}

void main() async {
  group('SettingsRepository', () {
    late LocalStorageAdapter localStorageAdapterMock;
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
        final SettingsModel settings;
        //Act
        settings = await settingsRepository.getSettingsFromLocalStorage();
        //Assert
        expect(settings.themeMode, ThemeMode.dark);
      });
      test(
          'should return [SettingsModel] with [ThemeMode.light] when [LocalStorageAdapter] return [light]',
          () async {
        //Arrange
        when(() => localStorageAdapterMock.readStringFromLocalStorage('theme'))
            .thenAnswer((_) async => 'light');
        final SettingsModel settings;
        //Act
        settings = await settingsRepository.getSettingsFromLocalStorage();
        //Assert
        expect(settings.themeMode, ThemeMode.light);
      });
      test(
          'should return [SettingsModel] with [ThemeMode.system] when [LocalStorageAdapter] return [system]',
          () async {
        //Arrange
        when(() => localStorageAdapterMock.readStringFromLocalStorage('theme'))
            .thenAnswer((_) async => 'system');
        final SettingsModel settings;
        //Act
        settings = await settingsRepository.getSettingsFromLocalStorage();
        //Assert
        expect(settings.themeMode, ThemeMode.system);
      });
      test(
          'should return [SettingsModel] with [ThemeMode.system] when [LocalStorageAdapter] return [null]',
          () async {
        //Arrange
        when(() => localStorageAdapterMock.readStringFromLocalStorage('theme'))
            .thenAnswer((_) async => null);
        final SettingsModel settings;
        //Act
        settings = await settingsRepository.getSettingsFromLocalStorage();
        //Assert
        expect(settings.themeMode, ThemeMode.system);
      });
    });

    group('[saveSettingsToLocalStorage]', () {
      test(
          'Should send string [dark] to [LocalStorageAdapter] when [SettingsModel] has [ThemeMode.dark]',
          () async {
        //Arrange
        final SettingsModel settingsModel =
            SettingsModel(themeMode: ThemeMode.dark);

        when(() => localStorageAdapterMock.saveStringToLocalStorage(
            'theme', 'dark')).thenAnswer((_) => Future.value());
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
            SettingsModel(themeMode: ThemeMode.light);

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
            SettingsModel(themeMode: ThemeMode.system);

        when(() => localStorageAdapterMock.saveStringToLocalStorage(
            'theme', 'system')).thenAnswer((_) => Future.value());
        //Act
        await settingsRepository.saveSettingsToLocalStorage(settingsModel);
        //Assert
        verify(() => localStorageAdapterMock.saveStringToLocalStorage(
            'theme', 'system')).called(1);
      });
    });
  });
}
