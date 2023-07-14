import 'package:equatable/equatable.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/financial_asset_category_model.dart';
import 'package:up_invest_front/app/modules/financial_assets/util/convert_asset_helper.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart'
    show Currency;

class FinancialUserAssetModel extends Equatable {
  const FinancialUserAssetModel({
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

  factory FinancialUserAssetModel.fromJson(Map<String, dynamic> json) {
    switch (json) {
      case {
          'id': int id,
          'ticker': String ticker,
          'currency': String currency,
          'currentPrice': double currentPrice,
          'category': Map<String, dynamic> category,
        }:
        return FinancialUserAssetModel(
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ticker': ticker,
      'currency': currencyToString(currency),
      'category': category.toJson(),
      'currentPrice': currentPrice,
    };
  }

  copyWith({
    int? id,
    String? ticker,
    Currency? currency,
    FinancialAssetCategoryModel? category,
    double? currentPrice,
  }) {
    return FinancialUserAssetModel(
      id: id ?? this.id,
      ticker: ticker ?? this.ticker,
      currency: currency ?? this.currency,
      category: category ?? this.category,
      currentPrice: currentPrice ?? this.currentPrice,
    );
  }

  @override
  List<Object?> get props => [id, ticker, currency, category, currentPrice];
}
