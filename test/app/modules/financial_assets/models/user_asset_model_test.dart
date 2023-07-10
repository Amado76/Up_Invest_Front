import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/asset_category_model.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/user_asset_model.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';

import '../../../../mocks/assets/assets_mock.dart';

void main() {
  const id = 1;
  const ticker = 'ticker';
  const currency = Currency.brl;
  const category = AssetCategoryModel(
      category: AssetCategory.fii, segment: 'papel', subSegment: 'shopping');
  const currentPrice = 1.0;

  group('[AssetModel]', () {
    test('supports value comparisons', () {
      expect(
        // ignore: prefer_const_constructors
        UserAssetModel(
          id: id,
          ticker: ticker,
          currency: currency,
          category: category,
          currentPrice: currentPrice,
        ),
        // ignore: prefer_const_constructors
        UserAssetModel(
          id: id,
          ticker: ticker,
          currency: currency,
          category: category,
          currentPrice: currentPrice,
        ),
      );
    });

    group('[copyWith]', () {
      const userAssetModel = UserAssetModel(
        id: id,
        ticker: ticker,
        currency: currency,
        category: category,
        currentPrice: currentPrice,
      );
      test('should return a copy of the model changing only the currentPrice',
          () {
        //act
        final UserAssetModel copy = userAssetModel.copyWith(currentPrice: 2.0);
        //assert
        expect(copy, isA<UserAssetModel>());
        expect(copy.currentPrice, 2.0);
      });
    });
    group('[fromJson]', () {
      final XpmlUserAssetModelMock xpmlUserAssetModelMock =
          XpmlUserAssetModelMock();
      test('should return a valid model when the JSON has a valid data', () {
        final result = UserAssetModel.fromJson(json);

        expect(result.id, xpmlUserAssetModelMock.id);
        expect(result.ticker, xpmlUserAssetModelMock.ticker);
        expect(result.currency, xpmlUserAssetModelMock.currency);
        expect(result.category, xpmlUserAssetModelMock.category);
        expect(result.currentPrice, xpmlUserAssetModelMock.currentPrice);
      });
      test(
          'should return a valid model when the JSON has a valid data (fiiagro)',
          () {
        final result = UserAssetModel.fromJson(jsonFiagro);
        expect(
            result.category,
            const AssetCategoryModel(
              category: AssetCategory.fiagro,
              segment: 'papel',
            ));
      });

      test('should throw a Exception when the JSON has a invalid data', () {
        expect(() => UserAssetModel.fromJson(invalidJson), throwsException);
      });
      test('should throw a Exception when the JSON has a invalid assettype',
          () {
        expect(() => UserAssetModel.fromJson(invalidTypeJson), throwsException);
      });
    });

    group('[toJson]', () {
      test('should return a JSON map containing the proper data', () {
        final result = userAsset.toJson();
        expect(result, json);
      });
      test('should return a JSON map containing the proper data(fiagro)', () {
        final result = userAssetFiagro.toJson();
        expect(result, jsonFiagro);
      });
    });
  });
}

final userAsset = UserAssetModel(
  id: 1,
  ticker: 'XPML11',
  currency: Currency.brl,
  category: const AssetCategoryModel(
      category: AssetCategory.fii, segment: 'papel', subSegment: 'shopping'),
  currentPrice: 150.50,
  lastUpdate: DateTime(2021, 07, 01),
);

final json = {
  'id': 1,
  'ticker': 'XPML11',
  'currency': 'brl',
  'category': {
    'category': 'fii',
    'segment': 'papel',
    'subSegment': 'shopping',
  },
  'currentPrice': 150.50,
  'lastUpdate': '2021-07-01T00:00:00.000',
};
final invalidJson = {
  'id': '1',
  'ticker': 'XPML11',
  'currency': 'brl',
  'category': {
    'category': 'fii',
    'segment': 'papel',
    'subSegment': 'shopping',
  },
  'currentPrice': 150.50,
};
final invalidTypeJson = {
  'id': 1,
  'ticker': 'XPML11',
  'currency': 'brl',
  'category': 'fiisdaedae',
  'currentPrice': 150.50,
};

final jsonFiagro = {
  'id': 1,
  'ticker': 'XPML11',
  'currency': 'brl',
  'category': {'category': 'fiagro', 'segment': 'papel', 'subSegment': null},
  'currentPrice': 150.50,
  'lastUpdate': '2021-07-01T00:00:00.000',
};

final userAssetFiagro = UserAssetModel(
  id: 1,
  ticker: 'XPML11',
  currency: Currency.brl,
  category: const AssetCategoryModel(
      category: AssetCategory.fiagro, segment: 'papel'),
  currentPrice: 150.50,
  lastUpdate: DateTime(2021, 07, 01),
);
