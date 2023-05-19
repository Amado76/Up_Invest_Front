import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_event.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_state.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final systemBarSize = MediaQuery.of(context).viewPadding.top;
    final bottomBarSize = MediaQuery.of(context).viewPadding.bottom;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final authBloc = Modular.get<AuthBloc>();

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: BlocListener<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (context, state) {
          if (state is AuthStateLoggedIn) {
            Modular.to.navigate('/home/');
          }
          if (state is AuthStateLoggedOut) {
            Modular.to.navigate('/auth/');
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: SizedBox(
                height: size.height - systemBarSize - bottomBarSize,
                child: Column(children: [
                  const Column(
                    children: [
                      SizedBox(height: 20),
                      _AppNameText(),
                      SizedBox(height: 36),
                    ],
                  ),
                  Expanded(
                    child: Image.asset(
                      'assets/images/main.png',
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Take off towards your\n'
                            'Financial Independence',
                            style: TextStyle(
                                color: colorScheme.primary,
                                fontSize: 30,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      const _ButtonGetStarted(),
                      const SizedBox(height: 40),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AppNameText extends StatelessWidget {
  const _AppNameText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.centerEnd,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 77,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                width: 42,
                height: 42,
              ),
            ),
            RichText(
                text: TextSpan(
                    text: 'Up Inv',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 26,
                        fontWeight: FontWeight.w400),
                    children: const [
                  TextSpan(
                      text: 'est',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ))
                ])),
          ],
        ),
      ],
    );
  }
}

class _ButtonGetStarted extends StatelessWidget {
  const _ButtonGetStarted({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final authBloc = Modular.get<AuthBloc>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ElevatedButton.icon(
        icon: const ImageIcon(
            AssetImage(
              'assets/icons/short_right.png',
            ),
            size: 40),
        onPressed: () {
          authBloc.add(const AuthEventIsLogged());
        },
        style: ElevatedButton.styleFrom(
            alignment: Alignment.centerLeft,
            minimumSize: const Size(400, 65),
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        label: const Padding(
          padding: EdgeInsets.only(right: 142),
          child: Text(
            'Begin your journey',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
