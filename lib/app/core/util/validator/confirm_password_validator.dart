import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/util/validator/base_validator.dart';

class ConfirmPasswordValidator {
  String? validate({required String? input, required String? stringToCompare}) {
    final AreStringsEqualValidator areStringsEqualValidator =
        AreStringsEqualValidator(
            stringToCompare: stringToCompare,
            errorMessage: IntlStrings.current.authValidatorPasswordDoNotMatch);

    return areStringsEqualValidator.validate(input: input);
  }
}
