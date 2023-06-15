import 'package:flutter/material.dart';

Future<T?> showCustomDialog<T>({
  required BuildContext context,
  required String title,
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
          title: Column(
            children: [
              Center(
                  child: Text(
                title,
                style: TextStyle(color: colorScheme.onBackground),
              )),
              const SizedBox(height: 18),
              Divider(height: 1, color: colorScheme.outline),
            ],
          ),
          content: content,
          actions: actions == null ? null : [actions],
        );
      });
}
