import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/adapter/http/http_client_adapter.dart';
import 'package:up_invest_front/app/modules/achievement/repository/achivement_repository.dart';

class AchivementModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<IAchivementRepository>(
        (i) => AchivementRepository(httpClientAdapter: i.get<DioAdapter>()),
        export: true),
  ];

  @override
  final List<ModularRoute> routes = [];
}
