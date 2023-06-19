import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/util/validator.dart';
import 'package:up_invest_front/app/core/widgets/custom_alert_dialog.dart';
import 'package:up_invest_front/app/core/widgets/custom_password_form_field.dart';
import 'package:up_invest_front/app/core/widgets/custom_text_form_field.dart';
import 'package:up_invest_front/app/core/widgets/loading/loading_screen.dart';
import 'package:up_invest_front/app/core/widgets/snackbar/custom_snack_bar.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_model.dart';

import 'package:up_invest_front/app/modules/settings/bloc/settings/edit_details_bloc.dart';
import 'package:up_invest_front/app/modules/settings/widgets/change_avatar.dart';
import 'package:up_invest_front/app/modules/settings/widgets/custom_dialog_actions.dart';
import 'package:up_invest_front/app/modules/settings/widgets/edit_details_row.dart';
import 'package:up_invest_front/app/modules/settings/widgets/edit_name_widget.dart';
import 'package:up_invest_front/app/modules/settings/widgets/edit_password_widget.dart';
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
              widget: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: colorScheme.tertiaryContainer.withOpacity(0.6),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          const SizedBox(height: 25),
                          Stack(
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 102,
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
                          EditNameWidget(
                            name: authBloc.state.authUser!.displayName,
                          ),
                          const SizedBox(height: 10),
                          const Divider(color: Colors.grey, height: 4.0),
                          const SizedBox(height: 10),
                          _EditEmailWidget(
                            email: authBloc.state.authUser!.email,
                          ),
                          const SizedBox(height: 10),
                          const Divider(color: Colors.grey, height: 4.0),
                          const SizedBox(height: 10),
                          const EditPasswordWidget(),
                          const SizedBox(height: 10),
                          const Divider(color: Colors.grey, height: 4.0),
                          const SizedBox(height: 10),
                          const _DeleteAccount()
                        ],
                      ),
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}

class _EditEmailWidget extends StatefulWidget {
  final String email;
  const _EditEmailWidget({required this.email});

  @override
  State<_EditEmailWidget> createState() => _EditEmailWidgetState();
}

class _EditEmailWidgetState extends State<_EditEmailWidget> {
  @override
  Widget build(BuildContext context) {
    final editDetailsBloc = Modular.get<EditDetailsBloc>();
    final IntlStrings intlStrings = IntlStrings.current;
    final TextEditingController currentEmailController =
        TextEditingController();
    final TextEditingController newEmailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final Validator validator = Validator();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return EditDetailsPageRow(
      icon: Icons.email_outlined,
      title: intlStrings.emailHintText.toUpperCase(),
      content: widget.email,
      onPressed: () {
        showCustomDialog(
            context: context,
            title: intlStrings.editDetailsChangeEmail,
            content: SizedBox(
              height: 300,
              width: 300,
              child: Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                          icon: const Icon(Icons.email_outlined),
                          hintText: intlStrings.emailHintText,
                          keyBoardType: TextInputType.emailAddress,
                          validator: (email) {
                            return validator.emailValidator(email);
                          },
                          controller: currentEmailController),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                          icon: const Icon(Icons.email_outlined),
                          hintText: intlStrings.editDetailsNewEmailHintText,
                          keyBoardType: TextInputType.emailAddress,
                          validator: (email) {
                            return validator.emailValidator(email);
                          },
                          controller: newEmailController),
                      const SizedBox(height: 10),
                      CustomPasswordFormField(
                          hintText: intlStrings.passwordHintText,
                          validator: (password) {
                            return validator.signInPasswordValidator(password);
                          },
                          controller: passwordController)
                    ]),
              ),
            ),
            barrierDismissible: true,
            actions: CustomDialogActions(onCancel: () {
              Navigator.of(context).pop();
            }, onSave: () {
              if (formKey.currentState!.validate()) {
                editDetailsBloc.add(EditDetailsUpdateEmail(
                    newEmail: newEmailController.text,
                    email: currentEmailController.text,
                    password: passwordController.text));
                Navigator.of(context).pop();
              }
            }));
      },
    );
  }
}

class _DeleteAccount extends StatefulWidget {
  const _DeleteAccount();

  @override
  State<_DeleteAccount> createState() => __DeleteAccountState();
}

class __DeleteAccountState extends State<_DeleteAccount> {
  @override
  Widget build(BuildContext context) {
    final IntlStrings intlStrings = IntlStrings.current;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final Validator validator = Validator();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Row(
      children: [
        Icon(Icons.dangerous, color: colorScheme.error),
        const SizedBox(width: 10),
        Text(
          intlStrings.editDetailsDeleteAccount,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: colorScheme.error,
              fontSize: 16),
        ),
        const Expanded(child: SizedBox()),
        IconButton(
          onPressed: () {
            showCustomDialog(
                barrierDismissible: true,
                context: context,
                title: intlStrings.editDetailsSadToSeeYouGo,
                content: SizedBox(
                  width: 300,
                  height: 300,
                  child: Column(
                    children: [
                      Text(
                        intlStrings.editDetailsDeleteAccoutnWarningPersonalData,
                        style: TextStyle(
                          color: colorScheme.outline,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      Form(
                        key: formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextFormField(
                                  icon: const Icon(Icons.email_outlined),
                                  hintText: intlStrings.emailHintText,
                                  keyBoardType: TextInputType.emailAddress,
                                  validator: (email) {
                                    return validator.emailValidator(email);
                                  },
                                  controller: emailController),
                              const SizedBox(height: 10),
                              CustomPasswordFormField(
                                  hintText: intlStrings.passwordHintText,
                                  validator: (password) {
                                    return validator
                                        .signInPasswordValidator(password);
                                  },
                                  controller: passwordController)
                            ]),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        intlStrings.editDetailsDeleteAccountWarning,
                        style: TextStyle(
                          color: colorScheme.outline,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                actions: CustomDialogActions(
                    onSaveText: 'Delete',
                    onSaveIcon:
                        Icon(Icons.delete_forever, color: colorScheme.error),
                    onCancelIcon: Icon(Icons.check, color: colorScheme.primary),
                    onCancel: () {},
                    onSave: () {
                      if (formKey.currentState!.validate()) {}
                    }));
          },
          icon: Icon(Icons.delete_forever, color: colorScheme.error),
        )
      ],
    );
  }
}
