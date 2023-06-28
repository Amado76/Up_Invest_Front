import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:up_invest_front/app/core/adapter/local_storage_adapter/local_storage_adapter_interface.dart';

void main() {
  SharedPreferencesAdapter sharedPreferencesAdapter =
      SharedPreferencesAdapter();
  group('LocalStorageAdapter', () {
    test('should read a string from local storage', () async {
      // arrange
      SharedPreferences.setMockInitialValues({'key': 'value'});

      // act
      String? result =
          await sharedPreferencesAdapter.readStringFromLocalStorage('key');
      // assert
      expect(result, 'value');
    });
    test('should save a string on local storage', () async {
      // arrange
      SharedPreferences.setMockInitialValues({'key': 'value'});

      // act
      await sharedPreferencesAdapter.saveStringToLocalStorage(
          'key', 'newValue');
      String? result =
          await sharedPreferencesAdapter.readStringFromLocalStorage('key');
      // assert
      expect(result, 'newValue');
    });
  });
}
