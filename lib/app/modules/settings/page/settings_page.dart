import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final size = MediaQuery.of(context).size;
    final systemBarSize = MediaQuery.of(context).viewPadding.top;
    final bottomBarSize = MediaQuery.of(context).viewPadding.bottom;
    final authBloc = Modular.get<AuthBloc>();
    final currentAuthState = authBloc.state as AuthStateLoggedIn;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.background,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    Modular.to.pop();
                  },
                  icon: ImageIcon(
                    color: colorScheme.onBackground,
                    const AssetImage('assets/icons/short_left.png'),
                  )),
            ),
          ),
        ),
        backgroundColor: colorScheme.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: SizedBox(
                height: size.height - systemBarSize - bottomBarSize,
                width: size.width,
                child: Column(children: [
                  CircleAvatar(
                      backgroundColor: colorScheme.tertiary,
                      radius: 90,
                      backgroundImage:
                          NetworkImage(currentAuthState.authUser.avatar)),
                ]),
              ),
            ),
          ),
        ));
  }
}
