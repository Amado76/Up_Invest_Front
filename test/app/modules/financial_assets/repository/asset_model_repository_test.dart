import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/urls.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/asset_model.dart';
import 'package:up_invest_front/app/modules/financial_assets/repository/asset_model_repository.dart';

import '../../../../mocks/core/adapter/dio_adapter_mock.dart';

void main() {
  final dioAdapterMock = DioAdapterMock();
  final IAssetRepository assetRepository =
      AssetRepository(httpClientAdapter: dioAdapterMock);
  final mockedDataResult = {
    'result': 'success',
  };
  final Response mockedResponse = Response(
    data: mockedDataResult,
    statusCode: 200,
    requestOptions: RequestOptions(path: ''),
  );

  group('[getAllAssetsCurrentPrice]', () {
    test('should return [List<AssetModel>]', () async {
      //Arrange
      when(() => dioAdapterMock.get(
            path: any(named: 'path'),
            headers: any(named: 'headers'),
          )).thenAnswer((_) async => (data: jsonAssets, statusCode: 200));
      when(() => DioMock().get(
            any(),
          )).thenAnswer((_) async => mockedResponse);
      //Act
      final result = await assetRepository.getAllAssetsCurrentPrice(
          userId: 1, authToken: 'authToken');
      //Assert
      expect(result, isA<List<AssetModel>>());
      expect(result[0].id, 1);
    });
  });
  group('[getSpecificAssetsCurrentPrice]', () {
    test(
        'should return [double value] when the json value is a double, an integer, or a string that can be parsed as a double',
        () async {
      //Arrange
      when(() => dioAdapterMock.get(
                path: '${UrlsPaths.userAssetsUrlPath}/1',
                headers: any(named: 'headers'),
              ))
          .thenAnswer(
              (_) async => (data: jsonSpecificDoubleValue, statusCode: 200));
      when(() => dioAdapterMock.get(
                path: '${UrlsPaths.userAssetsUrlPath}/2',
                headers: any(named: 'headers'),
              ))
          .thenAnswer(
              (_) async => (data: jsonSpecificIntValue, statusCode: 200));
      when(() => dioAdapterMock.get(
                path: '${UrlsPaths.userAssetsUrlPath}/3',
                headers: any(named: 'headers'),
              ))
          .thenAnswer(
              (_) async => (data: jsonSpecificStringValue, statusCode: 200));
      when(() => DioMock().get(
            any(),
          )).thenAnswer((_) async => mockedResponse);
      //Act
      final resultFromDoubleValue =
          await assetRepository.getSpecificAssetCurrentPrice(
              userId: 1, authToken: 'authToken', assetId: 1);
      final resultFromIntValue =
          await assetRepository.getSpecificAssetCurrentPrice(
              userId: 1, authToken: 'authToken', assetId: 2);
      final resultFromStringtValue =
          await assetRepository.getSpecificAssetCurrentPrice(
              userId: 1, authToken: 'authToken', assetId: 3);
      //Assert
      expect(resultFromDoubleValue, 50000.0);
      expect(resultFromIntValue, 50000.0);
      expect(resultFromStringtValue, 50000.0);
    });
    test(
        'should throw [expection] when the json value is not a double, an integer, or a string that can be parsed as a double',
        () async {
      //Arrange
      when(() => dioAdapterMock.get(
                path: '${UrlsPaths.userAssetsUrlPath}/1',
                headers: any(named: 'headers'),
              ))
          .thenAnswer(
              (_) async => (data: jsonSpecificWrongValue, statusCode: 200));

      when(() => DioMock().get(
            any(),
          )).thenAnswer((_) async => mockedResponse);

      //Assert
      expect(
          () => assetRepository.getSpecificAssetCurrentPrice(
              userId: 1, authToken: 'authToken', assetId: 1),
          throwsException);
    });
  });
}

final jsonAssets = [
  {
    'id': 1,
    'currency': 'usd',
    'currentprice': 50000.0,
  },
  {
    'id': 2,
    'currency': 'usd',
    'currentprice': 3000.0,
  },
  {
    'id': 3,
    'currency': 'brl',
    'currentprice': 100.0,
  }
];

final jsonSpecificDoubleValue = {
  'id': 1,
  'currency': 'usd',
  'currentprice': 50000.0,
};

final jsonSpecificIntValue = {
  'id': 1,
  'currency': 'usd',
  'currentprice': 50000,
};
final jsonSpecificStringValue = {
  'id': 1,
  'currency': 'usd',
  'currentprice': '50000.0',
};

final jsonSpecificWrongValue = {
  'id': 1,
  'currency': 'usd',
  'currentprice': 'fail',
};
