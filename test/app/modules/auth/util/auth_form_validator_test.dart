import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_form_validator.dart';
import 'package:up_invest_front/l10n/generated/l10n.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'en'));
  late AuthFormValidator validator;

  setUp(() {
    validator = AuthFormValidator();
  });
  group('Email Validator', () {
    test('Should return null if the email is valid', () {
      //Arrange
      String email = 'teste@teste.com.br';
      //Act
      String? isValid = validator.emailValidator(email);
      //Assert
      expect(isValid, null);
    });
    test(
        'Should return "Please enter your email" if the email is empty or null',
        () {
      //Arrange
      String expectResult = 'Please enter your email';
      String emptyEmail = '';
      Null nullEmail;
      //Act
      String? isEmpty = validator.emailValidator(emptyEmail);
      String? isNull = validator.emailValidator(nullEmail);
      //Assert
      expect(isEmpty, expectResult);
      expect(isNull, expectResult);
    });
    test('Should return "Please enter a valid email" if the email is invalid',
        () {
      //Arrange
      String expectResult = 'Please enter a valid email';
      String invalidEmailCase1 = 'dr@house';
      String invalidEmailCase2 = 'dr@house.c';
      String invalidEmailCase3 = 'dr@house.cccccccccc';

      //Act
      String? case1 = validator.emailValidator(invalidEmailCase1);
      String? case2 = validator.emailValidator(invalidEmailCase2);
      String? case3 = validator.emailValidator(invalidEmailCase3);

      //Assert
      expect(case1, expectResult);
      expect(case2, expectResult);
      expect(case3, expectResult);
      // expect(case4, expectResult);
    });
  });

  group('Sign Up Password Validator', () {
    test('Should return null if the password is valid', () {
      //Arrange
      String password = 'Abc12\$';
      //Act
      String? isValid = validator.signUpPasswordValidator(password);
      //Assert
      expect(isValid, null);
    });
    test(
        'Should return "Please enter your password!" if the password is null or empty',
        () {
      //Arrange
      String expectResult = 'Please enter your password!';
      String emptyPassword = '';
      Null nullPassword;
      //Act
      String? isEmpty = validator.signUpPasswordValidator(emptyPassword);
      String? isNull = validator.signUpPasswordValidator(nullPassword);
      //Assert
      expect(isEmpty, expectResult);
      expect(isNull, expectResult);
    });
    test(
        'Should return "Your password have less than 6 characters!" if the password have lass then 6 characters',
        () {
      //Arrange
      String expectResult = 'Your password have less than 6 characters!';
      String password = '12345';

      //Act
      String? weakPassword = validator.signUpPasswordValidator(password);

      //Assert
      expect(weakPassword, expectResult);
    });
    test(
        'Should return "Password requires at least one special character and at least one uppercase letter." if the does not have at least one special character.',
        () {
      //Arrange
      String expectResult =
          'Password requires at least one special character \n'
          'and one uppercase letter';
      String password = 'Abc123';

      //Act
      String? weakPassword = validator.signUpPasswordValidator(password);

      //Assert
      expect(weakPassword, expectResult);
    });
    test(
        'Should return "Password requires at least one special character and one uppercase letter." if the does not have at least one uppercase letter.',
        () {
      //Arrange
      String expectResult =
          'Password requires at least one special character \n'
          'and one uppercase letter';
      String password = 'abc123!';

      //Act
      String? weakPassword = validator.signUpPasswordValidator(password);

      //Assert
      expect(weakPassword, expectResult);
    });
    test(
        'Should return "Password requires at least one special character and one uppercase letter." if the does not have at least one special character and one uppercase letter.',
        () {
      //Arrange
      String expectResult =
          'Password requires at least one special character \n'
          'and one uppercase letter';
      String password = 'abc123';

      //Act
      String? weakPassword = validator.signUpPasswordValidator(password);

      //Assert
      expect(weakPassword, expectResult);
    });
  });

  group('Sign Up Confirm Password validator', () {
    test('Should return null if the password and confirm password are equal',
        () {
      //Arrange
      String password = 'Abc12\$';
      String confirmPassword = 'Abc12\$';
      //Act
      String? isValid =
          validator.confirmPasswordValidator(confirmPassword, password);
      //Assert
      expect(isValid, null);
    });
    test(
        'Should return "The passwords do not match" if the password and confirm password do not match',
        () {
      //Arrange
      String password = 'Abc12\$';
      String confirmPassword = 'Abc11\$';
      //Act
      String? isValid =
          validator.confirmPasswordValidator(confirmPassword, password);
      //Assert
      expect(isValid, 'The passwords do not match');
    });
  });

  group('Sign Up Name Validator', () {
    test('Should return null if the name has at least 4 characters', () {
      //Arrange

      String name = 'James Wilson';
      //Act
      String? isValid = validator.minNameLengthValidator(name);
      //Assert
      expect(isValid, null);
    });
    test(
        'Should return "Please enter a name with at least 4 characters" if the name have less than 4 characters',
        () {
      //Arrange
      String name = 'Jam';
      //Act
      String? isValid = validator.minNameLengthValidator(name);
      //Assert
      expect(isValid, 'Please enter a name with at least 4 characters');
    });
  });

  group('Sign In Password Validator', () {
    test('Should return null if the password have at lest 6 characters', () {
      //Arrange
      String password = 'Abc12\$';
      //Act
      String? isValid = validator.signInPasswordValidator(password);
      //Assert
      expect(isValid, null);
    });
    test(
        'Should return "Please enter your password!" if the password is null or empty',
        () {
      //Arrange
      String expectResult = 'Please enter your password!';
      String emptyPassword = '';
      Null nullPassword;
      //Act
      String? isEmpty = validator.signInPasswordValidator(emptyPassword);
      String? isNull = validator.signInPasswordValidator(nullPassword);
      //Assert
      expect(isEmpty, expectResult);
      expect(isNull, expectResult);
    });
    test(
        'Should return "Your password have less than 6 characters!" if the password have lass then 6 characters',
        () {
      //Arrange
      String expectResult = 'Your password have less than 6 characters!';
      String password = '12345';

      //Act
      String? weakPassword = validator.signInPasswordValidator(password);

      //Assert
      expect(weakPassword, expectResult);
    });
  });
}
