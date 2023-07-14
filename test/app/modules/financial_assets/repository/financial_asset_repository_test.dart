import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/urls.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/financial_asset_model.dart';
import 'package:up_invest_front/app/modules/financial_assets/repository/financial_asset_repository.dart';

import '../../../../mocks/core/adapter/dio_adapter_mock.dart';

void main() {
  final dioAdapterMock = DioAdapterMock();
  final IFinancialAssetRepository assetRepository =
      FinancialAssetRepository(httpClientAdapter: dioAdapterMock);
  final mockedDataResult = {
    'result': 'success',
  };
  final Response mockedResponse = Response(
    data: mockedDataResult,
    statusCode: 200,
    requestOptions: RequestOptions(path: ''),
  );

  group('[getAllAssets]', () {
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
      final result =
          await assetRepository.getAllAssets(userId: 1, authToken: 'authToken');
      //Assert
      expect(result, isA<List<FinancialAssetModel>>());
      expect(result[0].id, 1);
    });
  });
  group('[getSpecificAsset]', () {
    test('should return [AssetModel]', () async {
      //Arrange

      when(() => dioAdapterMock.get(
                path: '${UrlsPaths.baseUrl}/1',
                headers: any(named: 'headers'),
              ))
          .thenAnswer((_) async => (data: jsonSpecificAsset, statusCode: 200));
      when(() => DioMock().get(
            any(),
          )).thenAnswer((_) async => mockedResponse);
      //Act
      final result = await assetRepository.getSpecificAsset(
          userId: 1, authToken: 'authToken', assetId: 1);

      //Assert
      expect(result.currentPrice, 50000.0);
    });
  });
}

final jsonAssets = [
  {
    'id': 1,
    'ticker': 'test',
    'currency': 'usd',
    'currentPrice': 50000.0,
    'category': {'category': 'usastock', 'segment': 'tech', 'subSegment': null}
  },
  {
    'id': 2,
    'ticker': 'test2',
    'currency': 'usd',
    'currentPrice': 3000.0,
    'category': {'category': 'usastock', 'segment': 'tech', 'subSegment': null}
  },
  {
    'id': 3,
    'ticker': 'test3',
    'currency': 'brl',
    'currentPrice': 100.0,
    'category': {'category': 'brstock', 'segment': 'agro', 'subSegment': null}
  }
];

final jsonSpecificAsset = {
  'id': 1,
  'ticker': 'XPLG11',
  'currency': 'usd',
  'currentPrice': 50000.0,
  'category': {
    'category': 'fii',
    'segment': 'tijolo',
    'subSegment': 'logistica',
  }
};
