import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/financial_asset_category_model.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/user_financial_asset_model.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';

import '../../../../mocks/assets/financial_assets_mock.dart';

void main() {
  const id = 1;
  const ticker = 'ticker';
  const currency = Currency.brl;
  const category = FinancialAssetCategoryModel(
      category: FinancialAssetCategory.fii,
      segment: 'papel',
      subSegment: 'shopping');
  const currentPrice = 1.0;

  group('[AssetModel]', () {
    test('supports value comparisons', () {
      expect(
        // ignore: prefer_const_constructors
        FinancialUserAssetModel(
          id: id,
          ticker: ticker,
          currency: currency,
          category: category,
          currentPrice: currentPrice,
        ),
        // ignore: prefer_const_constructors
        FinancialUserAssetModel(
          id: id,
          ticker: ticker,
          currency: currency,
          category: category,
          currentPrice: currentPrice,
        ),
      );
    });

    group('[copyWith]', () {
      const userAssetModel = FinancialUserAssetModel(
        id: id,
        ticker: ticker,
        currency: currency,
        category: category,
        currentPrice: currentPrice,
      );
      test('should return a copy of the model changing only the currentPrice',
          () {
        //act
        final FinancialUserAssetModel copy =
            userAssetModel.copyWith(currentPrice: 2.0);
        //assert
        expect(copy, isA<FinancialUserAssetModel>());
        expect(copy.currentPrice, 2.0);
      });
      test('should return a copy of the model changing only the category', () {
        //act
        final FinancialUserAssetModel copy = userAssetModel.copyWith(
            category: const FinancialAssetCategoryModel(
                category: FinancialAssetCategory.usaStock, segment: 'segment'));
        //assert
        expect(copy, isA<FinancialUserAssetModel>());
        expect(copy.category.category, FinancialAssetCategory.usaStock);
      });
    });
    group('[fromJson]', () {
      final XpmlUserAssetModelMock xpmlUserAssetModelMock =
          XpmlUserAssetModelMock();
      test('should return a valid model when the JSON has a valid data', () {
        final result = FinancialUserAssetModel.fromJson(json);

        expect(result.id, xpmlUserAssetModelMock.id);
        expect(result.ticker, xpmlUserAssetModelMock.ticker);
        expect(result.currency, xpmlUserAssetModelMock.currency);
        expect(result.category, xpmlUserAssetModelMock.category);
        expect(result.currentPrice, xpmlUserAssetModelMock.currentPrice);
      });
      test(
          'should return a valid model when the JSON has a valid data (fiiagro)',
          () {
        final result = FinancialUserAssetModel.fromJson(jsonFiagro);
        expect(
            result.category,
            const FinancialAssetCategoryModel(
              category: FinancialAssetCategory.fiagro,
              segment: 'papel',
            ));
      });

      test('should throw a Exception when the JSON has a invalid data', () {
        expect(() => FinancialUserAssetModel.fromJson(invalidJson),
            throwsException);
      });
      test('should throw a Exception when the JSON has a invalid assettype',
          () {
        expect(() => FinancialUserAssetModel.fromJson(invalidTypeJson),
            throwsException);
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

const userAsset = FinancialUserAssetModel(
  id: 1,
  ticker: 'XPML11',
  currency: Currency.brl,
  category: FinancialAssetCategoryModel(
      category: FinancialAssetCategory.fii,
      segment: 'papel',
      subSegment: 'shopping'),
  currentPrice: 150.50,
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
};

const userAssetFiagro = FinancialUserAssetModel(
  id: 1,
  ticker: 'XPML11',
  currency: Currency.brl,
  category: FinancialAssetCategoryModel(
      category: FinancialAssetCategory.fiagro, segment: 'papel'),
  currentPrice: 150.50,
);
