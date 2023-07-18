import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/util/validator/confirm_password_validator.dart';
import 'package:up_invest_front/app/core/util/validator/email_validator.dart';
import 'package:up_invest_front/app/core/util/validator/password_sign_in_validator.dart';
import 'package:up_invest_front/app/core/util/validator/password_sign_up_validator.dart';
import 'package:up_invest_front/app/core/widgets/custom_alert_dialog.dart';
import 'package:up_invest_front/app/core/widgets/custom_password_form_field.dart';
import 'package:up_invest_front/app/core/widgets/custom_text_form_field.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings/edit_details_bloc.dart';
import 'package:up_invest_front/app/modules/settings/widgets/custom_dialog_actions.dart';

import 'package:up_invest_front/app/modules/settings/widgets/edit_page_widgets/edit_details_row.dart';

class EditPasswordWidget extends StatefulWidget {
  const EditPasswordWidget({super.key});

  @override
  State<EditPasswordWidget> createState() => _EditPasswordWidgetState();
}

class _EditPasswordWidgetState extends State<EditPasswordWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();
  final _emailValidator = EmailValidator();
  final _passwordValidator = PasswordSignInValidator();
  final _newPasswordValidator = PasswordSignUpValidator();
  final _confirmNewPasswordValidator = ConfirmPasswordValidator();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final editDetailsBloc = Modular.get<EditDetailsBloc>();
    final IntlStrings intlStrings = IntlStrings.current;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return EditDetailsPageRow(
      icon: Icons.lock_outline,
      title: intlStrings.passwordHintText.toUpperCase(),
      content: '*********',
      onPressed: () {
        showCustomDialog(
            context: context,
            title: intlStrings.editDetailsChangePassword,
            content: SizedBox(
              height: 380,
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
                            return _emailValidator.validate(email);
                          },
                          controller: _emailController),
                      const SizedBox(height: 10),
                      CustomPasswordFormField(
                          hintText: intlStrings.passwordHintText,
                          validator: (password) {
                            return _passwordValidator.validate(password);
                          },
                          controller: _passwordController),
                      const SizedBox(height: 10),
                      CustomPasswordFormField(
                          hintText: intlStrings.editDetailsNewPasswordHintText,
                          validator: (password) {
                            return _newPasswordValidator.validate(password);
                          },
                          controller: _newPasswordController),
                      const SizedBox(height: 10),
                      CustomPasswordFormField(
                          hintText:
                              intlStrings.editDetailsConfirmNewPasswordHintText,
                          validator: (password) {
                            return _confirmNewPasswordValidator.validate(
                                input: _newPasswordController.text,
                                stringToCompare: password);
                          },
                          controller: _confirmNewPasswordController)
                    ]),
              ),
            ),
            barrierDismissible: true,
            actions: CustomDialogActions(onCancel: () {
              _emailController.clear();
              _passwordController.clear();
              _newPasswordController.clear();
              _confirmNewPasswordController.clear();
              Navigator.of(context).pop();
            }, onSave: () {
              if (formKey.currentState!.validate()) {
                editDetailsBloc.add(EditDetailsUpdatePassword(
                    email: _emailController.text,
                    newPassword: _newPasswordController.text,
                    password: _passwordController.text));
                _emailController.clear();
                _passwordController.clear();
                _newPasswordController.clear();
                Navigator.of(context).pop();
              }
            }));
      },
    );
  }
}
