import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings_bloc.dart';
import 'package:up_invest_front/app/modules/settings/widgets/user_profile_card.dart';

import '../widgets/select_language.dart';

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
    final settingsBloc = Modular.get<SettingsBloc>();
    final intlStrings = IntlStrings.of(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            intlStrings.settingsAppBarTitle,
            style: TextStyle(
                color: colorScheme.onBackground,
                fontSize: 25,
                fontWeight: FontWeight.w400),
          ),
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
        body: BlocConsumer<SettingsBloc, SettingsState>(
            bloc: settingsBloc,
            listener: (context, state) {},
            builder: (context, state) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: SizedBox(
                      height: size.height - systemBarSize - bottomBarSize,
                      width: size.width,
                      child: Column(children: [
                        const SizedBox(height: 40),
                        const UserProfileCard(),
                        const SizedBox(height: 20),
                        Row(children: [
                          Expanded(
                              child: Container(
                                  color: colorScheme.outline, height: 1))
                        ]),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              intlStrings.settingsAppBarTitle,
                              style: TextStyle(
                                  color: colorScheme.outline,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const SelectLanguage(),
                      ]),
                    ),
                  ),
                ),
              );
            }));
  }
}
