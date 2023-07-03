import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/assets/models/asset_dividend_history.dart';
import 'package:up_invest_front/app/modules/assets/models/asset_transaction.dart';
import 'package:up_invest_front/app/modules/assets/models/user_asset_model.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';

class XpmlUserAssetModelMock extends Mock implements UserAssetModel {
  @override
  final id = 1;
  @override
  final ticker = 'XPML11';
  @override
  final currency = Currency.brl;
  @override
  final type = AssetType.fiis;
  @override
  final currentPrice = 150.50;
  @override
  final transactionsHistory = [
    XpmlBuyTransactionMock(),
    XpmlSellTransactionMock(),
  ];
  @override
  final dividendHistory = [XpmlDividendHistoryMock()];
}

class XpmlBuyTransactionMock extends Mock implements AssetTransaction {
  @override
  final id = 1;
  @override
  final assetId = 1;
  @override
  final type = TransationType.buy;
  @override
  final date = DateTime(2023, 06, 20);
  @override
  final quantity = 10;
  @override
  final price = 145.75;
  @override
  final brokerage = 5.0;
  @override
  final total = 1457.5;
  @override
  final totalWithBrokerage = 1462.5;
  @override
  final currency = Currency.brl;
}

class XpmlSellTransactionMock extends Mock implements AssetTransaction {
  @override
  final id = 2;
  @override
  final assetId = 1;
  @override
  final type = TransationType.sell;
  @override
  final date = DateTime(2023, 06, 20);
  @override
  final quantity = 10;
  @override
  final price = 145.75;
  @override
  final brokerage = 5.0;
  @override
  final total = 1457.5;
  @override
  final totalWithBrokerage = 1462.5;
  @override
  final currency = Currency.brl;
}

class XpmlDividendHistoryMock extends Mock implements AssetDividendHistory {
  @override
  int get id => 1;
  @override
  int get assetId => 1;
  @override
  DateTime get exDividendDate => DateTime(2023, 07, 01);
  @override
  DateTime get paymentDate => DateTime(2023, 07, 15);
  @override
  double get dividendAmount => 10.0;
  @override
  double get totalDividendAmount => 100.0;
  @override
  double get quantity => 10;
  @override
  Currency get currency => Currency.brl;
}

class PetrUserAssetModelMock extends Mock implements UserAssetModel {
  @override
  final id = 2;
  @override
  final ticker = 'PETR4';
  @override
  final currency = Currency.brl;
  @override
  final type = AssetType.brStock;
  @override
  final currentPrice = 28.50;
  @override
  final transactionsHistory = [
    PetrBuyTransactionMock(),
  ];
  @override
  final dividendHistory = [];
}

class PetrBuyTransactionMock extends Mock implements AssetTransaction {
  @override
  final id = 3;
  @override
  final assetId = 2;
  @override
  final type = TransationType.buy;
  @override
  final date = DateTime(2023, 06, 22);
  @override
  final quantity = 100;
  @override
  final price = 28.25;
  @override
  final brokerage = 10.0;
  @override
  final total = 2825.0;
  @override
  final totalWithBrokerage = 2835.0;
  @override
  final currency = Currency.brl;
}
