import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/auth/auth_error.dart';

void main() {
  group('AuthError', () {
    test(
        'Should return an instance of AuthErrorUnknown if the error from FirebaseAuthException is unknown or not mapped',
        () {
      // Arrange
      final firebaseAuthException = FirebaseAuthException(code: 'unknown-code');

      // Act
      final authError = AuthError.from(firebaseAuthException);

      // Assert
      expect(authError, isA<AuthErrorUnknown>());
    });

    test(
        'Should return an instance of AuthErrorEmailAlreadyExists if the error from FirebaseAuthException is email-already-exists',
        () {
      // Arrange
      final firebaseAuthException =
          FirebaseAuthException(code: 'auth/email-already-exists');

      // Act
      final authError = AuthError.from(firebaseAuthException);

      // Assert
      expect(authError, isA<AuthErrorEmailAlreadyExists>());
    });
    test(
        'Should return an instance of AuthErrorTokenExpired if the error from FirebaseAuthException is auth/id-token-expired',
        () {
      // Arrange
      final firebaseAuthException =
          FirebaseAuthException(code: 'auth/id-token-expired');

      // Act
      final authError = AuthError.from(firebaseAuthException);

      // Assert
      expect(authError, isA<AuthErrorTokenExpired>());
    });

    test(
        'Should return an instance of AuthErrorTokenRevoked if the error from FirebaseAuthException is auth/id-token-revoked',
        () {
      // Arrange
      final firebaseAuthException =
          FirebaseAuthException(code: 'auth/id-token-revoked');

      // Act
      final authError = AuthError.from(firebaseAuthException);

      // Assert
      expect(authError, isA<AuthErrorTokenRevoked>());
    });

    test(
        'Should return an instance of AuthErrorInvalidEmail if the error from FirebaseAuthException is auth/invalid-email',
        () {
      // Arrange
      final firebaseAuthException =
          FirebaseAuthException(code: 'auth/invalid-email');

      // Act
      final authError = AuthError.from(firebaseAuthException);

      // Assert
      expect(authError, isA<AuthErrorInvalidEmail>());
    });

    test(
        'Should return an instance of AuthErrorOperationNotAllowed if the error from FirebaseAuthException is auth/operation-not-allowed',
        () {
      // Arrange
      final firebaseAuthException =
          FirebaseAuthException(code: 'auth/operation-not-allowed');

      // Act
      final authError = AuthError.from(firebaseAuthException);

      // Assert
      expect(authError, isA<AuthErrorOperationNotAllowed>());
    });

    test(
        'Should return an instance of AuthErrorUserNotFound if the error from FirebaseAuthException is auth/user-not-found',
        () {
      // Arrange
      final firebaseAuthException =
          FirebaseAuthException(code: 'auth/user-not-found');

      // Act
      final authError = AuthError.from(firebaseAuthException);

      // Assert
      expect(authError, isA<AuthErrorUserNotFound>());
    });

    test(
        'Should return an instance of AuthErrorRequiresRecentLogin if the error from FirebaseAuthException is auth/requires-recent-login',
        () {
      // Arrange
      final firebaseAuthException =
          FirebaseAuthException(code: 'auth/requires-recent-login');

      // Act
      final authError = AuthError.from(firebaseAuthException);

      // Assert
      expect(authError, isA<AuthErrorRequiresRecentLogin>());
    });

    test(
        'Should return an instance of AuthErrorWeakPassword if the error from FirebaseAuthException is auth/weak-password',
        () {
      // Arrange
      final firebaseAuthException =
          FirebaseAuthException(code: 'auth/weak-password');

      // Act
      final authError = AuthError.from(firebaseAuthException);

      // Assert
      expect(authError, isA<AuthErrorWeakPassword>());
    });

    test(
        'Should return an instance of AuthErrorUserMismatch if the error from FirebaseAuthException is auth/user-mismatch',
        () {
      // Arrange
      final firebaseAuthException =
          FirebaseAuthException(code: 'auth/user-mismatch');

      // Act
      final authError = AuthError.from(firebaseAuthException);

      // Assert
      expect(authError, isA<AuthErrorUserMismatch>());
    });
    test(
        'Should return an instance of AuthErrorWrongPassword if the error from FirebaseAuthException is auth/wrong-password',
        () {
      // Arrange
      final firebaseAuthException =
          FirebaseAuthException(code: 'auth/wrong-password');

      // Act
      final authError = AuthError.from(firebaseAuthException);

      // Assert
      expect(authError, isA<AuthErrorWrongPassword>());
    });
  });
}
