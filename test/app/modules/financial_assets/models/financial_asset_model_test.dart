// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/financial_asset_category_model.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/financial_asset_model.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';

void main() {
  test('supports value comparisons', () {
    expect(
        FinancialAssetModel(
            id: 1,
            ticker: 'ticker',
            currency: Currency.brl,
            currentPrice: 1.0,
            category: FinancialAssetCategoryModel(
                category: FinancialAssetCategory.fii,
                segment: 'segment',
                subSegment: 'subSegment')),
        FinancialAssetModel(
            id: 1,
            ticker: 'ticker',
            currency: Currency.brl,
            currentPrice: 1.0,
            category: FinancialAssetCategoryModel(
                category: FinancialAssetCategory.fii,
                segment: 'segment',
                subSegment: 'subSegment')));
  });
  group('[fromJson]', () {
    test('should return a valid [financialAssetModel]', () {
      final financialAssetModel = FinancialAssetModel.fromJson(validJson);
      expect(financialAssetModel, isA<FinancialAssetModel>());
    });
    test('should throw a expection', () {
      expect(() => FinancialAssetModel.fromJson(invalidJson), throwsException);
    });
  });

  group('[toJson]', () {
    test('should return a valid [json]', () {
      const financialAssetModel = FinancialAssetModel(
          id: 1,
          ticker: 'ticker',
          currency: Currency.brl,
          currentPrice: 1.0,
          category: FinancialAssetCategoryModel(
              category: FinancialAssetCategory.fii,
              segment: 'segment',
              subSegment: 'subSegment'));
      expect(financialAssetModel.toJson(), isA<Map<String, dynamic>>());
    });
  });
}

final validJson = {
  'id': 1,
  'ticker': 'ticker',
  'currency': 'BRL',
  'currentPrice': 1.0,
  'category': {
    'category': 'fii',
    'segment': 'segment',
    'subSegment': 'subSegment',
  }
};

final invalidJson = {
  'id': '1',
  'ticker': 'ticker',
  'currency': 'BRL',
  'currentPrice': 1.0,
  'category': {
    'category': 'fii',
    'segment': 'segment',
    'subSegment': 'subSegment',
  }
};
