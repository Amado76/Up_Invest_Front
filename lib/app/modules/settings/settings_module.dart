import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:up_invest_front/app/core/adapter/local_storage_adapter/local_storage_adapter_interface.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';
import 'package:up_invest_front/app/modules/auth/repository/avatar_model_repository.dart';

import 'package:up_invest_front/app/modules/settings/bloc/settings/edit_details_bloc.dart';
import 'package:up_invest_front/app/modules/settings/page/edit_details_page.dart';
import 'package:up_invest_front/app/modules/settings/page/settings_page.dart';
import 'package:up_invest_front/app/modules/settings/repository/settings_repository.dart';

import 'bloc/settings_bloc.dart';

class SettingsModule extends Module {
  @override
  final List<Bind> binds = [
    BlocBind.singleton(
        (i) => SettingsBloc(settingsRepository: i.get<ISettingsRepository>()),
        export: true),
    Bind.singleton<ISettingsRepository>(
        (i) => SettingsRepository(
            localStorageAdapter: i.get<ILocalStorageAdapter>()),
        export: true),
    Bind.lazySingleton((i) => EditDetailsBloc(
        avatarRepository: i.get<IAvatarRepository>(),
        authRepository: i.get<IAuthRepository>(),
        authUser: i.get<AuthBloc>().state.authUser!,
        avatar: i.get<AuthBloc>().state.authUser!.avatar))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SettingsPage()),
    ChildRoute('/details', child: (_, args) => const EditDetailsPage()),
  ];
}
