import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/util/validator/password_sign_up_validator.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'en'));
  final intlStrings = IntlStrings.current;
  final PasswordSignUpValidator passwordSignUpValidator =
      PasswordSignUpValidator();
  group('[PasswordSignUpValidator]', () {
    test(
        'Should return [authValidatorEnterYourPassword] when the value is null',
        () {
      expect(passwordSignUpValidator.validate(null),
          intlStrings.authValidatorEnterYourPassword);
    });
    test(
        'Should return [authValidatorEnterYourPassword] when the value is empty',
        () {
      expect(passwordSignUpValidator.validate(''),
          intlStrings.authValidatorEnterYourPassword);
    });
    test(
        'Should return [authValidatorPasswordInvalidRequirements] when the value dont have at least one special char',
        () {
      expect(passwordSignUpValidator.validate('teste1234'),
          intlStrings.authValidatorPasswordInvalidRequirements);
    });
    test(
        'Should return [authValidatorPasswordInvalidRequirements] when the value dont have at least one upper case char',
        () {
      expect(passwordSignUpValidator.validate('teste1234!'),
          intlStrings.authValidatorPasswordInvalidRequirements);
    });
    test('Should return [null] when the password is valid', () {
      expect(passwordSignUpValidator.validate('Teste1234!'), null);
    });
  });
}
