import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/asset_dividend_history.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';

import '../../../../mocks/assets/assets_mock.dart';

void main() {
  const id = 1;
  const currency = Currency.brl;
  const int assetId = 1;
  final DateTime date = DateTime.now();
  const double quantity = 1.0;
  const double dividendAmount = 1.0;
  const double totalDividendAmount = 1.0;

  group('[AssetModel]', () {
    test('supports value comparisons', () {
      expect(
          AssetDividendHistory(
            id: id,
            assetId: assetId,
            exDividendDate: date,
            paymentDate: date,
            quantity: quantity,
            dividendAmount: dividendAmount,
            totalDividendAmount: totalDividendAmount,
            currency: currency,
          ),
          AssetDividendHistory(
            id: id,
            assetId: assetId,
            exDividendDate: date,
            paymentDate: date,
            quantity: quantity,
            dividendAmount: dividendAmount,
            totalDividendAmount: totalDividendAmount,
            currency: currency,
          ));
    });

    group('[fromJson]', () {
      test('should return a valid model when the JSON has a valid data', () {
        //arrange
        final AssetDividendHistory xpmlDividendHistoryMock =
            XpmlDividendHistoryMock();
        //act
        final result = AssetDividendHistory.fromJson(json);
        //assert
        expect(
          result.id,
          xpmlDividendHistoryMock.id,
        );
        expect(result.assetId, xpmlDividendHistoryMock.assetId);
        expect(result.currency, xpmlDividendHistoryMock.currency);
        expect(result.exDividendDate, xpmlDividendHistoryMock.exDividendDate);
        expect(result.paymentDate, xpmlDividendHistoryMock.paymentDate);
        expect(result.quantity, xpmlDividendHistoryMock.quantity);
        expect(result.dividendAmount, xpmlDividendHistoryMock.dividendAmount);
        expect(result.totalDividendAmount,
            xpmlDividendHistoryMock.totalDividendAmount);
      });
      test('should thrown a error when JSON has a invalid data', () {
        expect(
            () => AssetDividendHistory.fromJson(invalidJson), throwsException);
      });
    });

    group('[toJson]', () {
      test('should return a JSON map containing the proper data', () {
        //arrange
        final AssetDividendHistory xpmlDividendHistory = AssetDividendHistory(
            id: 1,
            assetId: 1,
            exDividendDate: DateTime(2023, 07, 1),
            paymentDate: DateTime(2023, 07, 15),
            dividendAmount: 10.0,
            totalDividendAmount: 100.0,
            quantity: 10.0,
            currency: Currency.brl);
        //act
        final result = xpmlDividendHistory.toJson();
        //assert
        expect(result, json);
      });
    });
  });
}

final json = {
  'id': 1,
  'assetId': 1,
  'exDividendDate': '2023-07-01T00:00:00.000',
  'paymentDate': '2023-07-15T00:00:00.000',
  'dividendAmount': 10.0,
  'totalDividendAmount': 100.0,
  'quantity': 10.0,
  'currency': 'brl'
};

final invalidJson = {
  'id': 1,
  'assetId': 1,
  'exDividendDate': '2023-07-01',
  'paymentDate': '2023-07-15',
  'dividendAmount': 10.0,
  'totalDividendAmount': 100.0,
  'quantity': 10,
  'currency': 'brl'
};
