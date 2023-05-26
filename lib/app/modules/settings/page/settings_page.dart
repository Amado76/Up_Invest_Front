import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings_bloc.dart';
import 'package:up_invest_front/l10n/generated/l10n.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final settingsBloc = Modular.get<SettingsBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            child: const Text('Change Theme - Dark'),
            onPressed: () {
              settingsBloc.add(const SettingsEventChangeTheme(theme: 'dark'));
            },
          ),
          TextButton(
            child: const Text('Change Theme - Light'),
            onPressed: () {
              settingsBloc.add(const SettingsEventChangeTheme(theme: 'light'));
            },
          ),
          TextButton(
            child: const Text('Go Home'),
            onPressed: () {
              Modular.to.navigate('/home');
            },
          ),
          Text(IntlStrings.of(context).getStartedText),
          TextButton(
            child: const Text('en'),
            onPressed: () {
              settingsBloc
                  .add(const SettingsEventChangeLanguage(language: 'en'));
            },
          ),
          TextButton(
            child: const Text('pt'),
            onPressed: () {
              settingsBloc
                  .add(const SettingsEventChangeLanguage(language: 'pt'));
            },
          ),
          TextButton(
            child: const Text('es'),
            onPressed: () {
              settingsBloc
                  .add(const SettingsEventChangeLanguage(language: 'es'));
            },
          ),
        ],
      )),
    );
  }
}
