import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_event.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_state.dart';
import 'core/themes/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authBloc = Modular.get<AuthBloc>();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      title: 'Up Invest',
      builder: (context, child) {
        return BlocBuilder<AuthBloc, AuthState>(
          bloc: authBloc,
          builder: (context, state) {
            authBloc.add(const AuthEventIsLoggedIn());
            return ResponsiveWrapper.builder(child,
                defaultScale: true, defaultScaleFactor: 1);
          },
        );
      },
    );
  }
}
