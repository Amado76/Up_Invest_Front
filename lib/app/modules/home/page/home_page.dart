import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/widgets/custom_snack_bar.dart';
import 'package:up_invest_front/app/core/widgets/loading/loading_screen.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_event.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_state.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_form_validator.dart';
import 'package:up_invest_front/app/modules/auth/widgets/custom_text_form_field.dart';

import '../../auth/model/auth_user_model.dart';
import '../../auth/widgets/custom_elevated_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authBloc = Modular.get<AuthBloc>();
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final validator = AuthFormValidator();
    final customBar = CustomSnackBar();
    AuthUserModel? authUser = authBloc.state is AuthStateLoggedIn
        ? (authBloc.state as AuthStateLoggedIn).authUser
        : null;
    authUser ??= const AuthUserModel(
      userId: 'userId',
      email: '',
      token: 'token',
      displayName: 'displayName',
      avatarPicture: 'avatarPicture',
      signInMethod: 'signInMethod',
      isEmailVerified: true,
    );
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (context, state) {
          if (state is AuthStateLoggedOut) {
            Modular.to.navigate('/auth');
          }
          if (state.isLoading == true) {
            LoadingScreen.instance().show(context: context, text: 'Loading...');
          } else {
            LoadingScreen.instance().hide();
          }

          final authError = state.authError;
          if (authError != null) {
            customBar.showBottomErrorSnackBar(
                authError.dialogTitle, authError.dialogText, context);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Sign In! email:${authUser.email},')),
            TextButton(
                onPressed: () {
                  authBloc.add(const AuthEventLogOut());
                },
                child: const Text('Loggout')),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                        hintText: 'Email',
                        icon: const Icon(Icons.email_outlined),
                        keyBoardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (email) {
                          return validator.emailValidator(email);
                        }),
                    const SizedBox(
                      height: 11,
                    ),
                    CustomTextFormField(
                      hintText: 'Password',
                      controller: passwordController,
                      validator: (password) {
                        return validator.signInPasswordValidator(password);
                      },
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomElevatedButton(
                      text: 'Delete ACcount ',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          authBloc.add(AuthEventDeleteAccount(
                              email: emailController.text,
                              password: passwordController.text));
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
