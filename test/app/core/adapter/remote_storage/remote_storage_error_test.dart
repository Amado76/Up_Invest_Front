import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/core/adapter/remote_storage/remote_storage_error.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'en'));
  group('RemoteStorageError', () {
    group('[RemoteStorageErrorUnknown]', () {
      test(
          'should return an instance of [RemoteStorageErrorUnknown] if the error from FirebaseException is [unknown or not mapped]',
          () {
        // Arrange
        final firebaseAuthException =
            FirebaseException(plugin: '', code: 'unknown-code');
        // Act
        final authError = RemoteStorageError.from(firebaseAuthException);

        // Assert
        expect(authError, isA<RemoteStorageErrorUnknown>());
      });
      test('supports value comparisons', () {
        expect(RemoteStorageErrorUnknown(), RemoteStorageErrorUnknown());
      });
    });

    group('[RemoteStorageErrorRetryLimitExceeded]', () {
      test(
          'should return an instance of [RemoteStorageErrorRetryLimitExceeded] if the error from FirebaseException is [retry-limit-exceeded]',
          () {
        // Arrange
        final firebaseAuthException =
            FirebaseException(plugin: '', code: 'retry-limit-exceeded');
        // Act
        final authError = RemoteStorageError.from(firebaseAuthException);

        // Assert
        expect(authError, isA<RemoteStorageErrorRetryLimitExceeded>());
      });
      test('supports value comparisons', () {
        expect(RemoteStorageErrorRetryLimitExceeded(),
            RemoteStorageErrorRetryLimitExceeded());
      });
    });
  });
}
