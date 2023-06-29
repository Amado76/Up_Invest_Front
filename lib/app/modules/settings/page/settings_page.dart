import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/widgets/loading/loading_screen.dart';
import 'package:up_invest_front/app/core/widgets/custom_snack_bar.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings_bloc.dart';
import 'package:up_invest_front/app/modules/settings/widgets/settings_page_widgets/about_us.dart';
import 'package:up_invest_front/app/modules/settings/widgets/settings_page_widgets/change_theme.dart';
import 'package:up_invest_front/app/core/widgets/logout_widget.dart';
import 'package:up_invest_front/app/modules/settings/widgets/settings_page_widgets/select_language.dart';
import 'package:up_invest_front/app/modules/settings/widgets/settings_page_widgets/verified_email.dart';
import 'package:up_invest_front/app/modules/settings/widgets/settings_scaffold.dart';
import 'package:up_invest_front/app/modules/settings/widgets/settings_page_widgets/user_profile_card.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final settingsBloc = Modular.get<SettingsBloc>();
  final authBloc = Modular.get<AuthBloc>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final intlStrings = IntlStrings.of(context);
    final customBar = CustomSnackBar();

    return BlocConsumer<AuthBloc, AuthState>(
      bloc: authBloc,
      listener: (context, state) {
        final hideLoading = LoadingScreen.instance().hide();
        return switch (state) {
          AuthLoggedIn() => hideLoading,
          AuthLoggedOut() => Modular.to.navigate('/auth'),
          AuthLoading() => LoadingScreen.instance()
              .show(context: context, text: intlStrings.loading),
          AuthErrorState(authError: final authError) => {
              hideLoading,
              customBar.showBottomErrorSnackBar(
                  authError.dialogTitle, authError.dialogText, context)
            },
          AuthSuccessState(authSuccess: final authSucess) => {
              hideLoading,
              customBar.showBottomSuccessSnackBar(
                  authSucess.dialogTitle, authSucess.dialogText, context)
            }
        };
      },
      builder: (context, state) {
        return SettingsScaffold(
            appBarTitle: intlStrings.settingsAppBarTitle,
            widget: Column(children: [
              const SizedBox(height: 40),
              const UserProfileCard(),
              const SizedBox(height: 20),
              Row(children: [
                Expanded(
                    child: Container(color: colorScheme.outline, height: 1))
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
              const VerifiedEmail(),
              const AboutUs(),
              const SizedBox(height: 12),
              const LoggoutWidget()
            ]));
      },
    );
  }
}
