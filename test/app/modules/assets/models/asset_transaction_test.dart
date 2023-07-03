import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/assets/models/asset_transaction.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart'
    show Currency;

import '../../../../mocks/assets/assets_mock.dart';

void main() {
  const int id = 1;
  const int assetId = 1;
  final DateTime date = DateTime(2023, 06, 20);
  const double quantity = 1.0;
  const double price = 1.0;
  const double brokerage = 1.0;
  const double total = 1.0;
  const double totalWithBrokerage = 1.0;

  const currency = Currency.brl;
  const type = TransactionType.buy;

  group('[AssetModel]', () {
    test('supports value comparisons', () {
      expect(
        AssetTransaction(
          id: id,
          currency: currency,
          type: type,
          transactionDate: date,
          assetId: assetId,
          quantity: quantity,
          price: price,
          brokerage: brokerage,
          total: total,
          totalWithBrokerage: totalWithBrokerage,
        ),
        AssetTransaction(
          id: id,
          currency: currency,
          type: type,
          transactionDate: date,
          assetId: assetId,
          quantity: quantity,
          price: price,
          brokerage: brokerage,
          total: total,
          totalWithBrokerage: totalWithBrokerage,
        ),
      );
    });

    group('[fromJson]', () {
      final XpmlBuyTransactionMock xpmlBuyTransactionMock =
          XpmlBuyTransactionMock();

      test('should return a valid model when the JSON has a valid data', () {
        //act
        final result = AssetTransaction.fromJson(json);
        //assert
        expect(result.id, xpmlBuyTransactionMock.id);
        expect(result.assetId, xpmlBuyTransactionMock.assetId);
        expect(result.type, xpmlBuyTransactionMock.type);
        expect(result.transactionDate, xpmlBuyTransactionMock.transactionDate);
        expect(result.quantity, xpmlBuyTransactionMock.quantity);
        expect(result.price, xpmlBuyTransactionMock.price);
        expect(result.brokerage, xpmlBuyTransactionMock.brokerage);
        expect(result.total, xpmlBuyTransactionMock.total);
        expect(result.totalWithBrokerage,
            xpmlBuyTransactionMock.totalWithBrokerage);
        expect(result.currency, xpmlBuyTransactionMock.currency);
      });
      test(
          'should return a valid model when the JSON has a valid data (amortization)',
          () {
        //act
        final result = AssetTransaction.fromJson(json2);
        //assert
        expect(result.type, TransactionType.amortization);
      });
      test('should throw a Exception when the JSON has a invalid data', () {
        //assert
        expect(() => AssetTransaction.fromJson(json3), throwsException);
      });
      test(
          'should throw a Exception when the JSON has a invalid transactionData',
          () {
        //assert
        expect(() => AssetTransaction.fromJson(json4), throwsException);
      });
    });

    group('[toJson]', () {
      test('should return a JSON map containing the proper data', () {
        //act
        final result = AssetTransaction(
          id: 1,
          currency: currency,
          type: type,
          transactionDate: date,
          assetId: 1,
          quantity: 10.0,
          price: 145.75,
          brokerage: 5.0,
          total: 1457.5,
          totalWithBrokerage: 1462.5,
        ).toJson();
        //assert
        expect(result, json);
      });
    });
  });
}

final json = {
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
};

final json2 = {
  'id': 1,
  'assetId': 1,
  'type': 'amortization',
  'date': '2023-06-20',
  'quantity': 10.0,
  'price': 145.75,
  'brokerage': 5.0,
  'total': 1457.5,
  'totalWithBrokerage': 1462.5,
  'currency': 'brl'
};

final json3 = {
  'id': '1',
  'assetId': 1,
  'type': 'buy',
  'date': '2023-06-20',
  'quantity': 10.0,
  'price': 145.75,
  'brokerage': 5.0,
  'total': 1457.5,
  'totalWithBrokerage': 1462.5,
  'currency': 'brl'
};

final json4 = {
  'id': 1,
  'assetId': 1,
  'type': '2321312',
  'date': '2023-06-20',
  'quantity': 10.0,
  'price': 145.75,
  'brokerage': 5.0,
  'total': 1457.5,
  'totalWithBrokerage': 1462.5,
  'currency': 'brl'
};
