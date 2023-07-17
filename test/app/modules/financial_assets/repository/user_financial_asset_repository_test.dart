import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/urls.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/user_financial_asset_model.dart';
import 'package:up_invest_front/app/modules/financial_assets/repository/user_financial_asset_repository.dart';

import '../../../../mocks/core/adapter/dio_adapter_mock.dart';

void main() {
  final dioAdapterMock = DioAdapterMock();
  final IUserFinancialAssetRepository userAssetRepository =
      UserFinancialAssetRepository(httpClientAdapter: dioAdapterMock);
  final mockedDataResult = {
    'result': 'success',
  };
  final Response mockedResponse = Response(
    data: mockedDataResult,
    statusCode: 200,
    requestOptions: RequestOptions(path: ''),
  );

  group('[deleteUserAsset]', () {
    test('Should call httpClientAdapter.delete', () async {
      //arrange
      when(() => dioAdapterMock.delete(
            path: '${UrlsPaths.baseUserAssetsUrl}/1',
            headers: {
              'userid': 1,
              'authtoken': 'authToken',
            },
          )).thenAnswer((_) async => (data: mockedDataResult, statusCode: 200));
      when(() => DioMock().delete(
            any(),
          )).thenAnswer((_) async => mockedResponse);
      //act
      userAssetRepository.deleteUserAsset(
          userId: 1, authToken: 'authToken', assetId: 1);
      //assert
      verify(() => dioAdapterMock.delete(
            path: '${UrlsPaths.baseUserAssetsUrl}/1',
            headers: {
              'userid': 1,
              'authtoken': 'authToken',
            },
          )).called(1);
    });
  });

  group('[deleteAllUserAsset]', () {
    test('Should call httpClientAdapter.delete', () async {
      //arrange
      when(() => dioAdapterMock.delete(
            path: UrlsPaths.baseUserAssetsUrl,
            headers: {
              'userid': 1,
              'authtoken': 'authToken',
            },
          )).thenAnswer((_) async => (data: mockedDataResult, statusCode: 200));
      when(() => DioMock().delete(
            any(),
          )).thenAnswer((_) async => mockedResponse);
      //act
      userAssetRepository.deleteAllUserAssets(
          userId: 1, authToken: 'authToken');
      //assert
      verify(() => dioAdapterMock.delete(
            path: UrlsPaths.baseUserAssetsUrl,
            headers: {
              'userid': 1,
              'authtoken': 'authToken',
            },
          )).called(1);
    });
  });

  group('[getUserAssets]', () {
    test('should return a list of Userassets', () async {
      //Arrange
      when(() => dioAdapterMock.get(
            path: UrlsPaths.baseUserAssetsUrl,
            headers: {
              'userid': 1,
              'authtoken': 'authToken',
            },
          )).thenAnswer((_) async => (data: json, statusCode: 200));
      when(() => DioMock().get(
            any(),
          )).thenAnswer((_) async => mockedResponse);
      //Act
      List<FinancialUserAssetModel> result = await userAssetRepository
          .getUserAssets(userId: 1, authToken: 'authToken');
      //Assert
      expect(result, isA<List<FinancialUserAssetModel>>());
      expect(result[0].id, 1);
    });
  });
}

final json = [
  {
    'id': 1,
    'ticker': 'XPML11',
    'currency': 'brl',
    'category': {
      'category': 'fii',
      'segment': 'tijolo',
      'subSegment': 'shopping'
    },
    'currentPrice': 150.5
  },
  {
    'id': 2,
    'ticker': 'RBRY11',
    'currency': 'brl',
    'category': {
      'category': 'fii',
      'segment': 'papel',
      'subSegment': 'high-grade'
    },
    'currentPrice': 100.29
  },
  {
    'id': 3,
    'ticker': 'ITUB4',
    'currency': 'brl',
    'category': {'category': 'brStock', 'segment': 'Bancos', 'subSegment': ''},
    'currentPrice': 28.89
  },
  {
    'id': 4,
    'ticker': 'BIDI4',
    'currency': 'brl',
    'category': {'category': 'brStock', 'segment': 'Bancos', 'subSegment': ''},
    'currentPrice': 3.41
  },
  {
    'id': 5,
    'ticker': 'HSML11',
    'currency': 'brl',
    'category': {
      'category': 'fii',
      'segment': 'Tijolo',
      'subSegment': 'shopping'
    },
    'currentPrice': 100.29
  },
  {
    'id': 6,
    'ticker': 'AAPL',
    'currency': 'usd',
    'category': {
      'category': 'usaStock',
      'segment': 'Tecnologia',
      'subSegment': 'Computer Manufacturing'
    },
    'currentPrice': 188.29
  }
];
