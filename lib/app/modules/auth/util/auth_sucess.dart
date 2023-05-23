import 'package:flutter/foundation.dart' show immutable;

/// The [AuthSucess] class represents authentication errors.
const Map<String, AuthSuccess> authSucessMapping = {
  'reset-password': AuthSuccessResetPassword()
};

@immutable
sealed class AuthSuccess {
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
      authSucessMapping[success.toLowerCase().trim()] ??
      const AuthSuccessUnknown();
}

@immutable
class AuthSuccessUnknown extends AuthSuccess {
  const AuthSuccessUnknown()
      : super(
          dialogTitle: 'Success!',
          dialogText: 'Successful request!',
        );
}

//reset-password
@immutable
class AuthSuccessResetPassword extends AuthSuccess {
  const AuthSuccessResetPassword()
      : super(
          dialogTitle: 'Email Sent!',
          dialogText:
              'We have sent an email with instructions to reset your password!',
        );
}
