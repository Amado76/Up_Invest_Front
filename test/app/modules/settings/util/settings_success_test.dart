import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/modules/settings/util/settings_success.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'en'));
  group('[SettingsError]', () {
    group('[SettingsSuccessUnknown]', () {
      test(
          'should return an instance of [SettingsSuccessUnknown] if the string is [unknown or not mapped]',
          () {
        // Arrange
        const success = ('');
        // Act
        final authError = SettingsSuccess.from(success);
        //Assert
        expect(authError, isA<SettingsSuccessUnknown>());
      });
      test('supports value comparisons', () {
        expect(SettingsSuccessUnknown(), SettingsSuccessUnknown());
      });
    });
    group('[SettingsSuccessAvatarChanged]', () {
      test(
          'should return an instance of [SettingsSuccessAvatarChanged] if the string is [avatar-changed-successfully]',
          () {
        // Arrange
        const success = 'avatar-changed-successfully';
        // Act
        final authError = SettingsSuccess.from(success);
        //Assert
        expect(authError, isA<SettingsSuccessAvatarChanged>());
      });
      test('supports value comparisons', () {
        expect(SettingsSuccessAvatarChanged(), SettingsSuccessAvatarChanged());
      });
    });
  });
}
