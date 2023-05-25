import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show immutable;

/// The [AuthError] class represents authentication errors.
const Map<String, AuthError> authErrorMapping = {
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
      const AuthErrorUnknown();

  /// Factory method to create an [AuthError] object based on a [Exception].
  /// [exception] - The [Exception] from which to create the [AuthError].
  /// Returns an [AuthError] object corresponding to the provided exception,
  /// or a default [AuthErrorUnknown] object if no mapping is found.
  factory AuthError.from(Exception exception) {
    String errorMessage = exception.toString();
    return authErrorMapping[errorMessage] ?? const AuthErrorUnknown();
  }
}

@immutable
class AuthErrorUnknown extends AuthError {
  const AuthErrorUnknown()
      : super(
          dialogTitle: 'Authentication error',
          dialogText: 'Unknown authentication error',
        );
}

///email-already-exists
@immutable
class AuthErrorEmailAlreadyExists extends AuthError {
  const AuthErrorEmailAlreadyExists()
      : super(
          dialogTitle: 'Email already in use',
          dialogText: 'Please choose another email to register with!',
        );
}

///id-token-expired
@immutable
class AuthErrorTokenExpired extends AuthError {
  const AuthErrorTokenExpired()
      : super(
          dialogTitle: 'Session Expired',
          dialogText: 'Your session has expired. Please sign in again!',
        );
}

///id-token-revoked
@immutable
class AuthErrorTokenRevoked extends AuthError {
  const AuthErrorTokenRevoked()
      : super(
          dialogTitle: 'Session Expired',
          dialogText: 'Your session has expired. Please sign in again!',
        );
}

///invalid-email
@immutable
class AuthErrorInvalidEmail extends AuthError {
  const AuthErrorInvalidEmail()
      : super(
          dialogTitle: 'Invalid Email',
          dialogText: 'Please enter a valid email address!',
        );
}

///operation-not-allowed

@immutable
class AuthErrorOperationNotAllowed extends AuthError {
  const AuthErrorOperationNotAllowed()
      : super(
          dialogTitle: 'Operation not allowed',
          dialogText: 'You cannot register using this method at this moment!',
        );
}

///user-not-found
@immutable
class AuthErrorUserNotFound extends AuthError {
  const AuthErrorUserNotFound()
      : super(
          dialogTitle: 'User not found!',
          dialogText: 'No current user with this information was found!',
        );
}

///requires-recent-login
@immutable
class AuthErrorRequiresRecentLogin extends AuthError {
  const AuthErrorRequiresRecentLogin()
      : super(
          dialogTitle: 'Requires recent login',
          dialogText:
              'You need to log out and log back in again in order to perform this operation',
        );
}

///weak-password
@immutable
class AuthErrorWeakPassword extends AuthError {
  const AuthErrorWeakPassword()
      : super(
          dialogTitle: 'Weak password',
          dialogText:
              'Please choose a stronger password consisting of more characters!',
        );
}

/// user-mismatch
@immutable
class AuthErrorUserMismatch extends AuthError {
  const AuthErrorUserMismatch()
      : super(
          dialogTitle: 'User Mismatch',
          dialogText:
              'The provided credential does not correspond to the user!',
        );
}

///wrong-password
@immutable
class AuthErrorWrongPassword extends AuthError {
  const AuthErrorWrongPassword()
      : super(
          dialogTitle: 'Wrong email or password',
          dialogText: 'Please verify your email and password and try again.',
        );
}

///too-many-requests
@immutable
class AuthErrorTooManyRequests extends AuthError {
  const AuthErrorTooManyRequests()
      : super(
          dialogTitle: 'To many failed login attempts',
          dialogText:
              'Access to this account has been temporarily disabled due to many failed login attempts.',
        );
}
