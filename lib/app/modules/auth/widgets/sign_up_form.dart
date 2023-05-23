import 'package:flutter/material.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_form_validator.dart';
import 'package:up_invest_front/app/modules/auth/widgets/accept_terms_widget.dart';
import 'package:up_invest_front/app/modules/auth/widgets/custom_elevated_button.dart';
import 'package:up_invest_front/app/modules/auth/widgets/custom_password_form_field.dart';
import 'package:up_invest_front/app/modules/auth/widgets/custom_text_form_field.dart';

class SingUpForm extends StatefulWidget {
  const SingUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SingUpForm> createState() => _SingUpFormState();
}

class _SingUpFormState extends State<SingUpForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  final _avatarController = TextEditingController();

  final _validator = AuthFormValidator();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
              controller: _nameController,
              hintText: 'Name',
              icon: const Icon(Icons.person_2_outlined),
              validator: (name) {
                return _validator.minNameLengthValidator(name);
              }),
          const SizedBox(height: 11),
          CustomTextFormField(
              controller: _emailController,
              keyBoardType: TextInputType.emailAddress,
              hintText: 'Email',
              icon: const Icon(Icons.email_outlined),
              validator: (email) {
                return _validator.emailValidator(email);
              }),
          const SizedBox(height: 11),
          CustomPasswordFormField(
            controller: _passwordController,
            hintText: 'Password',
            validator: (password) {
              return _validator.signUpPasswordValidator(password);
            },
          ),
          const SizedBox(height: 11),
          CustomPasswordFormField(
            controller: _confirmPasswordController,
            hintText: 'Confirm your password',
            validator: (confirmPassword) {
              return _validator.confirmPasswordValidator(
                  _passwordController.text, confirmPassword);
            },
          ),
          const SizedBox(height: 11),
          const AcceptTermsWidget(),
          const SizedBox(height: 10),
          CustomElevatedButton(
              text: 'Submeter!',
              onPressed: () => {
                    if (_formKey.currentState!.validate())
                      {print(_avatarController.text)}
                  })
        ],
      ),
    );
  }
}
