import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/widgets/custom_snack_bar.dart';
import 'package:up_invest_front/app/core/widgets/loading/loading_screen.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_event.dart';

import 'package:up_invest_front/app/modules/auth/widgets/choose_your_avatar_widget.dart';
import 'package:up_invest_front/app/modules/auth/widgets/custom_auth_scaffold.dart';
import 'package:up_invest_front/app/modules/auth/widgets/sign_up_form.dart';

import '../bloc/auth_state.dart';

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
    String? avatar;
    final customBar = CustomSnackBar();
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: authBloc,
      listener: (context, state) {
        if (state is AuthStateLoggedIn) {
          Modular.to.navigate('/home/');
        }
        if (state is AuthStateLoggedOut) {
          Modular.to.navigate('/auth/');
        }
        if (state is AuthStateSigningUp) {
          avatar = state.avatar;
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
      builder: (context, state) {
        if (state is AuthStateSigningUp) {
          avatar = state.avatar;
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
                    Text('Enter your details',
                        style: TextStyle(
                            color: colorScheme.onBackground,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    Text('You can edit them later!',
                        style: TextStyle(
                            color: colorScheme.onBackground,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 25),
                    ChooseYourAvatarWidget(
                      avatarImage: avatar ?? 'assets/avatars/man.png',
                    ),
                    const SizedBox(height: 10),
                    const SingUpForm(),
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
