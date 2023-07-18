import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/util/validator/base_validator.dart';

class NameValidator {
  final IsNullValidator _isNullValidator = IsNullValidator(
      errorMessage: IntlStrings.current.authValidatorNameMinLength);
  final IsEmptyValidator _isEmptyValidator = IsEmptyValidator(
    errorMessage: IntlStrings.current.authValidatorNameMinLength,
  );
  final MinimumLengthValidator _minimumLengthValidator = MinimumLengthValidator(
      minLength: 4,
      errorMessage: IntlStrings.current.authValidatorNameMinLength);

  String? validate(String? input) {
    _isNullValidator.setNextValidator(_isEmptyValidator);
    _isEmptyValidator.setNextValidator(_minimumLengthValidator);

    return _isNullValidator.validate(input: input);
  }
}
