import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/util/validator.dart';
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
