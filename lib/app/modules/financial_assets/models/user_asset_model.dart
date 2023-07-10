import 'package:equatable/equatable.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/asset_category_model.dart';
import 'package:up_invest_front/app/modules/financial_assets/util/convert_asset_helper.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart'
    show Currency;

class UserAssetModel extends Equatable {
  const UserAssetModel({
    required this.id,
    required this.ticker,
    required this.currency,
    required this.currentPrice,
    required this.category,
  });

  final int id;
  final String ticker;
  final Currency currency;
  final AssetCategoryModel category;
  final double currentPrice;

  factory UserAssetModel.fromJson(Map<String, dynamic> json) {
    switch (json) {
      case {
          'id': int id,
          'ticker': String ticker,
          'currency': String currency,
          'currentPrice': double currentPrice,
          'category': Map<String, dynamic> category,
        }:
        return UserAssetModel(
          id: id,
          ticker: ticker,
          currency: stringToCurrency(currency),
          currentPrice: currentPrice,
          category: AssetCategoryModel.fromJson(category),
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
    AssetCategoryModel? category,
    double? currentPrice,
  }) {
    return UserAssetModel(
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
