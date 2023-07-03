import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/assets/models/asset_dividend_history.dart';
import 'package:up_invest_front/app/modules/assets/models/user_asset_model.dart';
import 'package:up_invest_front/app/modules/assets/models/asset_transaction.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';

import '../../../../mocks/assets/assets_mock.dart';

void main() {
  const id = 1;
  const ticker = 'ticker';
  const currency = Currency.brl;
  const type = AssetType.brStock;
  const currentPrice = 1.0;
  const List<AssetTransaction> transactionsHistory = [];
  const List<AssetDividendHistory> dividendHistory = [];

  group('[AssetModel]', () {
    test('supports value comparisons', () {
      expect(
        // ignore: prefer_const_constructors
        UserAssetModel(
            id: id,
            ticker: ticker,
            currency: currency,
            type: type,
            currentPrice: currentPrice,
            transactionsHistory: transactionsHistory,
            dividendHistory: dividendHistory),
        // ignore: prefer_const_constructors
        UserAssetModel(
            id: id,
            ticker: ticker,
            currency: currency,
            type: type,
            currentPrice: currentPrice,
            transactionsHistory: transactionsHistory,
            dividendHistory: dividendHistory),
      );
    });

    group('[copyWith]', () {
      const userAssetModel = UserAssetModel(
          id: id,
          ticker: ticker,
          currency: currency,
          type: type,
          currentPrice: currentPrice,
          transactionsHistory: transactionsHistory,
          dividendHistory: dividendHistory);
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
        expect(result.type, xpmlUserAssetModelMock.type);
        expect(result.currentPrice, xpmlUserAssetModelMock.currentPrice);
        expect([
          result.transactionsHistory[0].id,
          result.transactionsHistory[1].id
        ], [
          xpmlUserAssetModelMock.transactionsHistory[0].id,
          xpmlUserAssetModelMock.transactionsHistory[1].id
        ]);
        expect(
          result.dividendHistory[0].id,
          xpmlUserAssetModelMock.dividendHistory[0].id,
        );
      });
      test(
          'should return a valid model when the JSON has a valid data (fiiagro)',
          () {
        final result = UserAssetModel.fromJson(jsonFiagro);
        expect(result.type, AssetType.fiagro);
      });

      test('should throw a Exception when the JSON has a invalid data', () {
        expect(() => UserAssetModel.fromJson(json2), throwsException);
      });
      test('should throw a Exception when the JSON has a invalid assettype',
          () {
        expect(() => UserAssetModel.fromJson(json3), throwsException);
      });
    });
  });
}

final json = {
  'id': 1,
  'ticker': 'XPML11',
  'currency': 'brl',
  'type': 'fiis',
  'currentPrice': 150.50,
  'transactionsHistory': [
    {
      'id': 1,
      'assetId': 1,
      'type': 'buy',
      'date': '2023-06-20',
      'quantity': 10.0,
      'price': 145.75,
      'brokerage': 5.0,
      'total': 1457.5,
      'totalWithBrokerage': 1462.5,
      'currency': 'brl'
    },
    {
      'id': 2,
      'assetId': 1,
      'type': 'sell',
      'date': '2023-06-20',
      'quantity': 10.0,
      'price': 145.75,
      'brokerage': 5.0,
      'total': 1457.5,
      'totalWithBrokerage': 1462.5,
      'currency': 'brl'
    }
  ],
  'dividendHistory': [
    {
      'id': 1,
      'assetId': 1,
      'exDividendDate': '2023-07-01',
      'paymentDate': '2023-07-15',
      'dividendAmount': 10.0,
      'totalDividendAmount': 100.0,
      'quantity': 10.0,
      'currency': 'brl'
    }
  ]
};
final json2 = {
  'id': 1.0,
  'ticker': 'XPML11',
  'currency': 'brl',
  'type': 'fiis',
  'currentPrice': 150.50,
  'transactionsHistory': [],
  'dividendHistory': []
};
final json3 = {
  'id': 1,
  'ticker': 'XPML11',
  'currency': 'brl',
  'type': 'fiisdaedae',
  'currentPrice': 150.50,
  'transactionsHistory': [],
  'dividendHistory': []
};

final jsonFiagro = {
  'id': 1,
  'ticker': 'XPML11',
  'currency': 'brl',
  'type': 'fiagro',
  'currentPrice': 150.50,
  'transactionsHistory': [
    {
      'id': 1,
      'assetId': 1,
      'type': 'buy',
      'date': '2023-06-20',
      'quantity': 10.0,
      'price': 145.75,
      'brokerage': 5.0,
      'total': 1457.5,
      'totalWithBrokerage': 1462.5,
      'currency': 'brl'
    },
    {
      'id': 2,
      'assetId': 1,
      'type': 'sell',
      'date': '2023-06-20',
      'quantity': 10.0,
      'price': 145.75,
      'brokerage': 5.0,
      'total': 1457.5,
      'totalWithBrokerage': 1462.5,
      'currency': 'brl'
    }
  ],
  'dividendHistory': [
    {
      'id': 1,
      'assetId': 1,
      'exDividendDate': '2023-07-01',
      'paymentDate': '2023-07-15',
      'dividendAmount': 10.0,
      'totalDividendAmount': 100.0,
      'quantity': 10.0,
      'currency': 'brl'
    }
  ]
};
