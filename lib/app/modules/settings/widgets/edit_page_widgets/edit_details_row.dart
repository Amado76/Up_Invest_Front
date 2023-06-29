import 'package:flutter/material.dart';

class EditDetailsPageRow extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final void Function() onPressed;

  const EditDetailsPageRow(
      {super.key,
      required this.title,
      required this.content,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: colorScheme.outline.withOpacity(0.1),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                    child: Icon(
                      size: 20,
                      icon,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: TextStyle(
                      color: colorScheme.outline,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                content,
                style: TextStyle(
                  color: colorScheme.outline,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          const Padding(
            padding: EdgeInsets.only(right: 13),
            child: Icon(Icons.edit),
          )
        ],
      ),
    );
  }
}
