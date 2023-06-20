import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_model.dart';

import '../../auth/model/auth_user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authBloc = Modular.get<AuthBloc>();

    AuthUserModel? authUser = authBloc.state is AuthLoggedIn
        ? (authBloc.state as AuthLoggedIn).authUser
        : null;
    authUser ??= const AuthUserModel(
      userId: 'userId',
      email: '',
      token: 'token',
      displayName: 'displayName',
      avatar: CustomAvatar(id: 9, path: 'path', url: 'url'),
      signInMethod: 'signInMethod',
      isEmailVerified: true,
    );
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                Modular.to.pushNamed('/settings/');
              },
              child: const Text('Go to Settings')),
        ],
      ),
    );
  }
}
