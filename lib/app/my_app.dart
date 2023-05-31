import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';

import 'core/themes/themes.dart';
import 'modules/settings/bloc/settings_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsBloc = context.watch<SettingsBloc>((bloc) => bloc.stream);
    final settingsState = settingsBloc.state;

    return MaterialApp.router(
      localizationsDelegates: const [
        IntlStrings.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      locale: settingsState.settingsModel.locale,
      supportedLocales: IntlStrings.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      themeMode: settingsState.settingsModel.themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      title: 'Up Invest',
      builder: (context, child) {
        return ResponsiveWrapper.builder(child,
            defaultScale: true, defaultScaleFactor: 1);
      },
    );
  }
}
