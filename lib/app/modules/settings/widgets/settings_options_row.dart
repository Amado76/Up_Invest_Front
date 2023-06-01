import 'package:flutter/material.dart';

class SettingsOptionsRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget button;
  const SettingsOptionsRow(
      {super.key,
      required this.icon,
      required this.text,
      required this.button});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _CustomSettingsIcon(icon: icon),
        const SizedBox(width: 10),
        Text(text, style: TextStyle(color: colorScheme.outline, fontSize: 17)),
        const Expanded(child: SizedBox()),
        button,
      ],
    );
  }
}

class _CustomSettingsIcon extends StatelessWidget {
  final IconData icon;
  const _CustomSettingsIcon({required this.icon});

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
        color: colorScheme.tertiary,
      ),
    );
  }
}
