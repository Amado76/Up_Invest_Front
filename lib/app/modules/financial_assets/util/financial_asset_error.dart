import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';

/// The [FinancialAssetError] class represents authentication errors.
Map<String, FinancialAssetError> financialAssetErrorMapping = {};

@immutable
sealed class FinancialAssetError extends Equatable {
  /// The title of the error dialog to be displayed.
  final String dialogTitle;

  /// The text of the error dialog to be displayed.
  final String dialogText;

  const FinancialAssetError({
    required this.dialogTitle,
    required this.dialogText,
  });

  /// Factory method to create an [FinancialAssetError] object based on a [Exception].
  /// [exception] - The [Exception] from which to create the [FinancialAssetError].
  /// Returns an [FinancialAssetError] object corresponding to the provided exception,
  /// or a default [FinancialAssetErrorUnknown] object if no mapping is found.

  factory FinancialAssetError.from(Exception exception) {
    String errorMessage = exception.toString();
    return financialAssetErrorMapping[errorMessage] ??
        FinancialAssetErrorUnknown();
  }
}

class FinancialAssetErrorUnknown extends FinancialAssetError {
  FinancialAssetErrorUnknown()
      : super(
          dialogTitle: IntlStrings.current.financialErrorUnknownTitle,
          dialogText: IntlStrings.current.financialErrorUnknownMessage,
        );

  @override
  List<Object?> get props => [super.dialogText, super.dialogTitle];
}

class FinancialAssetErrorDelete extends FinancialAssetError {
  FinancialAssetErrorDelete()
      : super(
          dialogTitle: IntlStrings.current.financialErrorDeleteTitle,
          dialogText: IntlStrings.current.financialErrorDeleteMessage,
        );

  @override
  List<Object?> get props => [super.dialogText, super.dialogTitle];
}
