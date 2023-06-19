import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/util/validator.dart';
import 'package:up_invest_front/app/core/widgets/custom_alert_dialog.dart';
import 'package:up_invest_front/app/core/widgets/custom_password_form_field.dart';
import 'package:up_invest_front/app/core/widgets/custom_text_form_field.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings/edit_details_bloc.dart';
import 'package:up_invest_front/app/modules/settings/widgets/custom_dialog_actions.dart';
import 'package:up_invest_front/app/modules/settings/widgets/edit_details_row.dart';

class EditPasswordWidget extends StatefulWidget {
  const EditPasswordWidget({super.key});

  @override
  State<EditPasswordWidget> createState() => _EditPasswordWidgetState();
}

class _EditPasswordWidgetState extends State<EditPasswordWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final editDetailsBloc = Modular.get<EditDetailsBloc>();
    final IntlStrings intlStrings = IntlStrings.current;

    final Validator validator = Validator();
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
                            return validator.emailValidator(email);
                          },
                          controller: emailController),
                      const SizedBox(height: 10),
                      CustomPasswordFormField(
                          hintText: intlStrings.passwordHintText,
                          validator: (password) {
                            return validator.signInPasswordValidator(password);
                          },
                          controller: passwordController),
                      const SizedBox(height: 10),
                      CustomPasswordFormField(
                          hintText: intlStrings.editDetailsNewPasswordHintText,
                          validator: (password) {
                            return validator.signUpPasswordValidator(password);
                          },
                          controller: newPasswordController),
                      const SizedBox(height: 10),
                      CustomPasswordFormField(
                          hintText:
                              intlStrings.editDetailsConfirmNewPasswordHintText,
                          validator: (password) {
                            return validator.confirmPasswordValidator(
                                newPasswordController.text, password);
                          },
                          controller: confirmNewPasswordController)
                    ]),
              ),
            ),
            barrierDismissible: true,
            actions: CustomDialogActions(onCancel: () {
              emailController.clear();
              passwordController.clear();
              newPasswordController.clear();
              confirmNewPasswordController.clear();
              Navigator.of(context).pop();
            }, onSave: () {
              if (formKey.currentState!.validate()) {
                editDetailsBloc.add(EditDetailsUpdatePassword(
                    email: emailController.text,
                    newPassword: newPasswordController.text,
                    password: passwordController.text));
                emailController.clear();
                passwordController.clear();
                newPasswordController.clear();
                Navigator.of(context).pop();
              }
            }));
      },
    );
  }
}
