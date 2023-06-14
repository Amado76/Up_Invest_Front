import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/widgets/loading/loading_screen.dart';
import 'package:up_invest_front/app/core/widgets/snackbar/custom_snack_bar.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_model.dart';

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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final IntlStrings intlStrings = IntlStrings.current;
    AvatarModel displayAvatar = authBloc.state.authUser!.avatar;

    final customBar = CustomSnackBar();

    final intlString = IntlStrings.of(context);

    return BlocConsumer<EditDetailsBloc, EditDetailsState>(
      bloc: editDetailsBloc,
      listener: (context, state) {
        final hideLoading = LoadingScreen.instance().hide();
        return switch (state) {
          EditDetailsIdle() => {
              hideLoading,
            },
          EditDetailsError(
            authError: final authError,
            settingsError: final settingsError
          ) =>
            {
              hideLoading,
              if (authError != null)
                {
                  customBar.showBottomErrorSnackBar(
                      authError.dialogTitle, authError.dialogText, context)
                }
              else if (settingsError != null)
                {
                  customBar.showBottomErrorSnackBar(settingsError.dialogTitle,
                      settingsError.dialogText, context)
                }
            },
          EditDetailsLoading() => LoadingScreen.instance()
              .show(context: context, text: intlString.loading),
          EditDetailsSuccess(
            settingsSuccess: final settingsSuccess,
            avatar: final avatar
          ) =>
            {
              displayAvatar = avatar,
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
                            radius: 103,
                            backgroundColor: colorScheme.tertiary,
                            child: CircleAvatar(
                                backgroundColor: colorScheme.tertiary,
                                radius: 100,
                                backgroundImage: Image.network(
                                  displayAvatar.url,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                ).image),
                          ),
                        ],
                      ),
                      const ChangeAvatar()
                    ],
                  ),
                ],
              )),
        );
      },
    );
  }
}
