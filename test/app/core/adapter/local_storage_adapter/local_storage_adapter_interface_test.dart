import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/adapter/local_storage_adapter/local_storage_adapter_interface.dart';

import '../../../../mocks/core/adapter/shared_preferences_mock.dart';

void main() async {
  late SharedPreferencesMock sharedPreferencesMock;
  late SharedPreferencesAdapter localStorageAdapter;
  group('[LocalStorageAdapter]', () {
    setUp(() async {
      sharedPreferencesMock = SharedPreferencesMock();
      localStorageAdapter = SharedPreferencesAdapter(sharedPreferencesMock);
    });
    group('[readStringFromLocalStorage]', () {
      test('should return [value]', () async {
        //Arrange
        String? expectValue;
        when(() => sharedPreferencesMock.getString('string'))
            .thenAnswer((_) => 'value');
        //Act
        expectValue =
            await localStorageAdapter.readStringFromLocalStorage('string');
        //Assert
        expect(expectValue, 'value');
      });
      test('should return [null]', () async {
        //Arrange
        String? expectValue;
        when(() => sharedPreferencesMock.getString('string'))
            .thenAnswer((_) => null);
        //Act
        expectValue =
            await localStorageAdapter.readStringFromLocalStorage('string');
        //Assert
        expect(expectValue, null);
      });
    });
    group('[saveStringToLocalStorage]', () {
      test('should call [sharedPreferences.setString]', () async {
        //Arrange
        when(() => sharedPreferencesMock.setString('string', 'value'))
            .thenAnswer((_) async => true);
        //Act
        await localStorageAdapter.saveStringToLocalStorage('string', 'value');
        //Assert
        verify(() => sharedPreferencesMock.setString('string', 'value'))
            .called(1);
      });
      test('should return [false] if the save operation fails', () async {
        //Arrange
        when(() => sharedPreferencesMock.setString('string', 'value'))
            .thenAnswer((_) async => false);

        //Assert
        expect(
            () async => await localStorageAdapter.saveStringToLocalStorage(
                'string', 'value'),
            throwsA(isA<Exception>()));
        verify(() => sharedPreferencesMock.setString('string', 'value'))
            .called(1);
      });
    });
  });
}

// SharedPreferences.setMockInitialValues({'key_string': 'value'});
