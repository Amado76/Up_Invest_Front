import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/util/validator/confirm_password_validator.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'en'));
  final intlStrings = IntlStrings.current;
  const String stringToCompare = 'stringToCompare';
  final ConfirmPasswordValidator confirmPasswordValidator =
      ConfirmPasswordValidator();
  group('[ConfirmPasswordValidator]', () {
    test('Should return null when the value is equal to stringToCompare', () {
      //act
      String? result = confirmPasswordValidator.validate(
          input: stringToCompare, stringToCompare: stringToCompare);
      //assert
      expect(result, null);
    });
    test(
        'Should return errorMessage when the value is not equal to stringToCompare',
        () {
      //act
      String? result = confirmPasswordValidator.validate(
          input: 'error', stringToCompare: stringToCompare);
      //assert
      expect(result, intlStrings.authValidatorPasswordDoNotMatch);
    });
  });
}
