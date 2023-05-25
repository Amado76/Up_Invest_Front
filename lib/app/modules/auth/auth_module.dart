import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/auth/gateway/firebase_gateway.dart';
import 'package:up_invest_front/app/modules/auth/gateway/auth_gateway_interface.dart';
import 'package:up_invest_front/app/modules/auth/gateway/auth_social_network_gateway_interface.dart';
import 'package:up_invest_front/app/modules/auth/pages/recover_password_page.dart';
import 'package:up_invest_front/app/modules/auth/pages/sign_in_page.dart';
import 'package:up_invest_front/app/modules/auth/pages/sign_up_page.dart';

import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository_interface.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<IAuthRepository>(
        (i) => AuthRepository(
            i.get<IAuthGateway>(), i.get<IAuthSocialNetworkGateway>()),
        export: true),
    Bind.singleton<IAuthSocialNetworkGateway>((i) => SocialNetworkGateway(),
        export: true),
    Bind.singleton<IAuthGateway>(
        (i) => FireBaseGateway(auth: i.get<FirebaseAuth>()),
        export: true),
    BlocBind.singleton(
        (i) => AuthBloc(authRepository: i.get<IAuthRepository>()),
        export: true)
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SignInPage()),
    ChildRoute('/sign_up', child: (_, args) => const SingUpPage()),
    ChildRoute('/recover_password',
        child: (_, args) => const RecoverPasswordPage()),
  ];
}
