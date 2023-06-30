import 'package:equatable/equatable.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart'
    show Currency;

enum TransationType { buy, sell, amortization }

class AssetTransaction extends Equatable {
  const AssetTransaction({
    required this.id,
    required this.assetId,
    required this.type,
    required this.date,
    required this.quantity,
    required this.price,
    required this.brokerage,
    required this.total,
    required this.totalWithBrokerage,
    required this.currency,
  });

  final int id;
  final int assetId;
  final TransationType type;
  final DateTime date;
  final double quantity;
  final double price;
  final double brokerage;
  final double total;
  final double totalWithBrokerage;
  final Currency currency;

  factory AssetTransaction.fromJson(Map<String, dynamic> json) {
    return AssetTransaction(
      id: json['id'],
      assetId: json['assetId'],
      type: json['type'],
      date: DateTime.parse(json['date']),
      quantity: json['quantity'],
      price: json['price'],
      brokerage: json['brokerage'],
      total: json['total'],
      totalWithBrokerage: json['totalWithBrokerage'],
      currency: json['currency'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        assetId,
        type,
        date,
        quantity,
        price,
        brokerage,
        total,
        totalWithBrokerage,
        currency,
      ];
}
