import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/util/validator.dart';
import 'package:up_invest_front/app/core/widgets/custom_alert_dialog.dart';
import 'package:up_invest_front/app/core/widgets/custom_text_form_field.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings/edit_details_bloc.dart';
import 'package:up_invest_front/app/modules/settings/widgets/custom_dialog_actions.dart';
import 'package:up_invest_front/app/modules/settings/widgets/edit_details_row.dart';

class EditNameWidget extends StatefulWidget {
  final String name;
  const EditNameWidget({super.key, required this.name});

  @override
  State<EditNameWidget> createState() => _EditNameWidgetState();
}

class _EditNameWidgetState extends State<EditNameWidget> {
  @override
  Widget build(BuildContext context) {
    final IntlStrings intlStrings = IntlStrings.current;
    final TextEditingController nameController = TextEditingController();
    final Validator validator = Validator();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final editDetailsBloc = Modular.get<EditDetailsBloc>();
    return EditDetailsPageRow(
      icon: Icons.person_2_outlined,
      title: intlStrings.nameHintText.toUpperCase(),
      content: widget.name,
      onPressed: () {
        showCustomDialog(
            context: context,
            title: intlStrings.editDetailsChangeDisplayName,
            content: SizedBox(
              height: 110,
              width: 300,
              child: Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                          hintText: intlStrings.nameHintText,
                          validator: (name) {
                            return validator.minNameLengthValidator(name);
                          },
                          controller: nameController)
                    ]),
              ),
            ),
            barrierDismissible: true,
            actions: CustomDialogActions(onCancel: () {
              Navigator.of(context).pop();
            }, onSave: () {
              if (formKey.currentState!.validate()) {
                editDetailsBloc.add(
                    EditDetailsUpdateDisplayName(newName: nameController.text));
                Navigator.of(context).pop();
              }
            }));
      },
    );
  }
}
