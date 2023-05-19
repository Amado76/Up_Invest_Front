import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_event.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_state.dart';

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
    AuthUserModel? authUser = authBloc.state is AuthStateLoggedIn
        ? (authBloc.state as AuthStateLoggedIn).authUser
        : null;
    authUser ??= const AuthUserModel(
      userId: 'userId',
      email: '',
      token: 'token',
      displayName: 'displayName',
      avatarPicture: 'avatarPicture',
      signInMethod: 'signInMethod',
      isEmailVerified: true,
    );
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (context, state) {
          if (state is AuthStateLoggedOut) {
            Modular.to.navigate('/auth');
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Sign In! email:${authUser.email}')),
            TextButton(
                onPressed: () {
                  authBloc.add(const AuthEventLogOut());
                },
                child: const Text('Loggout'))
          ],
        ),
      ),
    );
  }
}
