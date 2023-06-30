// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/assets/models/asset_model.dart';
import 'package:up_invest_front/app/modules/assets/models/asset_transaction.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';
import 'package:up_invest_front/app/modules/user/user_model.dart';

void main() {
  group('[UserModel]', () {
    test('supports value comparisons', () {
      expect(UserModel(id: 1, assets: const []),
          UserModel(id: 1, assets: const []));
    });

    group('[fromJson]', () {
      setUp(() {
        final AssetModel xpml11 = AssetModel(
            id: 1,
            ticker: 'XPML11',
            currency: Currency.brl,
            type: AssetType.fiis,
            currentPrice: 150.50,
            transactionsHistory: [
              AssetTransaction(
                  id: 1,
                  assetId: 1,
                  type: TransationType.buy,
                  date: DateTime(2023, 06, 20),
                  quantity: 10,
                  price: 145.75,
                  brokerage: 5.0,
                  total: 1457.5,
                  totalWithBrokerage: 1462.5,
                  currency: Currency.brl),
              AssetTransaction(
                  id: 2,
                  assetId: 1,
                  type: TransationType.sell,
                  date: DateTime(2023, 06, 20),
                  quantity: 10,
                  price: 145.75,
                  brokerage: 5.0,
                  total: 1457.5,
                  totalWithBrokerage: 1462.5,
                  currency: Currency.brl)
            ],
            dividendHistory: const []);
      });
    });
  });
}

Map<String, dynamic> json = {
  'id': 1,
  'name': 'John Knox',
  'email': 'john@example.com',
  'assets': [
    {
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
          'quantity': 10,
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
          'quantity': 10,
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
          'quantity': 10,
          'currency': 'brl'
        }
      ]
    },
    {
      'id': 2,
      'ticker': 'PETR4',
      'currency': 'BRL',
      'type': 'brStock',
      'currentPrice': 28.50,
      'dividendExDate': '2023-07-05',
      'dividendPaymentDate': '2023-07-20',
      'transactionsHistory': [
        {
          'id': 3,
          'type': 'buy',
          'date': '2023-06-22',
          'quantity': 100,
          'price': 28.25,
          'brokerage': 10.0,
          'total': 2825.0,
          'totalWithBrokerage': 2835.0,
          'currency': 'BRL'
        }
      ],
      'dividendHistory': []
    }
  ]
};
