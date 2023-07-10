class UrlsPaths {
  static String userAssetsUrlPath =
      'http://127.0.0.1:3000/mockServer/get_user_assets.json';

  String getSpecificAssetDividendHistoryPath({required int assetId}) {
    return 'http://127.0.0.1:3000/mockServer/user_assets/$assetId/asset_dividend_history.json';
  }

  String getSpecificAssetTransactionHistoryPath({required int assetId}) {
    return 'http://127.0.0.1:3000/mockServer/user_assets/$assetId/asset_transaction_history.json';
  }
}
