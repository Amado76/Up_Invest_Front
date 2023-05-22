import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_event.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_form_validator.dart';
import 'package:up_invest_front/app/modules/auth/widgets/custom_elevated_button.dart';
import 'package:up_invest_front/app/modules/auth/widgets/custom_password_form_field.dart';
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
  final _validator = AuthFormValidator();

  @override
  Widget build(BuildContext context) {
    final authBloc = Modular.get<AuthBloc>();
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
                hintText: 'Email  ',
                keyBoardType: TextInputType.emailAddress,
                icon: const Icon(Icons.email_outlined),
                controller: _emailController,
                validator: (email) {
                  return _validator.emailValidator(email);
                }),
            const SizedBox(
              height: 11,
            ),
            CustomPasswordFormField(
              hintText: 'Password',
              controller: _passwordController,
              validator: (password) {
                return _validator.signInPasswordValidator(password);
              },
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_ForgotPassword()],
            ),
            const SizedBox(
              height: 10,
            ),
            CustomElevatedButton(
              text: 'Sign In',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  authBloc.add(AuthEventSignInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text));
                }
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
        style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      ),
    );
  }
}
