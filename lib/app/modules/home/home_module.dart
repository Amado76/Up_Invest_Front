import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/modules/home/page/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage()),
  ];
}
