import 'package:equatable/equatable.dart';
import 'package:up_invest_front/app/modules/assets/models/asset_dividend_history.dart';
import 'package:up_invest_front/app/modules/assets/models/asset_transaction.dart';
import 'package:up_invest_front/app/modules/assets/util/convert_asset_helper.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart'
    show Currency;

enum AssetType { usaStock, brStock, fiis, fiagro }

class UserAssetModel extends Equatable {
  const UserAssetModel({
    required this.id,
    required this.ticker,
    required this.currency,
    required this.type,
    required this.currentPrice,
    required this.transactionsHistory,
    required this.dividendHistory,
    this.lastUpdate,
  });

  final int id;
  final String ticker;
  final Currency currency;
  final AssetType type;
  final double currentPrice;
  final List<AssetTransaction> transactionsHistory;
  final List<AssetDividendHistory> dividendHistory;
  final DateTime? lastUpdate;

  factory UserAssetModel.fromJson(Map<String, dynamic> json) {
    switch (json) {
      case {
          'id': int id,
          'ticker': String ticker,
          'currency': String currency,
          'type': String type,
          'currentPrice': double currentPrice,
          'transactionsHistory': List<dynamic> transactionsHistory,
          'dividendHistory': List<dynamic> dividendHistory,
        }:
        return UserAssetModel(
          id: id,
          ticker: ticker,
          currency: stringToCurrency(currency),
          type: _stringToAssetType(type),
          currentPrice: currentPrice,
          transactionsHistory: transactionsHistory
              .map((dynamic json) => AssetTransaction.fromJson(json))
              .toList(),
          dividendHistory: dividendHistory
              .map((dynamic json) => AssetDividendHistory.fromJson(json))
              .toList(),
        );
      default:
        throw Exception('invalid-json');
    }
  }

  static _stringToAssetType(String value) {
    value = value.toLowerCase().trim();
    if (value == 'usastock') {
      return AssetType.usaStock;
    }
    if (value == 'brstock') {
      return AssetType.brStock;
    }
    if (value == 'fiis') {
      return AssetType.fiis;
    }
    if (value == 'fiagro') {
      return AssetType.fiagro;
    }
    throw Exception('invalid-asset-type');
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'ticker': ticker,
  //     'currency': currency,
  //     'type': type,
  //     'currentPrice': currentPrice,
  //     'transactionsHistory': transactionsHistory,
  //     'dividendHistory': dividendHistory,
  //   };
  // }

  copyWith({
    int? id,
    String? ticker,
    Currency? currency,
    AssetType? type,
    double? currentPrice,
    List<AssetTransaction>? transactionsHistory,
    List<AssetDividendHistory>? dividendHistory,
  }) {
    return UserAssetModel(
      id: id ?? this.id,
      ticker: ticker ?? this.ticker,
      currency: currency ?? this.currency,
      type: type ?? this.type,
      currentPrice: currentPrice ?? this.currentPrice,
      transactionsHistory: transactionsHistory ?? this.transactionsHistory,
      dividendHistory: dividendHistory ?? this.dividendHistory,
    );
  }

  @override
  List<Object?> get props => [
        id,
        ticker,
        currency,
        type,
        currentPrice,
        transactionsHistory,
        dividendHistory,
        lastUpdate
      ];
}
