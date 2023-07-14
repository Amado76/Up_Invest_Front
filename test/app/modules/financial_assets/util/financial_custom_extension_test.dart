import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/financial_asset_dividend_history.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';
import 'package:up_invest_front/app/modules/financial_assets/util/financial_custom_extension.dart';

void main() {
  group('SortedByDate', () {
    test('should return [financialOrderedListOnlyOneAsset]', () {
      final List<FinancialAssetDividendHistory> result =
          financialUnorderedListOnlyOneAsset.sortedByDate();
      expect(result, financialOrderedListOnlyOneAsset);
    });
  });
  group('SortedByAsset', () {
    test('should return [financialOrderedList]', () {
      final List<FinancialAssetDividendHistory> result =
          financialUnorderedList.sortedByAsset();
      expect(result, financialOrderedList);
    });
  });
}

List<FinancialAssetDividendHistory> financialUnorderedListOnlyOneAsset = [
  assetOneDividendHistoryThree,
  assetOneDividendHistoryTwo,
  assetOneDividendHistoryOne
];

List<FinancialAssetDividendHistory> financialOrderedListOnlyOneAsset = [
  assetOneDividendHistoryOne,
  assetOneDividendHistoryTwo,
  assetOneDividendHistoryThree
];
List<FinancialAssetDividendHistory> financialUnorderedList = [
  assetTwoDividendHistoryOne,
  assetTwoDividendHistoryTwo,
  assetTwoDividendHistoryThree,
  assetOneDividendHistoryOne,
  assetOneDividendHistoryTwo,
  assetOneDividendHistoryThree,
];

List<FinancialAssetDividendHistory> financialOrderedList = [
  assetOneDividendHistoryOne,
  assetOneDividendHistoryTwo,
  assetOneDividendHistoryThree,
  assetTwoDividendHistoryOne,
  assetTwoDividendHistoryTwo,
  assetTwoDividendHistoryThree
];

FinancialAssetDividendHistory assetOneDividendHistoryOne =
    FinancialAssetDividendHistory(
        id: 1,
        assetId: 1,
        exDividendDate: DateTime.parse('2021-01-01'),
        paymentDate: DateTime.parse('2021-01-01'),
        dividendAmount: 1.0,
        totalDividendAmount: 1.0,
        quantity: 1,
        currency: Currency.brl);

FinancialAssetDividendHistory assetOneDividendHistoryTwo =
    FinancialAssetDividendHistory(
        id: 2,
        assetId: 1,
        exDividendDate: DateTime.parse('2021-01-01'),
        paymentDate: DateTime.parse('2022-01-01'),
        dividendAmount: 1.0,
        totalDividendAmount: 1.0,
        quantity: 1,
        currency: Currency.brl);

FinancialAssetDividendHistory assetOneDividendHistoryThree =
    FinancialAssetDividendHistory(
        id: 3,
        assetId: 1,
        exDividendDate: DateTime.parse('2021-01-01'),
        paymentDate: DateTime.parse('2022-04-01'),
        dividendAmount: 1.0,
        totalDividendAmount: 1.0,
        quantity: 1,
        currency: Currency.brl);

FinancialAssetDividendHistory assetTwoDividendHistoryOne =
    FinancialAssetDividendHistory(
        id: 1,
        assetId: 2,
        exDividendDate: DateTime.parse('2021-01-01'),
        paymentDate: DateTime.parse('2021-01-01'),
        dividendAmount: 1.0,
        totalDividendAmount: 1.0,
        quantity: 1,
        currency: Currency.brl);

FinancialAssetDividendHistory assetTwoDividendHistoryTwo =
    FinancialAssetDividendHistory(
        id: 2,
        assetId: 2,
        exDividendDate: DateTime.parse('2021-01-01'),
        paymentDate: DateTime.parse('2022-01-01'),
        dividendAmount: 1.0,
        totalDividendAmount: 1.0,
        quantity: 1,
        currency: Currency.brl);

FinancialAssetDividendHistory assetTwoDividendHistoryThree =
    FinancialAssetDividendHistory(
        id: 3,
        assetId: 2,
        exDividendDate: DateTime.parse('2021-01-01'),
        paymentDate: DateTime.parse('2022-04-01'),
        dividendAmount: 1.0,
        totalDividendAmount: 1.0,
        quantity: 1,
        currency: Currency.brl);
