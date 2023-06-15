import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String? Function(String?) validator;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final Widget? icon;
  final String? initialValue;

  const CustomTextFormField(
      {Key? key,
      required this.hintText,
      required this.validator,
      this.obscureText = false,
      required this.controller,
      this.keyBoardType = TextInputType.text,
      this.icon,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colarScheme = theme.colorScheme;
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyBoardType,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      textInputAction: TextInputAction.next,
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: colarScheme.onSecondaryContainer),
      decoration: InputDecoration(
        errorMaxLines: 2,
        prefixIcon: icon,
        fillColor: colarScheme.secondaryContainer,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: colarScheme.outline),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colarScheme.error),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
