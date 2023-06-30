import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/assets/models/asset_dividend_history.dart';
import 'package:up_invest_front/app/modules/assets/models/asset_model.dart';
import 'package:up_invest_front/app/modules/assets/models/asset_transaction.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';

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
        const AssetModel(
            id: id,
            ticker: ticker,
            currency: currency,
            type: type,
            currentPrice: currentPrice,
            transactionsHistory: transactionsHistory,
            dividendHistory: dividendHistory),
        const AssetModel(
            id: id,
            ticker: ticker,
            currency: currency,
            type: type,
            currentPrice: currentPrice,
            transactionsHistory: transactionsHistory,
            dividendHistory: dividendHistory),
      );
    });
  });
}
