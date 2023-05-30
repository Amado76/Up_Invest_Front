import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/widgets/custom_snack_bar.dart';
import 'package:up_invest_front/app/core/widgets/loading/loading_screen.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_form_validator.dart';

import 'package:up_invest_front/app/modules/auth/widgets/custom_auth_scaffold.dart';
import 'package:up_invest_front/app/modules/auth/widgets/custom_elevated_button.dart';
import 'package:up_invest_front/app/modules/auth/widgets/custom_password_form_field.dart';
import 'package:up_invest_front/app/modules/auth/widgets/custom_text_form_field.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final systemBarSize = MediaQuery.of(context).viewPadding.top;
    final bottomBarSize = MediaQuery.of(context).viewPadding.bottom;
    final appBarSize = AppBar().preferredSize.height;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final authBloc = Modular.get<AuthBloc>();
    final intlString = IntlStrings.of(context);

    String? avatar;
    final customBar = CustomSnackBar();
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: authBloc,
      listener: (context, state) {
        final hideLoading = LoadingScreen.instance().hide();

        return switch (state) {
          AuthStateLoggedIn() => {
              Modular.to.navigate('/home/'),
              hideLoading,
            },
          AuthStateSigningUp(isLoading: true) => LoadingScreen.instance()
              .show(context: context, text: intlString.loading),
          AuthStateSigningUp(
            authError: final authError,
            isLoading: false,
            avatarModel: final avatarModel
          ) =>
            {
              hideLoading,
              avatarModel.avatarPath,
              if (authError != null)
                {
                  customBar.showBottomErrorSnackBar(
                      authError.dialogTitle, authError.dialogText, context)
                }
            },
          AuthStateLoggedOut(isLoading: true) => LoadingScreen.instance()
              .show(context: context, text: intlString.loading),
          AuthStateLoggedOut() => Modular.to.navigate('/auth/'),
          AuthStateIdle() => const AuthStateLoggedOut(isLoading: false),
          AuthStateRecoverPassword() =>
            const AuthStateLoggedOut(isLoading: false),
        };
      },
      builder: (context, state) {
        if (state is AuthStateSigningUp) {
          avatar = state.avatarModel.avatarPath;
        }
        return CustomAuthScaffold(
          onPressed: () => authBloc.add(const AuthEventGoToSignInPage()),
          widget: (Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: SizedBox(
              height: size.height - appBarSize - bottomBarSize - systemBarSize,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(intlString.signUpTitle,
                        style: TextStyle(
                            color: colorScheme.onBackground,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    Text(intlString.signUpSubTitle,
                        style: TextStyle(
                            color: colorScheme.onBackground,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 25),
                    _ChooseYourAvatarWidget(
                      avatarImage: avatar ?? 'assets/avatars/man.png',
                    ),
                    const SizedBox(height: 10),
                    const _SingUpForm(),
                  ],
                ),
              ),
            ),
          )),
        );
      },
    );
  }
}

class _ChooseYourAvatarWidget extends StatefulWidget {
  final String avatarImage;
  const _ChooseYourAvatarWidget({
    Key? key,
    required this.avatarImage,
  }) : super(key: key);

  @override
  State<_ChooseYourAvatarWidget> createState() =>
      _ChooseYourAvatarWidgetState();
}

class _ChooseYourAvatarWidgetState extends State<_ChooseYourAvatarWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final authBloc = Modular.get<AuthBloc>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
                backgroundColor: colorScheme.tertiary,
                radius: 90,
                backgroundImage: AssetImage(widget.avatarImage)),
            Positioned(
              top: 140,
              left: 10,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: colorScheme.tertiaryContainer.withOpacity(0.7)),
                child: IconButton(
                    onPressed: () {
                      authBloc.add(const AuthEventChangeAvatar(
                          avatarNavigation: 'BackButton'));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: colorScheme.onBackground,
                    )),
              ),
            ),
            Positioned(
              top: 140,
              left: 130,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: colorScheme.tertiaryContainer.withOpacity(0.7)),
                child: IconButton(
                    onPressed: () {
                      authBloc.add(const AuthEventChangeAvatar(
                          avatarNavigation: 'FowardButton'));
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: colorScheme.onBackground,
                    )),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class _SingUpForm extends StatefulWidget {
  const _SingUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<_SingUpForm> createState() => _SingUpFormState();
}

class _SingUpFormState extends State<_SingUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _authBloc = Modular.get<AuthBloc>();
  final _validator = AuthFormValidator();

  @override
  Widget build(BuildContext context) {
    final intlStrings = IntlStrings.of(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
              controller: _nameController,
              hintText: intlStrings.nameHintText,
              icon: const Icon(Icons.person_2_outlined),
              validator: (name) {
                return _validator.minNameLengthValidator(name);
              }),
          const SizedBox(height: 11),
          CustomTextFormField(
              controller: _emailController,
              keyBoardType: TextInputType.emailAddress,
              hintText: intlStrings.emailHintText,
              icon: const Icon(Icons.email_outlined),
              validator: (email) {
                return _validator.emailValidator(email);
              }),
          const SizedBox(height: 11),
          CustomPasswordFormField(
            controller: _passwordController,
            hintText: intlStrings.passwordHintText,
            validator: (password) {
              return _validator.signUpPasswordValidator(password);
            },
          ),
          const SizedBox(height: 11),
          CustomPasswordFormField(
            controller: _confirmPasswordController,
            hintText: intlStrings.confirmYourPasswordHintText,
            validator: (confirmPassword) {
              return _validator.confirmPasswordValidator(
                  _passwordController.text, confirmPassword);
            },
          ),
          const SizedBox(height: 11),
          const _AcceptTermsWidget(),
          const SizedBox(height: 10),
          CustomElevatedButton(
              text: intlStrings.submitButton,
              onPressed: () => {
                    if (_formKey.currentState!.validate())
                      _authBloc.add(AuthEventCreateAccount(
                          email: _emailController.text,
                          password: _passwordController.text,
                          displayName: _nameController.text))
                  })
        ],
      ),
    );
  }
}

class _AcceptTermsWidget extends StatefulWidget {
  const _AcceptTermsWidget({Key? key}) : super(key: key);

  @override
  State<_AcceptTermsWidget> createState() => _AcceptTermsWidgetState();
}

class _AcceptTermsWidgetState extends State<_AcceptTermsWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: colorScheme.surfaceVariant,
              fillColor: MaterialStateProperty.resolveWith<Color>(
                  (states) => colorScheme.secondaryContainer),
              checkColor: colorScheme.onSecondaryContainer,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = !isChecked;
                });
              }),
        ),
        Text(
          IntlStrings.of(context).signUpAgreeTerms,
          style: TextStyle(color: colorScheme.onSurfaceVariant),
        ),
      ],
    );
  }
}
