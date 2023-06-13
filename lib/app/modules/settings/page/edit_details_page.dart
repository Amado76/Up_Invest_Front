import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/widgets/loading/loading_screen.dart';
import 'package:up_invest_front/app/core/widgets/snackbar/custom_snack_bar.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';

import 'package:up_invest_front/app/modules/settings/bloc/settings/edit_details_bloc.dart';
import 'package:up_invest_front/app/modules/settings/widgets/change_avatar.dart';
import 'package:up_invest_front/app/modules/settings/widgets/settings_scaffold.dart';

class EditDetailsPage extends StatefulWidget {
  const EditDetailsPage({super.key});

  @override
  State<EditDetailsPage> createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final editDetailsBloc = Modular.get<EditDetailsBloc>();
    final authBloc = Modular.get<AuthBloc>();
    final currentAuthState = authBloc.state as AuthLoggedIn;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    String avatarFilePath = currentAuthState.avatar.path;
    final IntlStrings intlStrings = IntlStrings.current;

    final customBar = CustomSnackBar();
    final hideLoading = LoadingScreen.instance().hide();
    final intlString = IntlStrings.of(context);

    return BlocListener<AuthBloc, AuthState>(
      bloc: authBloc,
      listener: (context, state) {
        if (state is AuthLoggedIn) {
          currentAuthState.avatar;
        }
      },
      child: BlocConsumer<EditDetailsBloc, EditDetailsState>(
        bloc: editDetailsBloc,
        listener: (context, state) {
          return switch (state) {
            EditDetailsIdle() => {
                hideLoading,
              },
            EditDetailsError(authError: final authError) => {
                hideLoading,
                customBar.showBottomErrorSnackBar(
                    authError.dialogTitle, authError.dialogText, context)
              },
            EditDetailsLoading() => LoadingScreen.instance()
                .show(context: context, text: intlString.loading),
            EditDetailsSucess(settingsSuccess: final settingsSuccess) => {
                hideLoading,
                customBar.showBottomSuccessSnackBar(settingsSuccess.dialogTitle,
                    settingsSuccess.dialogText, context)
              }
          };
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SettingsScaffold(
                appBarTitle: intlStrings.editDetailsAppBarTitle,
                widget: Column(
                  children: [
                    const SizedBox(height: 25),
                    Stack(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 101,
                              backgroundColor: colorScheme.tertiary,
                              child: CircleAvatar(
                                  backgroundColor: colorScheme.tertiary,
                                  radius: 100,
                                  backgroundImage:
                                      FileImage(currentAuthState.avatar)),
                            ),
                          ],
                        ),
                        ChangeAvatar(
                            colorScheme: colorScheme,
                            editDetailsBloc: editDetailsBloc,
                            avatarFilePath: avatarFilePath)
                      ],
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
