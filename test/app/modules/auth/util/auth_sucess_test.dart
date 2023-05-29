import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_sucess.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'pt'));
  group('[AuthSucess]', () {
    group('[AuthSuccessUnknown]', () {
      test(
          'should return an instance of [AuthSuccessUnknown] if the [message] is unknown or not mapped',
          () {
        //Arrange
        String message = 'unkown';
        //Act
        final authSucess = AuthSuccess.from(message);
        //Assert

        expect(authSucess, isA<AuthSuccessUnknown>());
      });
      test('supports value comparisons', () {
        expect(AuthSuccessUnknown(), AuthSuccessUnknown());
      });
    });

    group('AuthSuccessResetPassword', () {
      test(
          'should return an instance of [AuthSuccessResetPassword] if the [message] is reset-password',
          () {
        //Arrange
        String message = 'reset-password';
        //Act
        final authSucess = AuthSuccess.from(message);
        //Assert
        expect(authSucess, isA<AuthSuccessResetPassword>());
      });
      test('supports value comparisons', () {
        expect(AuthSuccessResetPassword(), AuthSuccessResetPassword());
      });
    });

    group('[AuthSuccessSetNewPassword]', () {
      test(
          'should return an instance of [AuthSuccessSetNewPassword] if the [message] is set-new-password',
          () {
        //Arrange
        String message = 'set-new-password';
        //Act
        final authSucess = AuthSuccess.from(message);
        //Assert
        expect(authSucess, isA<AuthSuccessSetNewPassword>());
      });
      test('supports value comparisons', () {
        expect(AuthSuccessSetNewPassword(), AuthSuccessSetNewPassword());
      });
    });
  });
}
