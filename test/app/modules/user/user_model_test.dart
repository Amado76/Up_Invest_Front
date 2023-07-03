// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/assets/models/user_asset_model.dart';
import 'package:up_invest_front/app/modules/user/user_model.dart';

import '../../../mocks/assets/assets_mock.dart';

void main() {
  late UserModel user;
  group('[UserModel]', () {
    test('supports value comparisons', () {
      expect(UserModel(id: 1, assets: const []),
          UserModel(id: 1, assets: const []));
    });

    group('[fromJson]', () {
      setUp(() {
        final UserAssetModel xpml11 = XpmlUserAssetModelMock();
        final UserAssetModel petr4 = PetrUserAssetModelMock();
        user = UserModel(id: 1, assets: [xpml11, petr4]);
      });

      test('should return a valid model when the JSON has a valid data', () {
        //Act
        final UserModel result = UserModel.fromJson(json);
        //Expect
        expect(result.id, user.id);
        expect(result.assets[0].id, user.assets[0].id);
        expect(result.assets[1].id, user.assets[1].id);
        expect(result.assets[0].ticker, user.assets[0].ticker);
        expect(result.assets[1].transactionsHistory[0].id,
            user.assets[1].transactionsHistory[0].id);
      });
      test('should throw a Exception when the JSON has a invalid data', () {
        expect(() => UserModel.fromJson(json2), throwsException);
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
          'assetId': 2,
          'type': 'buy',
          'date': '2023-06-22',
          'quantity': 100.0,
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

Map<String, dynamic> json2 = {
  'id': '2',
  'name': 'John Knox',
  'email': 'john@example.com',
  'assets': [
    {
      'id': 1,
      'ticker': 'XPML11',
      'currency': 'brl',
      'type': 'fiis',
      'currentPrice': 150.50,
      'transactionsHistory': [],
      'dividendHistory': []
    }
  ]
};
