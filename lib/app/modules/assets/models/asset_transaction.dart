import 'package:equatable/equatable.dart';
import 'package:up_invest_front/app/modules/assets/util/convert_asset_helper.dart';
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
    switch (json) {
      case {
          'id': int id,
          'assetId': int assetId,
          'type': String type,
          'date': String date,
          'quantity': double quantity,
          'price': double price,
          'brokerage': double brokerage,
          'total': double total,
          'totalWithBrokerage': double totalWithBrokerage,
          'currency': String currency
        }:
        return AssetTransaction(
          id: id,
          assetId: assetId,
          type: _stringToType(type),
          date: DateTime.parse(date),
          quantity: quantity,
          price: price,
          brokerage: brokerage,
          total: total,
          totalWithBrokerage: totalWithBrokerage,
          currency: stringToCurrency(currency),
        );
      default:
        throw Exception('invalid-json');
    }
  }

  static TransationType _stringToType(String value) {
    if (value == 'buy') {
      return TransationType.buy;
    }
    if (value == 'sell') {
      return TransationType.sell;
    }
    if (value == 'amortization') {
      return TransationType.amortization;
    }
    throw Exception('invalid-transaction-type');
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
