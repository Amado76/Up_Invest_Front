import 'package:flutter/material.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';

class CustomDialogActions extends StatelessWidget {
  final void Function() onCancel;
  final void Function() onSave;
  const CustomDialogActions(
      {super.key, required this.onCancel, required this.onSave});

  @override
  Widget build(BuildContext context) {
    final IntlStrings intlStrings = IntlStrings.current;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OutlinedButton.icon(
            onPressed: onCancel,
            icon: const Icon(Icons.cancel_outlined),
            label: Text(intlStrings.cancelButton)),
        OutlinedButton.icon(
            onPressed: onSave,
            icon: const Icon(Icons.save_alt_outlined),
            label: Text(intlStrings.saveButton)),
      ],
    );
  }
}
