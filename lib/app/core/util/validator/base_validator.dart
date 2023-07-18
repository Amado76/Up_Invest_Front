import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';

sealed class BaseValidator {
  BaseValidator? _nextValidator;

  void setNextValidator(BaseValidator nextValidator) =>
      _nextValidator = nextValidator;

  BaseValidator? get nextValidator => _nextValidator;

  String? validate({required String? input}) => null;
}

class IsNullValidator extends BaseValidator {
  final String errorMessage;

  IsNullValidator({required this.errorMessage});

  @override
  String? validate({required String? input}) {
    if (input == null) {
      return errorMessage;
    }
    return nextValidator?.validate(input: input);
  }
}

class IsEmptyValidator extends BaseValidator {
  final String errorMessage;

  IsEmptyValidator({required this.errorMessage});

  @override
  String? validate({required String? input}) {
    if (input!.isEmpty) {
      return errorMessage;
    }
    return nextValidator?.validate(input: input);
  }
}

class MinimumLengthValidator extends BaseValidator {
  final int minLength;
  final String errorMessage;

  MinimumLengthValidator({required this.minLength, required this.errorMessage});
  @override
  String? validate({required String? input}) {
    if (input!.length < minLength) {
      return errorMessage;
    }
    return nextValidator?.validate(input: input);
  }
}

class SpecialCharValidator extends BaseValidator {
  final String _specialCharRegExp =
      r"[?=.*[!@#\$%^&*()_+\-=[\]{};':\\\|,.<>\/?]+";
  @override
  String? validate({required String? input}) {
    if (!RegExp(_specialCharRegExp).hasMatch(input!)) {
      return IntlStrings.current.authValidatorPasswordInvalidRequirements;
    }
    return nextValidator?.validate(input: input);
  }
}

class UpperCaseValidator extends BaseValidator {
  final String _uppercaseCharRegExp = r'(?=.*[A-Z])';

  @override
  String? validate({required String? input}) {
    if (!RegExp(_uppercaseCharRegExp).hasMatch(input!)) {
      return IntlStrings.current.authValidatorPasswordInvalidRequirements;
    }
    return nextValidator?.validate(input: input);
  }
}

class EmailFormatValidator extends BaseValidator {
  final String _validEmailRegExp =
      r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,6}(?:\.[a-zA-Z]{2,6}){0,1}$';
  @override
  String? validate({required String? input}) {
    if (!RegExp(_validEmailRegExp).hasMatch(input!)) {
      return IntlStrings.current.authValidatorValidEmail;
    }
    return nextValidator?.validate(input: input);
  }
}

class AreStringsEqualValidator extends BaseValidator {
  final String? stringToCompare;
  final String errorMessage;

  AreStringsEqualValidator(
      {required this.stringToCompare, required this.errorMessage});
  @override
  String? validate({required String? input, required}) {
    if (input! != stringToCompare) {
      return errorMessage;
    }
    return nextValidator?.validate(input: input);
  }
}
