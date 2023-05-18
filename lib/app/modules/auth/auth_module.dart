import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/modules/auth/gateway/firebase_gateway.dart';
import 'package:up_invest_front/app/modules/auth/gateway/auth_gateway_interface.dart';
import 'package:up_invest_front/app/modules/auth/pages/login_page.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository_interface.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<IAuthRepository>(
        (i) => AuthRepository(i.get<IAuthGateway>())),
    Bind.singleton<IAuthGateway>(
        (i) => FireBaseGateway(auth: i.get<FirebaseAuth>()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage()),
  ];
}
