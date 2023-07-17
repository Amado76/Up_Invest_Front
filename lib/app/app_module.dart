import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/adapter/cache_adapter/cache_adapter.dart';
import 'package:up_invest_front/app/core/adapter/http/http_client_adapter.dart';
import 'package:up_invest_front/app/core/adapter/local_storage_adapter/local_storage_adapter_interface.dart';
import 'package:up_invest_front/app/core/adapter/remote_storage/remote_storage_adapter.dart';
import 'package:up_invest_front/app/modules/financial_assets/financial_assets_module.dart';
import 'package:up_invest_front/app/modules/goals/goals_module.dart';
import 'package:up_invest_front/app/modules/home/home_module.dart';
import 'package:up_invest_front/app/modules/auth/auth_module.dart';
import 'package:up_invest_front/app/modules/get_started/get_started_module.dart';
import 'package:up_invest_front/app/modules/settings/settings_module.dart';

import 'package:up_invest_front/app/modules/splash_screen/splash_screen_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<ILocalStorageAdapter>(
      (i) => SharedPreferencesAdapter(),
    ),
    Bind.singleton<IHttpClientAdapter>(
      (i) => DioAdapter(dio: i.get<Dio>()),
    ),
    Bind.lazySingleton<IRemoteStorageAdapter>(
        (i) => FirebaseStorageAdapter(storage: i.get<FirebaseStorage>())),
    Bind.lazySingleton<FirebaseStorage>((i) => FirebaseStorage.instance),
    Bind.singleton<ICacheAdapter>(
        (i) => FlutterCacheManager(defaultCacheManager: DefaultCacheManager()))
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
    GoalsModule(),
    FinancialAssetsModule()
  ];
}
