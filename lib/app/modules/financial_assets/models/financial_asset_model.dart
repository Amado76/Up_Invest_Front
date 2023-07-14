import 'package:equatable/equatable.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/financial_asset_category_model.dart';
import 'package:up_invest_front/app/modules/financial_assets/util/convert_asset_helper.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';

class FinancialAssetModel extends Equatable {
  const FinancialAssetModel({
    required this.id,
    required this.ticker,
    required this.currency,
    required this.currentPrice,
    required this.category,
  });

  final int id;
  final String ticker;
  final Currency currency;
  final FinancialAssetCategoryModel category;
  final double currentPrice;

  factory FinancialAssetModel.fromJson(Map<String, dynamic> json) {
    switch (json) {
      case {
          'id': int id,
          'currency': String currency,
          'currentPrice': double currentPrice,
          'ticker': String ticker,
          'category': Map<String, dynamic> category,
        }:
        return FinancialAssetModel(
          id: id,
          ticker: ticker,
          currency: stringToCurrency(currency),
          currentPrice: currentPrice,
          category: FinancialAssetCategoryModel.fromJson(category),
        );
      default:
        throw Exception('invalid-json');
    }
  }

  toJson() {
    return {
      'id': id,
      'ticker': ticker,
      'currency': currencyToString(currency),
      'category': category.toJson(),
      'currentPrice': currentPrice,
    };
  }

  @override
  List<Object?> get props => [id, currency, currentPrice, ticker, category];
}
