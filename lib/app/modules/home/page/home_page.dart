import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/widgets/custom_password_form_field.dart';
import 'package:up_invest_front/app/core/widgets/custom_text_form_field.dart';
import 'package:up_invest_front/app/core/widgets/snackbar/custom_snack_bar.dart';
import 'package:up_invest_front/app/core/widgets/loading/loading_screen.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_model.dart';

import 'package:up_invest_front/app/core/util/validator.dart';

import '../../auth/model/auth_user_model.dart';
import '../../../core/widgets/custom_elevated_button.dart';

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
    final formKey2 = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final passwordController2 = TextEditingController();
    final validator = Validator();
    final customBar = CustomSnackBar();

    AuthUserModel? authUser = authBloc.state is AuthLoggedIn
        ? (authBloc.state as AuthLoggedIn).authUser
        : null;
    authUser ??= const AuthUserModel(
      userId: 'userId',
      email: '',
      token: 'token',
      displayName: 'displayName',
      avatar: CustomAvatar(id: 9, path: 'path', url: 'url'),
      signInMethod: 'signInMethod',
      isEmailVerified: true,
    );
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (context, state) {
          final hideLoading = LoadingScreen.instance().hide();
          return switch (state) {
            AuthLoggedIn() => hideLoading,
            AuthLoggedOut() => {hideLoading, Modular.to.navigate('/auth')},
            AuthLoading() => LoadingScreen.instance()
                .show(context: context, text: 'Loading...'),
            AuthErrorState(authError: final authError) => {
                customBar.showBottomErrorSnackBar(
                    authError.dialogTitle, authError.dialogText, context)
              },
            AuthSuccessState(authSucess: final authSuccess) => {
                customBar.showBottomSuccessSnackBar(
                    authSuccess.dialogTitle, authSuccess.dialogText, context)
              }
          };
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
                    'Sign In! email:${authUser.email}, ${authUser.displayName}, ${authUser.avatar}')),
            TextButton(
                onPressed: () {
                  authBloc.add(const AuthLogOut());
                },
                child: const Text('Loggout')),
            TextButton(
                onPressed: () {
                  Modular.to.pushNamed('/settings/');
                },
                child: const Text('Go to Settings')),
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
                      text: 'Delete Account ',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          authBloc.add(AuthDeleteAccount(
                              email: emailController.text,
                              password: passwordController.text));
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                )),
            Form(
                key: formKey2,
                child: Column(
                  children: [
                    CustomPasswordFormField(
                        hintText: 'Password',
                        keyBoardType: TextInputType.visiblePassword,
                        controller: passwordController2,
                        validator: (password) {
                          return validator.signInPasswordValidator(password);
                        }),
                    const SizedBox(
                      height: 11,
                    ),
                    CustomPasswordFormField(
                        hintText: 'New Password',
                        controller: newPasswordController,
                        validator: (password) {
                          return validator.signInPasswordValidator(password);
                        }),
                    const SizedBox(height: 10),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
