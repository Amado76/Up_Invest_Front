import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/util/validator/email_validator.dart';
import 'package:up_invest_front/app/core/util/validator/password_sign_in_validator.dart';
import 'package:up_invest_front/app/core/widgets/custom_password_form_field.dart';
import 'package:up_invest_front/app/core/widgets/custom_text_form_field.dart';
import 'package:up_invest_front/app/core/widgets/loading/loading_screen.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/core/widgets/custom_elevated_button.dart';

import 'package:up_invest_front/app/modules/settings/bloc/settings_bloc.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';

import '../../../core/widgets/custom_snack_bar.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInState();
}

class _SignInState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final systemBarSize = MediaQuery.viewPaddingOf(context).top;
    final bottomBarSize = MediaQuery.viewPaddingOf(context).bottom;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final authBloc = Modular.get<AuthBloc>();
    final settingsBloc = Modular.get<SettingsBloc>();
    final currentTheme = settingsBloc.state.settingsModel.themeMode;
    Brightness systemBrightness = MediaQuery.of(context).platformBrightness;
    final intlString = IntlStrings.of(context);

    final customBar = CustomSnackBar();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.background,
        body: BlocListener<AuthBloc, AuthState>(
          bloc: authBloc,
          listener: (context, state) {
            final hideLoading = LoadingScreen.instance().hide();

            return switch (state) {
              AuthLoggedIn() => {Modular.to.navigate('/home/'), hideLoading},
              AuthLoggedOut() => hideLoading,
              AuthLoading() => LoadingScreen.instance()
                  .show(context: context, text: intlString.loading),
              AuthErrorState(authError: final authError) => {
                  hideLoading,
                  customBar.showBottomErrorSnackBar(
                      authError.dialogTitle, authError.dialogText, context)
                },
              AuthSuccessState(authSuccess: final authSucess) => {
                  hideLoading,
                  customBar.showBottomSuccessSnackBar(
                      authSucess.dialogTitle, authSucess.dialogText, context)
                }
            };
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: SizedBox(
                  height: size.height - systemBarSize - bottomBarSize,
                  width: size.width,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 90,
                      ),
                      Image.asset(
                        currentTheme == ThemeMode.light
                            ? 'assets/images/logo_up_invest.png'
                            : (currentTheme == ThemeMode.system &&
                                    systemBrightness == Brightness.light)
                                ? 'assets/images/logo_up_invest.png'
                                : 'assets/images/logo_up_invest_dark_mode.png',
                        alignment: Alignment.center,
                      ),
                      const SizedBox(height: 50),
                      const _SignInForm(),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: colorScheme.onBackground,
                              height: 2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Text(
                              intlString.signInWith,
                              style: TextStyle(
                                color: colorScheme.onBackground,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: colorScheme.onBackground,
                              height: 2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon:
                                Image.asset('assets/images/logo_facebook.png'),
                            iconSize: 55,
                          ),
                          IconButton(
                            onPressed: () {
                              authBloc.add(const AuthSignInWithSocialNetwork(
                                  socialNetwork: 'google'));
                            },
                            icon: Image.asset('assets/images/logo_google.png'),
                            iconSize: 55,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              intlString.signInDoNotHaveAccount,
                              style: TextStyle(color: colorScheme.onBackground),
                            ),
                            TextButton(
                              child: Text(
                                intlString.signInSignUp,
                                style: TextStyle(color: colorScheme.primary),
                              ),
                              onPressed: () =>
                                  Modular.to.navigate('/auth/sign_up'),
                            )
                          ])
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SignInForm extends StatefulWidget {
  const _SignInForm();

  @override
  State<_SignInForm> createState() => SignInFormState();
}

class SignInFormState extends State<_SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailValidator = EmailValidator();
  final _passwordValidator = PasswordSignInValidator();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = Modular.get<AuthBloc>();
    final intlString = IntlStrings.of(context);
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
                hintText: intlString.emailHintText,
                keyBoardType: TextInputType.emailAddress,
                icon: const Icon(Icons.email_outlined),
                controller: _emailController,
                validator: (email) {
                  return _emailValidator.validate(email);
                }),
            const SizedBox(
              height: 11,
            ),
            CustomPasswordFormField(
              hintText: intlString.passwordHintText,
              controller: _passwordController,
              validator: (password) {
                return _passwordValidator.validate(password);
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
              text: intlString.loginForm,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  authBloc.add(AuthSignInWithEmailAndPassword(
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
    final intlString = IntlStrings.of(context);
    return TextButton(
      onPressed: () => Modular.to.navigate('/auth/recover_password'),
      child: Text(
        intlString.forgotPassword,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
