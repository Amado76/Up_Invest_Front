import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/assets/models/asset_transaction.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart'
    show Currency;

void main() {
  const int id = 1;
  const int assetId = 1;
  final DateTime date = DateTime.now();
  const double quantity = 1.0;
  const double price = 1.0;
  const double brokerage = 1.0;
  const double total = 1.0;
  const double totalWithBrokerage = 1.0;

  const currency = Currency.brl;
  const type = TransationType.buy;

  group('[AssetModel]', () {
    test('supports value comparisons', () {
      expect(
        AssetTransaction(
          id: id,
          currency: currency,
          type: type,
          date: date,
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
          date: date,
          assetId: assetId,
          quantity: quantity,
          price: price,
          brokerage: brokerage,
          total: total,
          totalWithBrokerage: totalWithBrokerage,
        ),
      );
    });
  });
}
