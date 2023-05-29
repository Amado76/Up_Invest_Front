import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/modules/settings/util/settings_error.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'en'));
  group('SettingsErrorUnknown', () {
    test(
        'should return an instance of [SettingsErrorUnknown] if the error from Exception is [unknown or not mapped]',
        () {
      // Arrange
      final exception = Exception('');
      // Act
      final authError = SettingsError.from(exception);
      //Assert
      expect(authError, isA<SettingsErrorUnknown>());
    });
    test('supports value comparisons', () {
      expect(SettingsErrorUnknown(), SettingsErrorUnknown());
    });
    test(
        'should return an instance of [SettingsErrorOnSave] if the error from Exception is [error-on-save]',
        () {
      // Arrange
      final exception = Exception('error-on-save');
      // Act
      final authError = SettingsError.from(exception);
      //Assert
      expect(authError, isA<SettingsErrorOnSave>());
    });
    test('supports value comparisons', () {
      expect(SettingsErrorOnSave(), SettingsErrorOnSave());
    });
  });
}
