import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/util/validator/base_validator.dart';

class PasswordSignUpValidator {
  final IsNullValidator _isNullValidator = IsNullValidator(
      errorMessage: IntlStrings.current.authValidatorEnterYourPassword);
  final IsEmptyValidator _isEmptyValidator = IsEmptyValidator(
    errorMessage: IntlStrings.current.authValidatorEnterYourPassword,
  );
  final MinimumLengthValidator _minimumLengthValidator = MinimumLengthValidator(
      minLength: 6,
      errorMessage: IntlStrings.current.authValidatorPasswordMinLength);
  final SpecialCharValidator _specialCharValidator = SpecialCharValidator();
  final UpperCaseValidator _upperCaseValidator = UpperCaseValidator();

  String? validate(String? input) {
    _isNullValidator.setNextValidator(_isEmptyValidator);
    _isEmptyValidator.setNextValidator(_minimumLengthValidator);
    _minimumLengthValidator.setNextValidator(_specialCharValidator);
    _specialCharValidator.setNextValidator(_upperCaseValidator);

    return _isNullValidator.validate(input: input);
  }
}
