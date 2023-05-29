import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:up_invest_front/app/core/adapter/local_storage_adapter/local_storage_adapter_interface.dart';
import 'package:up_invest_front/app/modules/home/home_module.dart';
import 'package:up_invest_front/app/modules/auth/auth_module.dart';
import 'package:up_invest_front/app/modules/get_started/get_started_module.dart';
import 'package:up_invest_front/app/modules/settings/settings_module.dart';

import 'package:up_invest_front/app/modules/splash_screen/splash_screen_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<FirebaseAuth>((i) => FirebaseAuth.instance),
    Bind.singleton<ILocalStorageAdapter>(
      (i) => SharedPreferencesAdapter(i.get<SharedPreferences>()),
    ),
    AsyncBind<SharedPreferences>((i) => SharedPreferences.getInstance())
  ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/',
            module: SplashScreenModule(), transition: TransitionType.fadeIn),
        ModuleRoute('/get_started',
            module: GetStartedModule(), transition: TransitionType.fadeIn),
        ModuleRoute('/auth/',
            module: AuthModule(), transition: TransitionType.fadeIn),
        ModuleRoute('/home/',
            module: HomeModule(), transition: TransitionType.fadeIn),
        ModuleRoute('/settings/',
            module: SettingsModule(), transition: TransitionType.fadeIn),
      ];

  @override
  final List<Module> imports = [
    AuthModule(),
    SettingsModule(),
  ];
}
