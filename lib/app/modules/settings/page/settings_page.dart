import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings_bloc.dart';
import 'package:up_invest_front/app/modules/settings/widgets/change_theme.dart';
import 'package:up_invest_front/app/modules/settings/widgets/settings_scaffold.dart';
import 'package:up_invest_front/app/modules/settings/widgets/user_profile_card.dart';

import '../widgets/about_us.dart';
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
    final intlStrings = IntlStrings.of(context);

    return SettingsScaffold(
        appBarTitle: intlStrings.settingsAppBarTitle,
        widget: Column(children: [
          const SizedBox(height: 40),
          const UserProfileCard(),
          const SizedBox(height: 20),
          Row(children: [
            Expanded(child: Container(color: colorScheme.outline, height: 1))
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
          const SizedBox(height: 12),
          const SelectLanguage(),
          const SizedBox(height: 12),
          const ChangeTheme(),
          const SizedBox(height: 12),
          const AboutUs(),
        ]));
  }
}
