import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/widgets/loading/loading_screen.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_event.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_state.dart';
import 'package:up_invest_front/app/modules/auth/widgets/login_form.dart';

import '../../../core/widgets/custom_snack_bar.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInState();
}

class _SignInState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final systemBarSize = MediaQuery.of(context).viewPadding.top;
    final bottomBarSize = MediaQuery.of(context).viewPadding.bottom;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final authBloc = Modular.get<AuthBloc>();
    final customBar = CustomSnackBar();

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: BlocListener<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (context, state) {
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

          if (state is AuthStateLoggedIn) {
            Modular.to.navigate('/home/');
          }
          if (state is AuthStateSigningUp) {
            Modular.to.navigate('/auth/sign_up');
          }
          if (state is AuthStateRecoverPassword) {
            Modular.to.navigate('/auth/recover_password');
          }
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
                      'assets/images/logo_up_invest.png',
                      alignment: Alignment.center,
                    ),
                    const SizedBox(height: 50),
                    const LoginForm(),
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
                            'Or sign in with',
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
                          icon: Image.asset('assets/images/logo_facebook.png'),
                          iconSize: 55,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/logo_google.png'),
                          iconSize: 55,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: colorScheme.onBackground),
                      ),
                      TextButton(
                        child: Text(
                          'Sign up!',
                          style: TextStyle(color: colorScheme.primary),
                        ),
                        onPressed: () =>
                            authBloc.add(const AuthEventGoToSignUpPage()),
                      )
                    ])
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
