// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/assets/models/asset_model.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';

void main() {
  const int id = 1;
  const double currentPrice = 1.0;
  const Currency currency = Currency.brl;
  group('[AssetModel]', () {
    test('supports value comparisons', () {
      expect(AssetModel(id: id, currency: currency, currentPrice: currentPrice),
          AssetModel(id: id, currency: currency, currentPrice: currentPrice));
    });
    group('[fromJson]', () {
      final AssetModel assetModel =
          AssetModel(id: 1, currency: Currency.brl, currentPrice: 1.0);
      final json = {
        'id': 1,
        'currency': 'brl',
        'currentPrice': 1.0,
      };
      final json2 = {
        'id': 1,
        'currency': 'brl',
        'currentPrice': '1.0',
      };
      test('should return a valid model when the JSON has a valid data', () {
        //act
        final result = AssetModel.fromJson(json);
        //assert
        expect(result.id, assetModel.id);
        expect(result.currency, assetModel.currency);
        expect(result.currentPrice, assetModel.currentPrice);
      });
      test('should throw a Exception when the JSON has a invalid data', () {
        //assert
        expect(() => AssetModel.fromJson(json2), throwsException);
      });
    });
  });
}
