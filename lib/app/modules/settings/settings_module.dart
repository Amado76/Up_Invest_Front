import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:up_invest_front/app/modules/settings/page/settings_page.dart';

import 'bloc/settings_bloc.dart';

class SettingsModule extends Module {
  @override
  final List<Bind> binds = [
    BlocBind.singleton((i) => SettingsBloc(), export: true)
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SettingsPage()),
  ];
}
