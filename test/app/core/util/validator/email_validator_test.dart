import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/util/validator/email_validator.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'en'));
  final intlStrings = IntlStrings.current;
  final EmailValidator emailValidator = EmailValidator();

  group('[EmailValidator]', () {
    test('Should return [authValidatorValidEmail] when the value is null', () {
      expect(
          emailValidator.validate(null), intlStrings.authValidatorValidEmail);
    });
    test('Should return [authValidatorValidEmail] when the value is empty', () {
      expect(emailValidator.validate(''), intlStrings.authValidatorValidEmail);
    });
    test('Should return [authValidatorValidEmail] when the value is invalid',
        () {
      expect(emailValidator.validate('invalid'),
          intlStrings.authValidatorValidEmail);
    });
    test('Should return null when the value is valid', () {
      expect(emailValidator.validate('valid@gmail.com'), null);
    });
  });
}
