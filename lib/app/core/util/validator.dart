import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';

class Validator {
  final intlStrings = IntlStrings.current;

  String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return intlStrings.authValidatorEnterYourEmail;
    }
    if (!RegExp(_validEmailRegExp).hasMatch(email)) {
      return intlStrings.authValidatorValidEmail;
    }
    return null;
  }

  String? signInPasswordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return intlStrings.authValidatorEnterYourPassword;
    }
    if (password.length < 6) {
      return intlStrings.authValidatorPasswordMinLength;
    }

    return null;
  }

  String? signUpPasswordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return intlStrings.authValidatorEnterYourPassword;
    }
    if (password.length < 6) {
      return intlStrings.authValidatorPasswordMinLength;
    }
    if (!RegExp(_uppercaseCharRegExp).hasMatch(password) ||
        !RegExp(_specialCharRegExp).hasMatch(password)) {
      return intlStrings.authValidatorPasswordInvalidRequirements;
    }
    return null;
  }

  String? confirmPasswordValidator(String? password, String? confirmPassword) {
    if (password == confirmPassword) {
      return null;
    }
    return intlStrings.authValidatorPasswordDoNotMatch;
  }

  String? minNameLengthValidator(String? name) {
    if (name == null || name.length < 4) {
      return intlStrings.authValidatorNameMinLength;
    }
    return null;
  }

  final String _uppercaseCharRegExp = r'(?=.*[A-Z])';
  final String _specialCharRegExp =
      r"[?=.*[!@#\$%^&*()_+\-=[\]{};':\\\|,.<>\/?]+";
  // final String _validEmailRegExp =
  //     r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,6}$';
  final String _validEmailRegExp =
      r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,6}(?:\.[a-zA-Z]{2,6}){0,1}$';
}
