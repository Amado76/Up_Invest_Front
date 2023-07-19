import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/util/validator/password_sign_in_validator.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'en'));
  final intlStrings = IntlStrings.current;
  final PasswordSignInValidator passwordSignInValidator =
      PasswordSignInValidator();
  group('[PasswordSignInValidator]', () {
    test(
        'Should return [authValidatorEnterYourPassword] when the value is null',
        () {
      expect(passwordSignInValidator.validate(null),
          intlStrings.authValidatorEnterYourPassword);
    });
    test(
        'Should return [authValidatorEnterYourPassword] when the value is empty',
        () {
      expect(passwordSignInValidator.validate(''),
          intlStrings.authValidatorEnterYourPassword);
    });
    test(
        'Should return [authValidatorPasswordMinLength] when the value is less than minLength',
        () {
      expect(passwordSignInValidator.validate('12345'),
          intlStrings.authValidatorPasswordMinLength);
    });
    test('Should return null when the value is greater than minLength', () {
      expect(passwordSignInValidator.validate('123456'), null);
    });
  });
}
