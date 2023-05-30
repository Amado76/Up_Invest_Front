// import 'package:flutter/material.dart' show WidgetsFlutterBinding;
// import 'package:flutter_test/flutter_test.dart';
// import 'package:up_invest_front/app/core/adapter/local_storage_adapter/local_storage_adapter_interface.dart';

// Having some issues to use Modular and Async binds, and because of that in the moment i can't test this.



// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   late SharedPreferencesAdapter localStorageAdapter;

//   setUp(() {
//     localStorageAdapter = SharedPreferencesAdapter();
//   });
//   group('[LocalStorageAdapter]', () {
//     group('[readStringFromLocalStorage]', () {
//       test('should return [value]', () async {
//         //Arrange
//         String? expectValue;

//         //Act
//         expectValue =
//             await localStorageAdapter.readStringFromLocalStorage('string');
//         //Assert
//         expect(expectValue, 'value');
//       });
//       test('should return [null]', () async {
//         //Arrange
//         String? expectValue;

//         //Act
//         expectValue =
//             await localStorageAdapter.readStringFromLocalStorage('string');
//         //Assert
//         expect(expectValue, null);
//       });
//     });
//     group('[saveStringToLocalStorage]', () {
//       test('should call [sharedPreferences.setString]', () async {
//         //Arrange

//         //Act
//         await localStorageAdapter.saveStringToLocalStorage('string', 'value');
//         //Assert
//       });
//       test('should return [false] if the save operation fails', () async {
//         //Arrange

//         //Assert
//         expect(
//             () async => await localStorageAdapter.saveStringToLocalStorage(
//                 'string', 'value'),
//             throwsA(isA<Exception>()));
//       });
//     });
//   });
// }
