import 'dart:async' show Timer;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings_bloc.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final bottomBarSize = MediaQuery.viewPaddingOf(context).bottom;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final authBloc = Modular.get<AuthBloc>();
    final settingsBloc = Modular.get<SettingsBloc>();

    return BlocConsumer<AuthBloc, AuthState>(
      bloc: authBloc,
      listener: (context, state) {
        if (authBloc.state is AuthStateLoggedIn) {
          Timer(const Duration(seconds: 2), () {
            Modular.to.navigate('/home/');
          });
        }
        if (authBloc.state is AuthStateLoggedOut) {
          Timer(const Duration(seconds: 2), () {
            Modular.to.navigate('/get_started');
          });
        }
      },
      builder: (context, state) {
        authBloc.add(const AuthEventIsLoggedIn());
        settingsBloc.add(const SettingsEventFetchSavedSettings());
        return Scaffold(
          body: Container(
            height: size.height - bottomBarSize,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    colorScheme.tertiary.withOpacity(0.5),
                    colorScheme.primary,
                  ]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/logo_up_invest_dark_mode.png',
                        alignment: Alignment.center,
                        height: 300,
                        width: 300,
                      ),
                      Text(
                        IntlStrings.of(context).splashScreenText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: colorScheme.tertiaryContainer,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      colorScheme.tertiaryContainer),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
