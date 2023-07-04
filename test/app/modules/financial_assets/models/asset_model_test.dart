// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/asset_model.dart';
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
        expect(() => AssetModel.fromJson(invalidJson), throwsException);
      });
    });

    group('[toJson]', () {
      final AssetModel assetModel =
          AssetModel(id: 1, currency: Currency.brl, currentPrice: 1.0);

      test('should return a valid json when the model has a valid data', () {
        //act
        final result = assetModel.toJson();
        //assert
        expect(result, json);
      });
    });
  });
}

final json = {
  'id': 1,
  'currency': 'brl',
  'currentPrice': 1.0,
};
final invalidJson = {
  'id': 1,
  'currency': 'brl',
  'currentPrice': '1.0',
};
