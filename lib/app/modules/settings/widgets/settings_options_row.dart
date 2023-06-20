import 'package:flutter/material.dart';
import 'package:up_invest_front/app/modules/settings/widgets/custom_settings_icon.dart';

class SettingsOptionsRow extends StatelessWidget {
  final IconData icon;

  final String text;

  final Widget button;
  const SettingsOptionsRow({
    super.key,
    required this.icon,
    required this.text,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomSettingsIcon(
          icon: icon,
        ),
        const SizedBox(width: 10),
        Text(text, style: TextStyle(color: colorScheme.outline, fontSize: 17)),
        const Expanded(child: SizedBox()),
        button,
      ],
    );
  }
}
