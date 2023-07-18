import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/util/validator/base_validator.dart';

class EmailValidator {
  final IsNullValidator _isNullValidator = IsNullValidator(
      errorMessage: IntlStrings.current.authValidatorValidEmail);
  final IsEmptyValidator _isEmptyValidator = IsEmptyValidator(
    errorMessage: IntlStrings.current.authValidatorValidEmail,
  );
  final EmailFormatValidator _emailFormatValidator = EmailFormatValidator();

  String? validate(String? input) {
    _isNullValidator.setNextValidator(_isEmptyValidator);
    _isEmptyValidator.setNextValidator(_emailFormatValidator);

    return _isNullValidator.validate(input: input);
  }
}
