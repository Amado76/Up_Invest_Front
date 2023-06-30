import 'package:equatable/equatable.dart';
import 'package:up_invest_front/app/modules/assets/models/asset_dividend_history.dart';
import 'package:up_invest_front/app/modules/assets/models/asset_transaction.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart'
    show Currency;

enum AssetType { usaStock, brStock, fiis, fiagro }

class AssetModel extends Equatable {
  const AssetModel({
    required this.id,
    required this.ticker,
    required this.currency,
    required this.type,
    required this.currentPrice,
    required this.transactionsHistory,
    required this.dividendHistory,
  });

  final int id;
  final String ticker;
  final Currency currency;
  final AssetType type;
  final double currentPrice;
  final List<AssetTransaction> transactionsHistory;
  final List<AssetDividendHistory> dividendHistory;

  factory AssetModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> transactionsHistoryJson =
        json['transactionsHistory'] as List<dynamic>;
    final List<dynamic> dividendHistoryJson =
        json['dividendHistory'] as List<dynamic>;
    List<AssetTransaction> transactionsHistory = transactionsHistoryJson
        .map((dynamic json) => AssetTransaction.fromJson(json))
        .toList();
    List<AssetDividendHistory> dividendHistory = dividendHistoryJson
        .map((dynamic json) => AssetDividendHistory.fromJson(json))
        .toList();

    return AssetModel(
      id: json['id'],
      ticker: json['ticker'],
      currency: json['currency'],
      type: json['type'],
      currentPrice: json['currentPrice'],
      transactionsHistory: transactionsHistory,
      dividendHistory: dividendHistory,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ticker': ticker,
      'currency': currency,
      'type': type,
      'currentPrice': currentPrice,
      'transactionsHistory': transactionsHistory,
      'dividendHistory': dividendHistory,
    };
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
      ];
}
