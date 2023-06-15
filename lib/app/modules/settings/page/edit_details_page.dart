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
              rightPadding: 0,
              leftPadding: 0,
              appBarTitle: intlStrings.editDetailsAppBarTitle,
              widget: Column(
                children: [
                  Container(
                    color: colorScheme.outline.withOpacity(0.2),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        const SizedBox(height: 25),
                        Stack(
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 100,
                                  backgroundColor: colorScheme.tertiary,
                                  child: CircleAvatar(
                                      backgroundColor: colorScheme.tertiary,
                                      radius: 100,
                                      backgroundImage: Image.network(
                                        displayAvatar.url,
                                      ).image),
                                ),
                              ],
                            ),
                            const ChangeAvatar()
                          ],
                        ),
                        const SizedBox(height: 25),
                        Text(
                          intlStrings.editDetailsProfilePicture,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onBackground),
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: [
                        EditDetailsPageRow(
                          title: intlString.nameHintText.toUpperCase(),
                          content: 'Bruno Amado',
                        ),
                        const SizedBox(height: 25),
                        EditDetailsPageRow(
                          title: intlString.emailHintText.toUpperCase(),
                          content: 'amado.bruno@gmail.com',
                        ),
                        const SizedBox(height: 25),
                        EditDetailsPageRow(
                          title: intlString.passwordHintText.toUpperCase(),
                          content: '*********',
                        ),
                      ],
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}

class EditDetailsPageRow extends StatelessWidget {
  final String title;
  final String content;

  const EditDetailsPageRow({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: colorScheme.onBackground,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              content,
              style: TextStyle(
                color: colorScheme.onBackground,
                fontSize: 18,
              ),
            ),
          ],
        ),
        const Expanded(child: SizedBox()),
        IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
      ],
    );
  }
}
