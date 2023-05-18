import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/modules/auth/util/login_form_validator.dart';
import 'package:up_invest_front/app/modules/auth/widgets/custom_elevated_button.dart';
import 'package:up_invest_front/app/modules/auth/widgets/custom_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _validator = LoginFormValidator();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
                controller: _emailController,
                label: 'Enter your email',
                validator: (email) {
                  return _validator.emailValidator(email);
                }),
            const SizedBox(
              height: 11,
            ),
            CustomTextFormField(
              controller: _passwordController,
              label: 'Enter your password',
              validator: (password) {
                return _validator.passwordValidator(password);
              },
              obscureText: true,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_ForgotPassword()],
            ),
            const SizedBox(
              height: 10,
            ),
            CustomElevatedButton(
              text: 'Login',
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
            ),
            const SizedBox(height: 10),
          ],
        ));
  }
}

class _ForgotPassword extends StatelessWidget {
  const _ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Modular.to.navigate('/auth/recover_password'),
      child: Text(
        'Forgot Password?',
        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
