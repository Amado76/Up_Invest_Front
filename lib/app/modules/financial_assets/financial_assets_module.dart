import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/adapter/http/http_client_adapter.dart';

import 'repository/currency_exchange_repository.dart';

class FinancialAssetsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<ICurrencyExchangeRepository>(
        (i) =>
            CurrencyExchangeRepository(httpClientAdapter: i.get<DioAdapter>()),
        export: true),
  ];

  @override
  final List<ModularRoute> routes = [];
}
