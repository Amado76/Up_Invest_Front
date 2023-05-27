import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' show Locale;

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_error.dart';
import 'package:up_invest_front/l10n/generated/l10n.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'en'));
  group('AuthError', () {
    setUp(() => {});
    group('.fromFirebase', () {
      test(
          'Should return an instance of [AuthErrorUnknown] if the error from FirebaseAuthException is [unknown or not mapped]',
          () {
        // Arrange
        final firebaseAuthException =
            FirebaseAuthException(code: 'unknown-code');

        // Act
        final authError = AuthError.fromFirebase(firebaseAuthException);

        // Assert
        expect(authError, isA<AuthErrorUnknown>());
      });

      test(
          'Should return an instance of [AuthErrorEmailAlreadyExists] if the error from FirebaseAuthException is [email-already-exists]',
          () {
        // Arrange
        final firebaseAuthException =
            FirebaseAuthException(code: 'email-already-exists');

        // Act
        final authError = AuthError.fromFirebase(firebaseAuthException);

        // Assert
        expect(authError, isA<AuthErrorEmailAlreadyExists>());
      });
      test(
          'Should return an instance of [AuthErrorTokenExpired] if the error from FirebaseAuthException is [id-token-expired]',
          () {
        // Arrange
        final firebaseAuthException =
            FirebaseAuthException(code: 'id-token-expired');

        // Act
        final authError = AuthError.fromFirebase(firebaseAuthException);

        // Assert
        expect(authError, isA<AuthErrorTokenExpired>());
      });

      test(
          'Should return an instance of [AuthErrorTokenRevoked] if the error from FirebaseAuthException is [id-token-revoked]',
          () {
        // Arrange
        final firebaseAuthException =
            FirebaseAuthException(code: 'id-token-revoked');

        // Act
        final authError = AuthError.fromFirebase(firebaseAuthException);

        // Assert
        expect(authError, isA<AuthErrorTokenRevoked>());
      });

      test(
          'Should return an instance of [AuthErrorInvalidEmail] if the error from FirebaseAuthException is [invalid-email]',
          () {
        // Arrange
        final firebaseAuthException =
            FirebaseAuthException(code: 'invalid-email');

        // Act
        final authError = AuthError.fromFirebase(firebaseAuthException);

        // Assert
        expect(authError, isA<AuthErrorInvalidEmail>());
      });

      test(
          'Should return an instance of [AuthErrorOperationNotAllowed] if the error from FirebaseAuthException is [operation-not-allowed]',
          () {
        // Arrange
        final firebaseAuthException =
            FirebaseAuthException(code: 'operation-not-allowed');

        // Act
        final authError = AuthError.fromFirebase(firebaseAuthException);

        // Assert
        expect(authError, isA<AuthErrorOperationNotAllowed>());
      });

      test(
          'Should return an instance of [AuthErrorUserNotFound] if the error from FirebaseAuthException is [user-not-found]',
          () {
        // Arrange
        final firebaseAuthException =
            FirebaseAuthException(code: 'user-not-found');

        // Act
        final authError = AuthError.fromFirebase(firebaseAuthException);

        // Assert
        expect(authError, isA<AuthErrorUserNotFound>());
      });

      test(
          'Should return an instance of [AuthErrorRequiresRecentLogin] if the error from FirebaseAuthException is [requires-recent-login]',
          () {
        // Arrange
        final firebaseAuthException =
            FirebaseAuthException(code: 'requires-recent-login');

        // Act
        final authError = AuthError.fromFirebase(firebaseAuthException);

        // Assert
        expect(authError, isA<AuthErrorRequiresRecentLogin>());
      });

      test(
          'Should return an instance of [AuthErrorWeakPassword] if the error from FirebaseAuthException is [weak-password]',
          () {
        // Arrange
        final firebaseAuthException =
            FirebaseAuthException(code: 'weak-password');

        // Act
        final authError = AuthError.fromFirebase(firebaseAuthException);

        // Assert
        expect(authError, isA<AuthErrorWeakPassword>());
      });

      test(
          'Should return an instance of [AuthErrorUserMismatch] if the error from FirebaseAuthException is [user-mismatch]',
          () {
        // Arrange
        final firebaseAuthException =
            FirebaseAuthException(code: 'user-mismatch');

        // Act
        final authError = AuthError.fromFirebase(firebaseAuthException);

        // Assert
        expect(authError, isA<AuthErrorUserMismatch>());
      });
      test(
          'Should return an instance of [AuthErrorWrongPassword] if the error from FirebaseAuthException is [wrong-password]',
          () {
        // Arrange
        final firebaseAuthException =
            FirebaseAuthException(code: 'wrong-password');

        // Act
        final authError = AuthError.fromFirebase(firebaseAuthException);

        // Assert
        expect(authError, isA<AuthErrorWrongPassword>());
      });

      test(
          'Should return an instance of [AuthErrorTooManyRequests] if the error from FirebaseAuthException is [too-many-requests]',
          () {
        // Arrange
        final firebaseAuthException =
            FirebaseAuthException(code: 'too-many-requests');

        // Act
        final authError = AuthError.fromFirebase(firebaseAuthException);

        // Assert
        expect(authError, isA<AuthErrorTooManyRequests>());
      });
    });

    group('.from', () {
      test(
          'Should return an instance of [AuthErrorUnknown] if the error from Exception is [not known or mapped]',
          () {
        // Arrange
        final exception = Exception('');
        // Act
        final authError = AuthError.from(exception);
        //Assert
        expect(authError, isA<AuthErrorUnknown>());
      });
      test(
          'Should return an instance of [AuthErrorOperationNotAllowed] if the error from Exception is ["Exception: invalid-social-network"]',
          () {
        // Arrange
        final exception = Exception('invalid-social-network');
        // Act
        final authError = AuthError.from(exception);
        //Assert
        expect(authError, isA<AuthErrorOperationNotAllowed>());
      });
      test(
          'Should return an instance of [AuthErrorNetworkError] if the error from PlataformException is ["network-request-failed"]',
          () {
        // Arrange
        final exception = PlatformException(code: 'network-request-failed');
        // Act
        final authError = AuthError.from(exception);
        //Assert
        expect(authError, isA<AuthErrorNetworkError>());
      });
      test(
          'Should return an instance of [AuthErrorNetworkError] if the error from PlataformException is ["network_error"]',
          () {
        // Arrange
        final exception = PlatformException(code: 'network_error');
        // Act
        final authError = AuthError.from(exception);
        //Assert
        expect(authError, isA<AuthErrorNetworkError>());
      });
    });
  });
}
