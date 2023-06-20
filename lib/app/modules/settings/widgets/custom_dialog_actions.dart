import 'package:flutter/material.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';

class CustomDialogActions extends StatelessWidget {
  final void Function() onCancel;
  final Icon? onCancelIcon;
  final void Function() onSave;
  final Widget? onSaveText;
  final Icon? onSaveIcon;

  const CustomDialogActions({
    super.key,
    required this.onCancel,
    required this.onSave,
    this.onSaveText,
    this.onSaveIcon,
    this.onCancelIcon,
  });

  @override
  Widget build(BuildContext context) {
    final IntlStrings intlStrings = IntlStrings.current;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OutlinedButton.icon(
            onPressed: onCancel,
            icon: onCancelIcon ?? const Icon(Icons.cancel_outlined),
            label: Text(intlStrings.cancelButton)),
        OutlinedButton.icon(
            onPressed: onSave,
            icon: onSaveIcon ?? const Icon(Icons.save_alt_outlined),
            label: onSaveText ?? Text(intlStrings.saveButton)),
      ],
    );
  }
}
