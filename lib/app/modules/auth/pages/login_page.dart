import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:up_invest_front/app/modules/auth/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final systemBarSize = MediaQuery.of(context).viewPadding.top;
    final bottomBarSize = MediaQuery.of(context).viewPadding.bottom;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceVariant,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: SizedBox(
              height: size.height - systemBarSize - bottomBarSize,
              width: size.width,
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    'assets/images/logo_up_invest.png',
                    alignment: Alignment.center,
                  ),
                  const SizedBox(height: 100),
                  const LoginForm(),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: colorScheme.onSurfaceVariant,
                          height: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          'Ou continue com',
                          style: TextStyle(color: colorScheme.onSurfaceVariant),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: colorScheme.onSurface,
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
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/logo_apple.png'),
                        iconSize: 55,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      'Não possui uma conta?',
                      style: TextStyle(color: colorScheme.onSurfaceVariant),
                    ),
                    TextButton(
                      child: Text(
                        'Cadastre-se',
                        style: TextStyle(color: colorScheme.secondary),
                      ),
                      onPressed: () => Modular.to.navigate('/auth/sing_up'),
                    )
                  ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
