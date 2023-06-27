import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:up_invest_front/app/core/adapter/cache_adapter/cache_adapter.dart';
import 'package:up_invest_front/app/core/adapter/remote_storage/remote_storage_adapter.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/auth/bloc/recovery_password/recover_password_bloc.dart';
import 'package:up_invest_front/app/modules/auth/bloc/sign_up/sign_up_bloc.dart';
import 'package:up_invest_front/app/modules/auth/adapter/auth_adapter_interface.dart';
import 'package:up_invest_front/app/modules/auth/adapter/auth_social_network_adapter_interface.dart';
import 'package:up_invest_front/app/modules/auth/pages/recover_password_page.dart';
import 'package:up_invest_front/app/modules/auth/pages/sign_in_page.dart';
import 'package:up_invest_front/app/modules/auth/pages/sign_up_page.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';
import 'package:up_invest_front/app/modules/auth/repository/avatar_model_repository.dart';
import 'package:up_invest_front/app/modules/auth/util/asset_to_file.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<IAvatarRepository>(
        (i) => AvatarRepository(
            storageAdapter: i.get<IRemoteStorageAdapter>(),
            localFileHelper: LocalFileHelper()),
        export: true),
    Bind.singleton<IAuthRepository>(
        (i) => AuthRepository(
            authAdapter: i.get<IAuthAdapter>(),
            authSocialNetworkAdapter: i.get<IAuthSocialNetworkAdapter>(),
            remoteStorageAdapter: i.get<IRemoteStorageAdapter>()),
        export: true),
    Bind.singleton<IAuthSocialNetworkAdapter>(
        (i) => SocialNetworkAdapter(googleSignIn: i.get<GoogleSignIn>()),
        export: true),
    Bind.singleton<IAuthAdapter>(
        (i) => FirebaseAuthAdapter(auth: i.get<FirebaseAuth>()),
        export: true),
    Bind.factory<GoogleSignIn>((i) => GoogleSignIn(), export: true),
    BlocBind.singleton(
        (i) => AuthBloc(
            authRepository: i.get<IAuthRepository>(),
            cacheAdapter: i.get<ICacheAdapter>()),
        export: true),
    BlocBind.singleton((i) => SignUpBloc(
        authRepository: i.get<IAuthRepository>(),
        avatarRepository: i.get<IAvatarRepository>())),
    BlocBind.lazySingleton(
        (i) => RecoverPasswordBloc(authRepository: i.get<IAuthRepository>())),
    Bind.singleton<FirebaseAuth>((i) => FirebaseAuth.instance, export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SignInPage()),
    ChildRoute('/sign_up', child: (_, args) => const SingUpPage()),
    ChildRoute('/recover_password',
        child: (_, args) => const RecoverPasswordPage()),
  ];
}
