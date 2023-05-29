import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';

Map<String, SettingsError> settingsErrorMapping = {
  'Exception: error-on-save': SettingsErrorOnSave(),
};

sealed class SettingsError extends Equatable {
  /// The title of the error dialog to be displayed.
  final String dialogTitle;

  /// The text of the error dialog to be displayed.
  final String dialogText;

  const SettingsError({
    required this.dialogTitle,
    required this.dialogText,
  });

  /// Factory method to create an [SettingsError] object based on a [Exception].
  /// [exception] - The [Exception] from which to create the [SettingsError].
  /// Returns an [SettingsError] object corresponding to the provided exception,
  /// or a default [SettingsErrorUnknown] object if no mapping is found.
  factory SettingsError.from(Exception exception) {
    String errorMessage = exception.toString();
    return settingsErrorMapping[errorMessage] ?? SettingsErrorUnknown();
  }
}

@immutable
class SettingsErrorUnknown extends SettingsError {
  SettingsErrorUnknown()
      : super(
          dialogTitle: IntlStrings.current.settingsErrorUnknownTitle,
          dialogText: IntlStrings.current.settingsErrorUnknownMessage,
        );

  @override
  List<Object?> get props => [super.dialogText, super.dialogTitle];
}

@immutable
class SettingsErrorOnSave extends SettingsError {
  SettingsErrorOnSave()
      : super(
          dialogTitle: IntlStrings.current.settingsErrorOnSaveTitle,
          dialogText: IntlStrings.current.settingsErrorOnSaveessage,
        );

  @override
  List<Object?> get props => [super.dialogText, super.dialogTitle];
}
