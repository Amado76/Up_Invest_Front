import 'package:flutter/material.dart';

class CustomSettingsIcon extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;

  const CustomSettingsIcon({super.key, required this.icon, this.iconColor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: colorScheme.outline.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Icon(
        icon,
        color: iconColor ?? colorScheme.primary,
      ),
    );
  }
}
