import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/asset_dividend_history.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/user_asset_model.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/asset_transaction.dart';
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
      test(
          'should return a copy of the model changing only the dividendHistory ',
          () {
        //act
        final UserAssetModel copy =
            userAssetModel.copyWith(dividendHistory: []);
        //assert
        expect(copy, isA<UserAssetModel>());
        expect(copy.dividendHistory, []);
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
    type: AssetType.fiis,
    currentPrice: 150.50,
    lastUpdate: DateTime(2021, 07, 01),
    transactionsHistory: [
      AssetTransaction(
          id: 1,
          assetId: 1,
          type: TransactionType.buy,
          transactionDate: DateTime(2023, 06, 20),
          quantity: 10.0,
          price: 145.75,
          brokerage: 5.0,
          total: 1457.5,
          totalWithBrokerage: 1462.5,
          currency: Currency.brl),
      AssetTransaction(
          id: 2,
          assetId: 1,
          type: TransactionType.sell,
          transactionDate: DateTime(2023, 06, 20),
          quantity: 10.0,
          price: 145.75,
          brokerage: 5.0,
          total: 1457.5,
          totalWithBrokerage: 1462.5,
          currency: Currency.brl),
    ],
    dividendHistory: [
      AssetDividendHistory(
          id: 1,
          assetId: 1,
          exDividendDate: DateTime(2023, 07, 01),
          paymentDate: DateTime(2023, 07, 15),
          dividendAmount: 10.0,
          totalDividendAmount: 100.0,
          quantity: 10.0,
          currency: Currency.brl)
    ]);

final json = {
  'id': 1,
  'ticker': 'XPML11',
  'currency': 'brl',
  'type': 'fiis',
  'currentPrice': 150.50,
  'lastUpdate': '2021-07-01T00:00:00.000',
  'transactionsHistory': [
    {
      'id': 1,
      'assetId': 1,
      'type': 'buy',
      'date': '2023-06-20T00:00:00.000',
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
      'date': '2023-06-20T00:00:00.000',
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
      'exDividendDate': '2023-07-01T00:00:00.000',
      'paymentDate': '2023-07-15T00:00:00.000',
      'dividendAmount': 10.0,
      'totalDividendAmount': 100.0,
      'quantity': 10.0,
      'currency': 'brl'
    }
  ]
};
final invalidJson = {
  'id': '1',
  'ticker': 'XPML11',
  'currency': 'brl',
  'type': 'fiis',
  'currentPrice': 150.50,
  'transactionsHistory': [],
  'dividendHistory': []
};
final invalidTypeJson = {
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
      'date': '2023-06-20T00:00:00.000',
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
      'date': '2023-06-20T00:00:00.000',
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
      'exDividendDate': '2023-07-01T00:00:00.000',
      'paymentDate': '2023-07-15T00:00:00.000',
      'dividendAmount': 10.0,
      'totalDividendAmount': 100.0,
      'quantity': 10.0,
      'currency': 'brl'
    }
  ],
  'lastUpdate': '2021-07-01T00:00:00.000',
};

final userAssetFiagro = UserAssetModel(
    id: 1,
    ticker: 'XPML11',
    currency: Currency.brl,
    type: AssetType.fiagro,
    currentPrice: 150.50,
    lastUpdate: DateTime(2021, 07, 01),
    transactionsHistory: [
      AssetTransaction(
          id: 1,
          assetId: 1,
          type: TransactionType.buy,
          transactionDate: DateTime(2023, 06, 20),
          quantity: 10.0,
          price: 145.75,
          brokerage: 5.0,
          total: 1457.5,
          totalWithBrokerage: 1462.5,
          currency: Currency.brl),
      AssetTransaction(
          id: 2,
          assetId: 1,
          type: TransactionType.sell,
          transactionDate: DateTime(2023, 06, 20),
          quantity: 10.0,
          price: 145.75,
          brokerage: 5.0,
          total: 1457.5,
          totalWithBrokerage: 1462.5,
          currency: Currency.brl),
    ],
    dividendHistory: [
      AssetDividendHistory(
          id: 1,
          assetId: 1,
          exDividendDate: DateTime(2023, 07, 01),
          paymentDate: DateTime(2023, 07, 15),
          dividendAmount: 10.0,
          totalDividendAmount: 100.0,
          quantity: 10.0,
          currency: Currency.brl)
    ]);
