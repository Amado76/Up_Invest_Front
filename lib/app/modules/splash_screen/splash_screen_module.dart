import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/modules/splash_screen/splash_screen.dart';

class SplashScreenModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SplashScreen())
  ];
}
