import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/services.dart' show PlatformException;
import 'package:up_invest_front/l10n/generated/l10n.dart';

/// The [AuthError] class represents authentication errors.
Map<String, AuthError> authErrorMapping = {
  'email-already-exists': AuthErrorEmailAlreadyExists(),
  'id-token-expired': AuthErrorTokenExpired(),
  'id-token-revoked': AuthErrorTokenRevoked(),
  'invalid-email': AuthErrorInvalidEmail(),
  'operation-not-allowed': AuthErrorOperationNotAllowed(),
  'user-not-found': AuthErrorUserNotFound(),
  'requires-recent-login': AuthErrorRequiresRecentLogin(),
  'weak-password': AuthErrorWeakPassword(),
  'user-mismatch': AuthErrorUserMismatch(),
  'wrong-password': AuthErrorWrongPassword(),
  'email-already-in-use': AuthErrorEmailAlreadyExists(),
  'too-many-requests': AuthErrorTooManyRequests(),
  'Exception: invalid-social-network': AuthErrorOperationNotAllowed(),
  'network_error': AuthErrorNetworkError(),
  'network-request-failed': AuthErrorNetworkError(),
};

@immutable
sealed class AuthError {
  /// The title of the error dialog to be displayed.
  final String dialogTitle;

  /// The text of the error dialog to be displayed.
  final String dialogText;

  const AuthError({
    required this.dialogTitle,
    required this.dialogText,
  });

  /// Factory method to create an [AuthError] object based on a [FirebaseAuthException].
  /// [exception] - The [FirebaseAuthException] from which to create the [AuthError].
  /// Returns an [AuthError] object corresponding to the provided exception,
  /// or a default [AuthErrorUnknown] object if no mapping is found.
  factory AuthError.fromFirebase(FirebaseAuthException exception) =>
      authErrorMapping[exception.code.toLowerCase().trim()] ??
      AuthErrorUnknown();

  /// Factory method to create an [AuthError] object based on a [Exception].
  /// [exception] - The [Exception] from which to create the [AuthError].
  /// Returns an [AuthError] object corresponding to the provided exception,
  /// or a default [AuthErrorUnknown] object if no mapping is found.
  factory AuthError.from(Exception exception) {
    if (exception is PlatformException) {
      String errorMessage = exception.code;
      return authErrorMapping[errorMessage] ?? AuthErrorUnknown();
    }
    String errorMessage = exception.toString();
    return authErrorMapping[errorMessage] ?? AuthErrorUnknown();
  }
}

@immutable
class AuthErrorUnknown extends AuthError {
  AuthErrorUnknown()
      : super(
          dialogTitle: IntlStrings.current.authErrorUnknownTitle,
          dialogText: IntlStrings.current.authErrorUnknownMessage,
        );
}

///email-already-exists
@immutable
class AuthErrorEmailAlreadyExists extends AuthError {
  AuthErrorEmailAlreadyExists()
      : super(
          dialogTitle: IntlStrings.current.authErrorEmailAlreadyExistsTitle,
          dialogText: IntlStrings.current.authErrorEmailAlreadyExistsMessage,
        );
}

///id-token-expired
@immutable
class AuthErrorTokenExpired extends AuthError {
  AuthErrorTokenExpired()
      : super(
          dialogTitle: IntlStrings.current.authErrorTokenExpiredTitle,
          dialogText: IntlStrings.current.authErrorTokenExpiredMessage,
        );
}

///id-token-revoked
@immutable
class AuthErrorTokenRevoked extends AuthError {
  AuthErrorTokenRevoked()
      : super(
          dialogTitle: IntlStrings.current.authErrorTokenRevokedTitle,
          dialogText: IntlStrings.current.authErrorTokenRevokedMessage,
        );
}

///invalid-email
@immutable
class AuthErrorInvalidEmail extends AuthError {
  AuthErrorInvalidEmail()
      : super(
          dialogTitle: IntlStrings.current.authErrorInvalidEmailTitle,
          dialogText: IntlStrings.current.authErrorInvalidEmailMessage,
        );
}

///operation-not-allowed

@immutable
class AuthErrorOperationNotAllowed extends AuthError {
  AuthErrorOperationNotAllowed()
      : super(
          dialogTitle: IntlStrings.current.authErrorOperationNotAllowedTitle,
          dialogText: IntlStrings.current.authErrorOperationNotAllowedMessage,
        );
}

///user-not-found
@immutable
class AuthErrorUserNotFound extends AuthError {
  AuthErrorUserNotFound()
      : super(
          dialogTitle: IntlStrings.current.authErrorUserNotFoundTitle,
          dialogText: IntlStrings.current.authErrorUserNotFoundMessage,
        );
}

///requires-recent-login
@immutable
class AuthErrorRequiresRecentLogin extends AuthError {
  AuthErrorRequiresRecentLogin()
      : super(
          dialogTitle: IntlStrings.current.authErrorRequiresRecentLoginTitle,
          dialogText: IntlStrings.current.authErrorRequiresRecentLoginMessage,
        );
}

///weak-password
@immutable
class AuthErrorWeakPassword extends AuthError {
  AuthErrorWeakPassword()
      : super(
          dialogTitle: IntlStrings.current.authErrorWeakPasswordTitle,
          dialogText: IntlStrings.current.authErrorWeakPasswordMessage,
        );
}

/// user-mismatch
@immutable
class AuthErrorUserMismatch extends AuthError {
  AuthErrorUserMismatch()
      : super(
          dialogTitle: IntlStrings.current.authErrorUserMismatchTitle,
          dialogText: IntlStrings.current.authErrorUserMismatchMessage,
        );
}

///wrong-password
@immutable
class AuthErrorWrongPassword extends AuthError {
  AuthErrorWrongPassword()
      : super(
          dialogTitle: IntlStrings.current.authErrorWrongPasswordTitle,
          dialogText: IntlStrings.current.authErrorWrongPasswordMessage,
        );
}

///too-many-requests
@immutable
class AuthErrorTooManyRequests extends AuthError {
  AuthErrorTooManyRequests()
      : super(
          dialogTitle: IntlStrings.current.authErrorTooManyRequestsTitle,
          dialogText: IntlStrings.current.authErrorTooManyRequestsMessage,
        );
}

//network_error
@immutable
class AuthErrorNetworkError extends AuthError {
  AuthErrorNetworkError()
      : super(
          dialogTitle: IntlStrings.current.authErrorNetworkErrorTitle,
          dialogText: IntlStrings.current.authErrorNetworkErrorMessage,
        );
}
