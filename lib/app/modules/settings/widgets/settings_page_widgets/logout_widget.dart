import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/widgets/custom_alert_dialog.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/settings/widgets/custom_dialog_actions.dart';

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

    return Row(
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
        ),
      ],
    );
  }
}
