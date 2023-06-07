import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/settings/widgets/settings_scaffold.dart';

class AccountDetailsPage extends StatefulWidget {
  const AccountDetailsPage({super.key});

  @override
  State<AccountDetailsPage> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final authBloc = context.watch<AuthBloc>((bloc) => bloc.stream);
    final currentAuthState = authBloc.state as AuthLoggedIn;
    return SettingsScaffold(
        appBarTitle: 'Account Details',
        widget: Column(
          children: [
            CircleAvatar(
                backgroundColor: colorScheme.tertiary,
                radius: 50,
                backgroundImage: FileImage(currentAuthState.avatar)),
          ],
        ));
  }
}
