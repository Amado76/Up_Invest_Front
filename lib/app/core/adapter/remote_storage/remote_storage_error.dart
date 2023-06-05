import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';

/// The [AuthError] class represents authentication errors.
Map<String, RemoteStorageError> remoteStorageErrorMapping = {
  'retry-limit-exceeded': RemoteStorageErrorRetryLimitExceeded(),
};

@immutable
sealed class RemoteStorageError extends Equatable {
  /// The title of the error dialog to be displayed.
  final String dialogTitle;

  /// The text of the error dialog to be displayed.
  final String dialogText;

  const RemoteStorageError({
    required this.dialogTitle,
    required this.dialogText,
  });

  /// Factory method to create an [RemoteStorageError] object based on a [Exception].
  /// [exception] - The [Exception] from which to create the [RemoteStorageError].
  /// Returns an [RemoteStorageError] object corresponding to the provided exception,
  /// or a default [RemoteStorageErrorUnknown] object if no mapping is found.

  factory RemoteStorageError.from(FirebaseException exception) {
    return remoteStorageErrorMapping[exception.code.toLowerCase().trim()] ??
        RemoteStorageErrorUnknown();
  }
}

@immutable
class RemoteStorageErrorUnknown extends RemoteStorageError {
  RemoteStorageErrorUnknown()
      : super(
          dialogTitle: IntlStrings.current.remoteStorageErrorUnknownTitle,
          dialogText: IntlStrings.current.remoteStorageErrorUnknownMessage,
        );

  @override
  List<Object?> get props => [super.dialogText, super.dialogTitle];
}

//storage/retry-limit-exceeded
class RemoteStorageErrorRetryLimitExceeded extends RemoteStorageError {
  RemoteStorageErrorRetryLimitExceeded()
      : super(
          dialogTitle:
              IntlStrings.current.remoteStorageErrorRetryLimitExceededTitle,
          dialogText:
              IntlStrings.current.remoteStorageErrorRetryLimitExceededMessage,
        );

  @override
  List<Object?> get props => [super.dialogText, super.dialogTitle];
}
