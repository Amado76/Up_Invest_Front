import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/asset_category_model.dart';

void main() {
  const AssetCategory category = AssetCategory.fii;
  const String segment = 'papel';
  const String subSegment = 'shopping';
  group('[AssetModel]', () {
    test('supports value comparisons', () {
      expect(
          // ignore: prefer_const_constructors
          AssetCategoryModel(
              category: category, segment: segment, subSegment: subSegment),
          // ignore: prefer_const_constructors
          AssetCategoryModel(
              category: category, segment: segment, subSegment: subSegment));
    });
    group('[fromJson]', () {
      const AssetCategoryModel assetModel = AssetCategoryModel(
          category: category, segment: segment, subSegment: subSegment);

      test('should return a valid model when the JSON has a valid data', () {
        //act
        final result = AssetCategoryModel.fromJson(json);
        //assert
        expect(result.category, assetModel.category);
        expect(result.segment, assetModel.segment);
        expect(result.subSegment, assetModel.subSegment);
      });
      test('should throw a Exception when the JSON has a invalid data', () {
        //assert
        expect(() => AssetCategoryModel.fromJson(invalidJson), throwsException);
      });
      test('should throw a Exception when the JSON has a invalid assettype',
          () {
        expect(() => AssetCategoryModel.fromJson(invalidTypeJson),
            throwsException);
      });
    });

    group('[toJson]', () {
      const AssetCategoryModel assetModel = AssetCategoryModel(
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
    const userAssetModel = AssetCategoryModel(
        category: category, segment: segment, subSegment: subSegment);
    test('should return a copy of the model changing only the segment', () {
      //act
      final AssetCategoryModel copy =
          userAssetModel.copyWith(segment: 'tijolo');
      //assert
      expect(copy, isA<AssetCategoryModel>());
      expect(copy.segment, 'tijolo');
    });
    test('should return a copy of the model changing only the subSegment', () {
      //act
      final AssetCategoryModel copy =
          userAssetModel.copyWith(subSegment: 'logistica');
      //assert
      expect(copy, isA<AssetCategoryModel>());
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
