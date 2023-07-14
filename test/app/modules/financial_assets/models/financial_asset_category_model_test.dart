import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/financial_asset_category_model.dart';

void main() {
  const FinancialAssetCategory category = FinancialAssetCategory.fii;
  const String segment = 'papel';
  const String subSegment = 'shopping';
  group('[AssetModel]', () {
    test('supports value comparisons', () {
      expect(
          // ignore: prefer_const_constructors
          FinancialAssetCategoryModel(
              category: category, segment: segment, subSegment: subSegment),
          // ignore: prefer_const_constructors
          FinancialAssetCategoryModel(
              category: category, segment: segment, subSegment: subSegment));
    });
    group('[fromJson]', () {
      const FinancialAssetCategoryModel assetModel =
          FinancialAssetCategoryModel(
              category: category, segment: segment, subSegment: subSegment);

      test('should return a valid model when the JSON has a valid data', () {
        //act
        final result = FinancialAssetCategoryModel.fromJson(json);
        //assert
        expect(result.category, assetModel.category);
        expect(result.segment, assetModel.segment);
        expect(result.subSegment, assetModel.subSegment);
      });
      test('should throw a Exception when the JSON has a invalid data', () {
        //assert
        expect(() => FinancialAssetCategoryModel.fromJson(invalidJson),
            throwsException);
      });
      test('should throw a Exception when the JSON has a invalid assettype',
          () {
        expect(() => FinancialAssetCategoryModel.fromJson(invalidTypeJson),
            throwsException);
      });
    });

    group('[toJson]', () {
      const FinancialAssetCategoryModel assetModel =
          FinancialAssetCategoryModel(
              category: category, segment: segment, subSegment: subSegment);

      test('should return a valid json when the model has a valid data', () {
        //act
        final result = assetModel.toJson();
        //assert
        expect(result, json);
      });
    });
  });
  group('[copyWith]', () {
    const userAssetModel = FinancialAssetCategoryModel(
        category: category, segment: segment, subSegment: subSegment);
    test('should return a copy of the model changing only the segment', () {
      //act
      final FinancialAssetCategoryModel copy =
          userAssetModel.copyWith(segment: 'tijolo');
      //assert
      expect(copy, isA<FinancialAssetCategoryModel>());
      expect(copy.segment, 'tijolo');
    });
    test('should return a copy of the model changing only the subSegment', () {
      //act
      final FinancialAssetCategoryModel copy =
          userAssetModel.copyWith(subSegment: 'logistica');
      //assert
      expect(copy, isA<FinancialAssetCategoryModel>());
      expect(copy.subSegment, 'logistica');
    });
  });
}

final json = {
  'category': 'fii',
  'segment': 'papel',
  'subSegment': 'shopping',
};
final invalidJson = {
  'category': 1,
  'segment': 'papel',
  'subSegment': 'shopping',
};

final invalidTypeJson = {
  'category': 'fiai',
  'segment': 'papel',
  'subSegment': 'shopping',
};
