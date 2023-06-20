import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/widgets/custom_alert_dialog.dart';
import 'package:up_invest_front/app/core/widgets/loading/loading_screen.dart';
import 'package:up_invest_front/app/core/widgets/snackbar/custom_snack_bar.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings_bloc.dart';
import 'package:up_invest_front/app/modules/settings/widgets/change_theme.dart';
import 'package:up_invest_front/app/modules/settings/widgets/custom_dialog_actions.dart';
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
          const SizedBox(height: 12),
          const LoggoutWidget()
        ]));
  }
}

class LoggoutWidget extends StatelessWidget {
  const LoggoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final intlStrings = IntlStrings.of(context);
    final authBloc = Modular.get<AuthBloc>();
    final customBar = CustomSnackBar();
    return BlocListener<AuthBloc, AuthState>(
      bloc: authBloc,
      listener: (context, state) {
        final hideLoading = LoadingScreen.instance().hide();
        return switch (state) {
          AuthLoggedIn() => hideLoading,
          AuthLoggedOut() => {},
          AuthLoading() => LoadingScreen.instance()
              .show(context: context, text: intlStrings.loading),
          AuthErrorState(authError: final authError) => {
              hideLoading,
              customBar.showBottomErrorSnackBar(
                  authError.dialogTitle, authError.dialogText, context)
            },
          AuthSuccessState(authSucess: final authSucess) => {
              hideLoading,
              customBar.showBottomSuccessSnackBar(
                  authSucess.dialogTitle, authSucess.dialogText, context)
            }
        };
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              showCustomDialog(
                  barrierDismissible: true,
                  context: context,
                  title: intlStrings.settingsLogout,
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        intlStrings.settingsLogoutWarningMessage,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  actions: CustomDialogActions(
                    onCancel: () {
                      Navigator.of(context).pop();
                    },
                    onSave: () {
                      authBloc.add(const AuthLogOut());
                    },
                    onSaveIcon: Icon(
                      Icons.logout,
                      color: colorScheme.error,
                    ),
                    onSaveText: Text(intlStrings.settingsLogoutButton,
                        style: TextStyle(
                            color: colorScheme.error,
                            fontWeight: FontWeight.bold)),
                  ));
            },
            child: Row(
              children: [
                Icon(Icons.logout, color: colorScheme.error),
                const SizedBox(width: 10),
                Text(intlStrings.settingsLogout,
                    style: TextStyle(color: colorScheme.error, fontSize: 17)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
