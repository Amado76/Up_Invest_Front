import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_sucess.dart';

void main() {
  group('[AuthSucess]', () {
    test(
        'Should return an instance of [AuthSuccessUnknown] if the [message] is unknown or not mapped',
        () {
      //Arrange
      String message = 'unkown';
      //Act
      final authSucess = AuthSuccess.from(message);
      //Assert
      expect(authSucess, isA<AuthSuccessUnknown>());
    });
    test(
        'Should return an instance of [AuthSuccessResetPassword] if the [message] is reset-password',
        () {
      //Arrange
      String message = 'reset-password';
      //Act
      final authSucess = AuthSuccess.from(message);
      //Assert
      expect(authSucess, isA<AuthSuccessResetPassword>());
    });
  });
}
