import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/core/urls.dart';

void main() {
  test('[getSpecificAssetDividendHistoryPath]', () {
    expect(UrlsPaths.getSpecificAssetDividendHistoryPath(assetId: 1),
        'http://127.0.0.1:3000/mockServer/user_assets/1/asset_dividend_history.json');
  });
  test('[getSpecificAssetTransactionHistoryPath]', () {
    expect(UrlsPaths.getSpecificAssetTransactionHistoryPath(assetId: 1),
        'http://127.0.0.1:3000/mockServer/user_assets/1/asset_transaction_history.json');
  });
}
