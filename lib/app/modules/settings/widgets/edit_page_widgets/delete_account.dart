import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/util/validator/email_validator.dart';
import 'package:up_invest_front/app/core/util/validator/password_sign_in_validator.dart';
import 'package:up_invest_front/app/core/widgets/custom_alert_dialog.dart';
import 'package:up_invest_front/app/core/widgets/custom_password_form_field.dart';
import 'package:up_invest_front/app/core/widgets/custom_text_form_field.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings/edit_details_bloc.dart';
import 'package:up_invest_front/app/modules/settings/widgets/custom_dialog_actions.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => __DeleteAccountState();
}

class __DeleteAccountState extends State<DeleteAccount> {
  final _emailValidator = EmailValidator();
  final _passwordValidator = PasswordSignInValidator();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final editDetailsBloc = Modular.get<EditDetailsBloc>();
    final IntlStrings intlStrings = IntlStrings.current;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          intlStrings
                              .editDetailsDeleteAccoutnWarningPersonalData,
                          style: TextStyle(
                            color: colorScheme.outline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15),
                        Form(
                          key: _formKey,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomTextFormField(
                                    icon: const Icon(Icons.email_outlined),
                                    hintText: intlStrings.emailHintText,
                                    keyBoardType: TextInputType.emailAddress,
                                    validator: (email) {
                                      return _emailValidator.validate(email);
                                    },
                                    controller: _emailController),
                                const SizedBox(height: 10),
                                CustomPasswordFormField(
                                    hintText: intlStrings.passwordHintText,
                                    validator: (password) {
                                      return _passwordValidator
                                          .validate(password);
                                    },
                                    controller: _passwordController)
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
                ),
                actions: CustomDialogActions(
                    onSaveText: Text(
                      intlStrings.editDetailsDelete,
                      style: TextStyle(
                          color: colorScheme.error,
                          fontWeight: FontWeight.bold),
                    ),
                    onSaveIcon:
                        Icon(Icons.delete_forever, color: colorScheme.error),
                    onCancelIcon: Icon(Icons.check, color: colorScheme.primary),
                    onCancel: () {
                      _emailController.clear();
                      _passwordController.clear();

                      Navigator.of(context).pop();
                    },
                    onSave: () {
                      if (_formKey.currentState!.validate()) {
                        editDetailsBloc.add(EditDetailsDeleteAccount(
                            email: _emailController.text,
                            password: _passwordController.text));
                      }
                      _emailController.clear();
                      _passwordController.clear();

                      Navigator.of(context).pop();
                    }));
          },
          icon: Icon(Icons.delete_forever, color: colorScheme.error),
        )
      ],
    );
  }
}
