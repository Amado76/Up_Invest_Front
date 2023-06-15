import 'package:flutter/material.dart';

class CustomPasswordFormField extends StatefulWidget {
  final String hintText;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final TextInputType keyBoardType;

  const CustomPasswordFormField(
      {Key? key,
      required this.hintText,
      required this.validator,
      required this.controller,
      this.keyBoardType = TextInputType.text})
      : super(key: key);

  @override
  State<CustomPasswordFormField> createState() =>
      _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colarScheme = theme.colorScheme;
    return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: widget.keyBoardType,
        controller: widget.controller,
        validator: widget.validator,
        obscureText: obscureText,
        textInputAction: TextInputAction.next,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: colarScheme.onSecondaryContainer),
        decoration: InputDecoration(
          errorMaxLines: 2,
          fillColor: colarScheme.secondaryContainer,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: colarScheme.outline),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colarScheme.error),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          suffixIcon: IconButton(
            icon: obscureText
                ? const Icon(Icons.visibility_off_outlined)
                : const Icon(Icons.visibility_outlined),
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
          prefixIcon: obscureText
              ? const Icon(Icons.lock_outline)
              : const Icon(Icons.lock_open_outlined),
        ));
  }
}
