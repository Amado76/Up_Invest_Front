import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/adapter/http/http_client_adapter.dart';
import 'package:up_invest_front/app/modules/financial_assets/repository/asset_model_repository.dart';
import 'package:up_invest_front/app/modules/financial_assets/repository/user_asset_repository.dart';

import 'repository/currency_exchange_repository.dart';

class FinancialAssetsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<IAssetRepository>(
        (i) => AssetRepository(httpClientAdapter: i.get<DioAdapter>()),
        export: true),
    Bind.lazySingleton<IUserAssetRepository>(
        (i) => UserAssetRepository(httpClientAdapter: i.get<DioAdapter>()),
        export: true),
    Bind.lazySingleton<ICurrencyExchangeRepository>(
        (i) =>
            CurrencyExchangeRepository(httpClientAdapter: i.get<DioAdapter>()),
        export: true),
  ];

  @override
  final List<ModularRoute> routes = [];
}
