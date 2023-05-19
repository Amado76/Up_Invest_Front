// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String? Function(String?) validator;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyBoardType;

  const CustomTextFormField(
      {Key? key,
      required this.hintText,
      required this.validator,
      this.obscureText = false,
      required this.controller,
      this.keyBoardType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colarScheme = theme.colorScheme;
    return TextFormField(
      keyboardType: keyBoardType,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: colarScheme.onSecondaryContainer),
      decoration: InputDecoration(
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
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}
