import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/widgets/custom_text_form_field.dart';
import 'package:up_invest_front/app/core/widgets/custom_snack_bar.dart';
import 'package:up_invest_front/app/core/widgets/loading/loading_screen.dart';
import 'package:up_invest_front/app/modules/auth/bloc/recovery_password/recover_password_bloc.dart';

import 'package:up_invest_front/app/core/util/validator.dart';
import 'package:up_invest_front/app/modules/auth/widgets/custom_auth_scaffold.dart';
import 'package:up_invest_front/app/core/widgets/custom_elevated_button.dart';

import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({super.key});

  @override
  State<RecoverPasswordPage> createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _recoverPasswordBloc = Modular.get<RecoverPasswordBloc>();
  final _customBar = CustomSnackBar();
  final _validator = Validator();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final systemBarSize = MediaQuery.viewPaddingOf(context).top;
    final bottomBarSize = MediaQuery.viewPaddingOf(context).bottom;
    final appBarSize = AppBar().preferredSize.height;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final intlString = IntlStrings.of(context);

    return BlocListener<RecoverPasswordBloc, RecoverPasswordState>(
        bloc: _recoverPasswordBloc,
        listener: (context, state) {
          final hideLoadingScreen = LoadingScreen.instance().hide();
          return switch (state) {
            RecoverPasswordIdle() => hideLoadingScreen,
            RecoverPasswordLoading() => {
                LoadingScreen.instance()
                    .show(context: context, text: intlString.loading)
              },
            RecoverPasswordError(authError: final authError) => {
                hideLoadingScreen,
                _customBar.showBottomErrorSnackBar(
                    authError.dialogTitle, authError.dialogText, context)
              },
            RecoverPasswordSuccess(authSuccess: final authSuccess) => {
                _customBar.showBottomSuccessSnackBar(
                    authSuccess.dialogTitle, authSuccess.dialogText, context)
              }
          };
        },
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: CustomAuthScaffold(
            onPressed: () => Modular.to.navigate('/auth/'),
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
                          intlString.forgotPassword,
                          style: TextStyle(
                              color: colorScheme.onBackground,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          intlString.recoverPasswordBody,
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
                                  hintText: intlString.emailHintText,
                                  validator: (email) {
                                    return _validator.emailValidator(email);
                                  }),
                              const SizedBox(height: 15),
                              CustomElevatedButton(
                                  text: intlString.submitButton,
                                  onPressed: () => {
                                        if (_formKey.currentState!.validate())
                                          _recoverPasswordBloc.add(
                                              RecoverPasswordSendEmail(
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
          ),
        ));
  }
}
