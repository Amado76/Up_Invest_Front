import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';

/// The [AuthSucess] class represents authentication errors.
Map<String, AuthSuccess> authSucessMapping = {
  'reset-password': AuthSuccessResetPassword(),
  'set-new-password': AuthSuccessSetNewPassword(),
  'email-sent': AuthSuccessEmailSent(),
};

@immutable
sealed class AuthSuccess extends Equatable {
  /// The title of the Success dialog to be displayed.
  final String dialogTitle;

  /// The text of the Success dialog to be displayed.
  ///
  final String dialogText;
  const AuthSuccess({
    required this.dialogTitle,
    required this.dialogText,
  });

  /// Factory method to create an [AuthSuccess] object based on a [String].
  /// [success] - The [String] from which to create the [AuthSuccess].
  /// Returns an [AuthSuccess] object corresponding to the provided exception,
  /// or a default [AuthSuccessUnknown] object if no mapping is found.
  factory AuthSuccess.from(String success) =>
      authSucessMapping[success.toLowerCase().trim()] ?? AuthSuccessUnknown();
}

@immutable
class AuthSuccessUnknown extends AuthSuccess {
  AuthSuccessUnknown()
      : super(
          dialogTitle: IntlStrings.current.authSuccessUnknownTitle,
          dialogText: IntlStrings.current.authSuccessUnknownMessage,
        );

  @override
  List<Object?> get props => [super.dialogText, super.dialogTitle];
}

//reset-password
@immutable
class AuthSuccessResetPassword extends AuthSuccess {
  AuthSuccessResetPassword()
      : super(
          dialogTitle: IntlStrings.current.authSuccessResetPasswordTitle,
          dialogText: IntlStrings.current.authSuccessResetPasswordMessage,
        );
  @override
  List<Object?> get props => [super.dialogText, super.dialogTitle];
}

//set-new-password
@immutable
class AuthSuccessSetNewPassword extends AuthSuccess {
  AuthSuccessSetNewPassword()
      : super(
          dialogTitle: IntlStrings.current.authSuccessSetNewPasswordTitle,
          dialogText: IntlStrings.current.authSuccessSetNewPasswordMessage,
        );
  @override
  List<Object?> get props => [super.dialogText, super.dialogTitle];
}

@immutable
class AuthSuccessEmailSent extends AuthSuccess {
  AuthSuccessEmailSent()
      : super(
          dialogTitle: IntlStrings.current.authSuccessEmailSentTitle,
          dialogText: IntlStrings.current.authSuccessSetEmailSentMessage,
        );
  @override
  List<Object?> get props => [super.dialogText, super.dialogTitle];
}
