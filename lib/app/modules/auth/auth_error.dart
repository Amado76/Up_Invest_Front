import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show immutable;

/// The [AuthError] class represents authentication errors.
const Map<String, AuthError> authErrorMapping = {
  'auth/email-already-exists': AuthErrorEmailAlreadyExists(),
  'auth/id-token-expired': AuthErrorTokenExpired(),
  'auth/id-token-revoked': AuthErrorTokenRevoked(),
  'auth/invalid-email': AuthErrorInvalidEmail(),
  'auth/operation-not-allowed': AuthErrorOperationNotAllowed(),
  'auth/user-not-found': AuthErrorUserNotFound(),
  'auth/requires-recent-login': AuthErrorRequiresRecentLogin(),
  'auth/weak-password': AuthErrorWeakPassword(),
  'auth/user-mismatch': AuthErrorUserMismatch(),
  'auth/wrong-password': AuthErrorWrongPassword(),
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
  factory AuthError.from(FirebaseAuthException exception) =>
      authErrorMapping[exception.code.toLowerCase().trim()] ??
      const AuthErrorUnknown();
}

@immutable
class AuthErrorUnknown extends AuthError {
  const AuthErrorUnknown()
      : super(
          dialogTitle: 'Authentication error',
          dialogText: 'Unknown authentication error',
        );
}

// auth/email-already-exists
@immutable
class AuthErrorEmailAlreadyExists extends AuthError {
  const AuthErrorEmailAlreadyExists()
      : super(
          dialogTitle: 'Email already in use',
          dialogText: 'Please choose another email to register with!',
        );
}

// auth/id-token-expired
@immutable
class AuthErrorTokenExpired extends AuthError {
  const AuthErrorTokenExpired()
      : super(
          dialogTitle: 'Session Expired',
          dialogText: 'Your session has expired. Please sign in again!',
        );
}

// auth/id-token-revoked
@immutable
class AuthErrorTokenRevoked extends AuthError {
  const AuthErrorTokenRevoked()
      : super(
          dialogTitle: 'Session Expired',
          dialogText: 'Your session has expired. Please sign in again!',
        );
}

// auth/invalid-email
@immutable
class AuthErrorInvalidEmail extends AuthError {
  const AuthErrorInvalidEmail()
      : super(
          dialogTitle: 'Invalid Email',
          dialogText: 'Please enter a valid email address!',
        );
}

// auth/operation-not-allowed

@immutable
class AuthErrorOperationNotAllowed extends AuthError {
  const AuthErrorOperationNotAllowed()
      : super(
          dialogTitle: 'Operation not allowed',
          dialogText: 'You cannot register using this method at this moment!',
        );
}

// auth/user-not-found
@immutable
class AuthErrorUserNotFound extends AuthError {
  const AuthErrorUserNotFound()
      : super(
          dialogTitle: 'User not found!',
          dialogText: 'No current user with this information was found!',
        );
}

// auth/requires-recent-login
@immutable
class AuthErrorRequiresRecentLogin extends AuthError {
  const AuthErrorRequiresRecentLogin()
      : super(
          dialogTitle: 'Requires recent login',
          dialogText:
              'You need to log out and log back in again in order to perform this operation',
        );
}

// auth/weak-password
@immutable
class AuthErrorWeakPassword extends AuthError {
  const AuthErrorWeakPassword()
      : super(
          dialogTitle: 'Weak password',
          dialogText:
              'Please choose a stronger password consisting of more characters!',
        );
}

// auth/user-mismatch
@immutable
class AuthErrorUserMismatch extends AuthError {
  const AuthErrorUserMismatch()
      : super(
          dialogTitle: 'User Mismatch',
          dialogText:
              'The provided credential does not correspond to the user!',
        );
}

// auth/wrong-password
@immutable
class AuthErrorWrongPassword extends AuthError {
  const AuthErrorWrongPassword()
      : super(
          dialogTitle: 'Wrong email or password',
          dialogText: 'Please verify your email and password and try again.',
        );
}
