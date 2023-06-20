import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/settings/widgets/settings_page_widgets/settings_options_row.dart';

class VerifiedEmail extends StatelessWidget {
  const VerifiedEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final intlStrings = IntlStrings.of(context);
    final authBloc = Modular.get<AuthBloc>();

    return Visibility(
        visible: authBloc.state.authUser?.isEmailVerified == false,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: SettingsOptionsRow(
            icon: Icons.email_outlined,
            text: intlStrings.settingsEmailIsNotVerified,
            button: IconButton(
                onPressed: () {
                  authBloc.add(const AuthSendEmailVerification());
                },
                icon: ImageIcon(
                  color: colorScheme.onBackground,
                  const AssetImage('assets/icons/short_right.png'),
                )),
          ),
        ));
  }
}
