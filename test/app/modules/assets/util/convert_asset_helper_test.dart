import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/assets/util/convert_asset_helper.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';

void main() {
  group('[stringToCurrency]', () {
    test('should return Currency.brl when value is "brl"', () {
      // Arrange
      const value = 'brl';
      // Act
      final result = stringToCurrency(value);
      // Assert
      expect(result, Currency.brl);
    });
    test('should return Currency.brl when value is "BRL "', () {
      // Arrange
      const value = 'BRL ';
      // Act
      final result = stringToCurrency(value);
      // Assert
      expect(result, Currency.brl);
    });
    test('should return Currency.usd when value is "usd"', () {
      // Arrange
      const value = 'usd';
      // Act
      final result = stringToCurrency(value);
      // Assert
      expect(result, Currency.usd);
    });
    test('should return "Exception("invalid-currency" when value is invalid',
        () {
      // Arrange
      const value = 'invalidValue';
      // Assert
      expect(() => stringToCurrency(value), throwsException);
    });
  });

  group('[CurrencyToString]', () {
    test('should return "brl" when value is Currency.brl', () {
      // Arrange
      const value = Currency.brl;
      // Act
      final result = currencyToString(value);
      // Assert
      expect(result, 'brl');
    });
    test('should return "usd" when value is Currency.usd', () {
      // Arrange
      const value = Currency.usd;
      // Act
      final result = currencyToString(value);
      // Assert
      expect(result, 'usd');
    });
  });
}
