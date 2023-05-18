import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/auth/util/login_form_validator.dart';

void main() {
  group('Email Validator', () {
    LoginFormValidator validator = LoginFormValidator();
    test('Should return null if the email is valid', () {
      //Arrange
      String email = 'teste@gmail.com';
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
      String invalidEmailCase4 = 'dr-@house.com.com.com';
      //Act
      String? case1 = validator.emailValidator(invalidEmailCase1);
      String? case2 = validator.emailValidator(invalidEmailCase2);
      String? case3 = validator.emailValidator(invalidEmailCase3);
      String? case4 = validator.emailValidator(invalidEmailCase4);
      //Assert
      expect(case1, expectResult);
      expect(case2, expectResult);
      expect(case3, expectResult);
      expect(case4, expectResult);
    });
  });

  group('Password Validator', () {
    LoginFormValidator validator = LoginFormValidator();
    test('Should return null if the password is valid', () {
      //Arrange
      String password = 'Abc12\$';
      //Act
      String? isValid = validator.passwordValidator(password);
      //Assert
      expect(isValid, null);
    });
    test(
        'Should return "Please enter your password." if the password is null or empty',
        () {
      //Arrange
      String expectResult = 'Please enter your password.';
      String emptyPassword = '';
      Null nullPassword;
      //Act
      String? isEmpty = validator.passwordValidator(emptyPassword);
      String? isNull = validator.passwordValidator(nullPassword);
      //Assert
      expect(isEmpty, expectResult);
      expect(isNull, expectResult);
    });
    test(
        'Should return "Your password have less than 6 characters!" if the password has lass then 6 characters',
        () {
      //Arrange
      String expectResult = 'Your password have less than 6 characters!';
      String password = '12345';

      //Act
      String? weakPassword = validator.passwordValidator(password);

      //Assert
      expect(weakPassword, expectResult);
    });
    test(
        'Should return "Password requires at least one special character and at least one uppercase letter." if the does not have at least one special character.',
        () {
      //Arrange
      String expectResult =
          'Password requires at least one special character and at least one uppercase letter.';
      String password = 'Abc123';

      //Act
      String? weakPassword = validator.passwordValidator(password);

      //Assert
      expect(weakPassword, expectResult);
    });
    test(
        'Should return "Password requires at least one special character and at least one uppercase letter." if the does not have at least one uppercase letter.',
        () {
      //Arrange
      String expectResult =
          'Password requires at least one special character and at least one uppercase letter.';
      String password = 'abc123!';

      //Act
      String? weakPassword = validator.passwordValidator(password);

      //Assert
      expect(weakPassword, expectResult);
    });
    test(
        'Should return "Password requires at least one special character and at least one uppercase letter." if the does not have at least one special character and one uppercase letter.',
        () {
      //Arrange
      String expectResult =
          'Password requires at least one special character and at least one uppercase letter.';
      String password = 'abc123';

      //Act
      String? weakPassword = validator.passwordValidator(password);

      //Assert
      expect(weakPassword, expectResult);
    });
  });
}
