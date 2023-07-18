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
import 'package:up_invest_front/app/modules/settings/widgets/edit_page_widgets/edit_details_row.dart';

class EditEmailWidget extends StatefulWidget {
  final String email;
  const EditEmailWidget({super.key, required this.email});

  @override
  State<EditEmailWidget> createState() => _EditEmailWidgetState();
}

class _EditEmailWidgetState extends State<EditEmailWidget> {
  final _emailValidator = EmailValidator();
  final _passwordValidator = PasswordSignInValidator();
  final TextEditingController _currentEmailController = TextEditingController();
  final TextEditingController _newEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _currentEmailController.dispose();
    _passwordController.dispose();
    _newEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final editDetailsBloc = Modular.get<EditDetailsBloc>();
    final IntlStrings intlStrings = IntlStrings.current;

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
                            return _emailValidator.validate(email);
                          },
                          controller: _currentEmailController),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                          icon: const Icon(Icons.email_outlined),
                          hintText: intlStrings.editDetailsNewEmailHintText,
                          keyBoardType: TextInputType.emailAddress,
                          validator: (email) {
                            return _emailValidator.validate(email);
                          },
                          controller: _newEmailController),
                      const SizedBox(height: 10),
                      CustomPasswordFormField(
                          hintText: intlStrings.passwordHintText,
                          validator: (password) {
                            return _passwordValidator.validate(password);
                          },
                          controller: _passwordController)
                    ]),
              ),
            ),
            barrierDismissible: true,
            actions: CustomDialogActions(onCancel: () {
              _currentEmailController.clear();
              _passwordController.clear();
              _newEmailController.clear();
              Navigator.of(context).pop();
            }, onSave: () {
              if (formKey.currentState!.validate()) {
                editDetailsBloc.add(EditDetailsUpdateEmail(
                    newEmail: _newEmailController.text,
                    email: _currentEmailController.text,
                    password: _passwordController.text));
                _currentEmailController.clear();
                _passwordController.clear();
                _newEmailController.clear();

                Navigator.of(context).pop();
              }
            }));
      },
    );
  }
}
