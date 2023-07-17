class UrlsPaths {
  static String baseUserAssetsUrl =
      'http://127.0.0.1:3000/mockServer/user_assets';
  static String baseFinancialAssetUrl =
      'http://127.0.0.1:3000/mockServer/financial_assets';

  static String dividendHistoryEndPoint = '/assets_dividend_history.json';
  static String transactionHistoryEndPoint = '/assets_transaction_history.json';

  static String getSpecificAssetDividendHistoryPath({required int assetId}) {
    return 'http://127.0.0.1:3000/mockServer/user_assets/$assetId/asset_dividend_history.json';
  }

  static String getSpecificAssetTransactionHistoryPath({required int assetId}) {
    return 'http://127.0.0.1:3000/mockServer/user_assets/$assetId/asset_transaction_history.json';
  }
}
