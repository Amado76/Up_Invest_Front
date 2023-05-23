import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/widgets/custom_snack_bar.dart';
import 'package:up_invest_front/app/core/widgets/loading/loading_screen.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_event.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_form_validator.dart';
import 'package:up_invest_front/app/modules/auth/widgets/custom_auth_scaffold.dart';
import 'package:up_invest_front/app/modules/auth/widgets/custom_elevated_button.dart';
import 'package:up_invest_front/app/modules/auth/widgets/custom_text_form_field.dart';

import '../bloc/auth_state.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({super.key});

  @override
  State<RecoverPasswordPage> createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _authBloc = Modular.get<AuthBloc>();
  final _customBar = CustomSnackBar();
  final _validator = AuthFormValidator();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final systemBarSize = MediaQuery.of(context).viewPadding.top;
    final bottomBarSize = MediaQuery.of(context).viewPadding.bottom;
    final appBarSize = AppBar().preferredSize.height;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocConsumer<AuthBloc, AuthState>(
      bloc: _authBloc,
      listener: (context, state) {
        if (state is AuthStateLoggedOut) {
          Modular.to.navigate('/auth/');
        }
        final authError = state.authError;
        if (authError != null) {
          _customBar.showBottomErrorSnackBar(
              authError.dialogTitle, authError.dialogText, context);
        }
        final authSuccess = state.authSuccess;
        if (authSuccess != null) {
          _customBar.showBottomSuccessSnackBar(
              authSuccess.dialogTitle, authSuccess.dialogText, context);
        }
        if (state.isLoading == true) {
          LoadingScreen.instance().show(context: context, text: 'Loading...');
        } else {
          LoadingScreen.instance().hide();
        }
      },
      builder: (context, state) {
        return CustomAuthScaffold(
          onPressed: () => _authBloc.add(const AuthEventGoToSignInPage()),
          widget: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: SingleChildScrollView(
              child: SizedBox(
                height:
                    size.height - appBarSize - bottomBarSize - systemBarSize,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                            height: 220,
                            child: Image.asset(
                                'assets/images/forgot_password.png')),
                      ),
                      Text(
                        'Forgot your password?',
                        style: TextStyle(
                            color: colorScheme.onBackground,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        'No problem! Just enter your email \nand our astronauts will send you a recovery code!',
                        style: TextStyle(
                            color: colorScheme.onBackground, fontSize: 20),
                      ),
                      const Expanded(child: SizedBox()),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextFormField(
                                controller: _emailController,
                                keyBoardType: TextInputType.emailAddress,
                                hintText: 'Email',
                                validator: (email) {
                                  return _validator.emailValidator(email);
                                }),
                            const SizedBox(height: 15),
                            CustomElevatedButton(
                                text: 'Submit!!',
                                onPressed: () => {
                                      if (_formKey.currentState!.validate())
                                        _authBloc.add(
                                            AuthEventSendPasswordResetEmail(
                                                email: _emailController.text))
                                    }),
                          ],
                        ),
                      ),
                      const SizedBox(height: 100),
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
