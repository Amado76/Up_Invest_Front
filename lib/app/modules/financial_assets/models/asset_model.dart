import 'package:equatable/equatable.dart';
import 'package:up_invest_front/app/modules/financial_assets/util/convert_asset_helper.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';

class AssetModel extends Equatable {
  const AssetModel({
    required this.id,
    required this.currency,
    required this.currentPrice,
  });

  final int id;

  final Currency currency;

  final double currentPrice;

  factory AssetModel.fromJson(Map<String, dynamic> json) {
    switch (json) {
      case {
          'id': int id,
          'currency': String currency,
          'currentPrice': double currentPrice,
        }:
        return AssetModel(
          id: id,
          currency: stringToCurrency(currency),
          currentPrice: currentPrice,
        );
      default:
        throw Exception('invalid-json');
    }
  }

  toJson() {
    return {
      'id': id,
      'currency': currencyToString(currency),
      'currentPrice': currentPrice,
    };
  }

  @override
  List<Object?> get props => [id, currency, currentPrice];
}
