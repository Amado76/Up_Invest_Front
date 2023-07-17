import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/adapter/http/http_client_adapter.dart';
import 'package:up_invest_front/app/modules/goals/repository/goal_repository.dart';

class GoalsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<IGoalRepository>(
        (i) => GoalRepository(httpClientAdapter: i.get<DioAdapter>()),
        export: true),
  ];

  @override
  final List<ModularRoute> routes = [];
}
