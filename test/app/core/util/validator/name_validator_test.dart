import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/util/validator/name_validator.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'en'));
  final intlStrings = IntlStrings.current;
  final NameValidator nameValidator = NameValidator();
  group('[NameValidator]', () {
    test('Should return [authValidatorNameMinLength] when the value is null',
        () {
      expect(
          nameValidator.validate(null), intlStrings.authValidatorNameMinLength);
    });
    test('Should return [authValidatorNameMinLength] when the value is empty',
        () {
      expect(
          nameValidator.validate(''), intlStrings.authValidatorNameMinLength);
    });
    test(
        'Should return [authValidatorNameMinLength] when the value is less than minLength',
        () {
      expect(nameValidator.validate('123'),
          intlStrings.authValidatorNameMinLength);
    });
    test('Should return null when the value is greater than minLength', () {
      expect(nameValidator.validate('1234'), null);
    });
  });
}
