import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';

Map<String, SettingsSuccess> settingsSuccesssMapping = {
  'avatar-changed-successfully': SettingsSuccessAvatarChanged(),
};

@immutable
sealed class SettingsSuccess extends Equatable {
  /// The title of the Success dialog to be displayed.
  final String dialogTitle;

  /// The text of the Success dialog to be displayed.
  ///
  final String dialogText;
  const SettingsSuccess({
    required this.dialogTitle,
    required this.dialogText,
  });

  /// Factory method to create an [SettingsSuccess] object based on a [String].
  /// [success] - The [String] from which to create the [SettingsSuccess].
  /// Returns an [SettingsSuccess] object corresponding to the provided exception,
  /// or a default [SettingsSuccessUnknown] object if no mapping is found.
  factory SettingsSuccess.from(String success) =>
      settingsSuccesssMapping[success.toLowerCase().trim()] ??
      SettingsSuccessUnknown();
}

@immutable
class SettingsSuccessUnknown extends SettingsSuccess {
  SettingsSuccessUnknown()
      : super(
          dialogTitle: IntlStrings.current.settingsSuccessUnknownTitle,
          dialogText: IntlStrings.current.settingsSuccessUnknownMessage,
        );

  @override
  List<Object?> get props => [super.dialogText, super.dialogTitle];
}

//reset-password
@immutable
class SettingsSuccessAvatarChanged extends SettingsSuccess {
  SettingsSuccessAvatarChanged()
      : super(
          dialogTitle: IntlStrings.current.settingsSuccessChangeAvatarTitle,
          dialogText: IntlStrings.current.settingsSuccessChangeAvatarMessage,
        );
  @override
  List<Object?> get props => [super.dialogText, super.dialogTitle];
}
