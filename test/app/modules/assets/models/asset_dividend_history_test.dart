import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/assets/models/asset_dividend_history.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';

void main() {
  const id = 1;
  const ticker = 'ticker';
  const currency = Currency.brl;
  const currentPrice = 1.0;
  final dividendExDate = DateTime.now();
  final dividendPaymentDate = DateTime.now();
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
  });
}
