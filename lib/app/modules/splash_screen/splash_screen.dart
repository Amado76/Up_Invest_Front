import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final authBloc = Modular.get<AuthBloc>();
    Timer(const Duration(seconds: 2), () {
      if (authBloc.state is AuthStateLoggedIn) {
        Modular.to.navigate('/home/');
      } else {
        Modular.to.navigate('/get_started');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bottomBarSize = MediaQuery.of(context).viewPadding.bottom;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
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
            Column(
              children: [
                Image.asset(
                  'assets/images/logo_up_invest.png',
                  alignment: Alignment.center,
                  height: 300,
                  width: 300,
                ),
                const Text(
                  'Track your assets and \njourney to financial success!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(colorScheme.tertiaryContainer),
            ),
          ],
        ),
      ),
    );
  }
}
