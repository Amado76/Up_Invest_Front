import 'package:flutter/material.dart';

class AcceptTermsWidget extends StatefulWidget {
  const AcceptTermsWidget({Key? key}) : super(key: key);

  @override
  State<AcceptTermsWidget> createState() => _AcceptTermsWidgetState();
}

class _AcceptTermsWidgetState extends State<AcceptTermsWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: colorScheme.surfaceVariant,
              fillColor: MaterialStateProperty.resolveWith<Color>(
                  (states) => colorScheme.secondaryContainer),
              checkColor: colorScheme.onSecondaryContainer,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = !isChecked;
                });
              }),
        ),
        Text(
          'I agree to the terms and conditions',
          style: TextStyle(color: colorScheme.onSurfaceVariant),
        ),
      ],
    );
  }
}
