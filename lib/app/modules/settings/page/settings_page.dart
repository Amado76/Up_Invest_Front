import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings_bloc.dart';

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
              settingsBloc.add(const SettingsEventChangeThemeToDark());
            },
          ),
          TextButton(
            child: const Text('Change Theme - Ligth'),
            onPressed: () {
              settingsBloc.add(const SettingsEventChangeThemeToLight());
            },
          ),
          TextButton(
            child: const Text('Go Home'),
            onPressed: () {
              Modular.to.navigate('/home');
            },
          ),
        ],
      )),
    );
  }
}
