import 'package:flutter/material.dart';

Future<T?> showCustomDialog<T>({
  required BuildContext context,
  required Widget title,
  required Widget content,
  Widget? actions,
  barrierDismissible = false,
}) {
  return showDialog<T>(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: colorScheme.background,
          title: title,
          content: content,
          actions: actions == null ? null : [actions],
        );
      });
}
