import 'package:equatable/equatable.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart'
    show Currency;

class AssetDividendHistory extends Equatable {
  const AssetDividendHistory({
    required this.id,
    required this.assetId,
    required this.exDividendDate,
    required this.paymentDate,
    required this.dividendAmount,
    required this.totalDividendAmount,
    required this.quantity,
    required this.currency,
  });

  final int id;
  final int assetId;
  final DateTime exDividendDate;
  final DateTime paymentDate;
  final double dividendAmount;
  final double totalDividendAmount;
  final double quantity;
  final Currency currency;

  factory AssetDividendHistory.fromJson(Map<String, dynamic> json) {
    return AssetDividendHistory(
      id: json['id'],
      assetId: json['assetId'],
      exDividendDate: DateTime.parse(json['exDividendDate']),
      paymentDate: DateTime.parse(json['paymentDate']),
      dividendAmount: json['dividendAmount'],
      totalDividendAmount: json['totalDividendAmount'],
      quantity: json['quantity'],
      currency: json['currency'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        assetId,
        exDividendDate,
        paymentDate,
        dividendAmount,
        totalDividendAmount,
        quantity,
        currency,
      ];
}
