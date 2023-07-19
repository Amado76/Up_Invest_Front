import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/util/validator/base_validator.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'en'));
  final intlStrings = IntlStrings.current;

  group('[IsNullValidator]', () {
    final IsNullValidator isNullValidator = IsNullValidator(
      errorMessage: 'errorMessage',
    );
    test('Should return a [errorMessage] when the value is null', () {
      expect(isNullValidator.validate(input: null), 'errorMessage');
    });
    test('Should return null when the value is not null', () {
      expect(isNullValidator.validate(input: 'value'), null);
    });
  });

  group('[IsEmptyValidator]', () {
    final IsEmptyValidator isEmptyValidator = IsEmptyValidator(
      errorMessage: 'errorMessage',
    );
    test('Should return a [errorMessage] when the value is empty', () {
      expect(isEmptyValidator.validate(input: ''), 'errorMessage');
    });
    test('Should return null when the value is not empty', () {
      expect(isEmptyValidator.validate(input: 'value'), null);
    });
  });

  group('[MinimumLengthValidator]', () {
    final MinimumLengthValidator minimumLengthValidator =
        MinimumLengthValidator(
      minLength: 5,
      errorMessage: 'errorMessage',
    );
    test('Should return a [errorMessage] when the value is less than minLength',
        () {
      expect(minimumLengthValidator.validate(input: '1234'), 'errorMessage');
    });
    test('Should return null when the value is greater than minLength', () {
      expect(minimumLengthValidator.validate(input: '12345'), null);
    });
  });

  group('[SpecialCharValidator]', () {
    final SpecialCharValidator specialCharValidator = SpecialCharValidator();
    test(
        'Should return a [authValidatorPasswordInvalidRequirements] when the value has not a special char',
        () {
      expect(specialCharValidator.validate(input: '1234'),
          intlStrings.authValidatorPasswordInvalidRequirements);
    });
    test('Should return null when the value has a special char', () {
      expect(specialCharValidator.validate(input: '1234!'), null);
    });
  });

  group('[UpperCaseValidator]', () {
    final UpperCaseValidator upperCaseValidator = UpperCaseValidator();
    test(
        'Should return a [authValidatorPasswordInvalidRequirements] when the value has not a upper case',
        () {
      expect(upperCaseValidator.validate(input: '1234'),
          intlStrings.authValidatorPasswordInvalidRequirements);
    });
    test('Should return null when the value has a upper case', () {
      expect(upperCaseValidator.validate(input: '1234A'), null);
    });
  });

  group('[EmailFormatValidator]', () {
    final EmailFormatValidator emailFormatValidator = EmailFormatValidator();
    test(
        'Should return a [authValidatorEmailInvalidFormat] when the value is not a email format',
        () {
      expect(emailFormatValidator.validate(input: '1234'),
          intlStrings.authValidatorValidEmail);
      expect(emailFormatValidator.validate(input: 'bruno@mu'),
          intlStrings.authValidatorValidEmail);
      expect(emailFormatValidator.validate(input: '@gmail.com'),
          intlStrings.authValidatorValidEmail);
      expect(emailFormatValidator.validate(input: 'teste@gmail'),
          intlStrings.authValidatorValidEmail);
      expect(emailFormatValidator.validate(input: 'teste@@gmail.com'),
          intlStrings.authValidatorValidEmail);
      expect(
          emailFormatValidator.validate(
              input: 'teste@gmail.com.com.com.com.com.com'),
          intlStrings.authValidatorValidEmail);
    });
    test('Should return null when the value is a email format', () {
      expect(emailFormatValidator.validate(input: 'teste@gmail.com'), null);
    });
  });

  group('[AreStringsEqualValidator]', () {
    final AreStringsEqualValidator areStringsEqualValidator =
        AreStringsEqualValidator(
      errorMessage: 'errorMessage',
      stringToCompare: 'stringToCompare',
    );
    test(
        'Should return a [errorMessage] when the value is not equal to [stringToCompare]',
        () {
      expect(areStringsEqualValidator.validate(input: '1234'), 'errorMessage');
    });
    test('Should return null when the value is equal to [stringToCompare]', () {
      expect(areStringsEqualValidator.validate(input: 'stringToCompare'), null);
    });
  });
}
