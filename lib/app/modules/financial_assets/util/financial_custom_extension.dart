import 'package:up_invest_front/app/modules/financial_assets/models/financial_asset_dividend_history.dart';

extension SortedByAsset on List<FinancialAssetDividendHistory> {
  List<FinancialAssetDividendHistory> sortedByAsset() {
    final sortedList = this;
    sortedList.sort((a, b) => a.assetId.compareTo(b.assetId));
    return sortedList;
  }
}

extension SortedByDate on List<FinancialAssetDividendHistory> {
  List<FinancialAssetDividendHistory> sortedByDate() {
    final sortedList = this;
    sortedList.sort((a, b) => a.paymentDate.compareTo(b.paymentDate));
    return sortedList;
  }
}
