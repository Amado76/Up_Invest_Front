import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final settingsBloc = Modular.get<SettingsBloc>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final size = MediaQuery.of(context).size;
    final systemBarSize = MediaQuery.of(context).viewPadding.top;
    final bottomBarSize = MediaQuery.of(context).viewPadding.bottom;
    final authBloc = Modular.get<AuthBloc>();
    final currentAuthState = authBloc.state as AuthStateLoggedIn;
    final settingsBloc = Modular.get<SettingsBloc>();

    final intlStrings = IntlStrings.of(context);
    String? languageCode;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            intlStrings.settingsAppBarTitle,
            style: TextStyle(
                color: colorScheme.onBackground,
                fontSize: 25,
                fontWeight: FontWeight.w400),
          ),
          backgroundColor: colorScheme.background,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    Modular.to.pop();
                  },
                  icon: ImageIcon(
                    color: colorScheme.onBackground,
                    const AssetImage('assets/icons/short_left.png'),
                  )),
            ),
          ),
        ),
        backgroundColor: colorScheme.background,
        body: BlocConsumer<SettingsBloc, SettingsState>(
            bloc: settingsBloc,
            listener: (context, state) {
              if (state is SettingsStateGlobal) {
                languageCode = state.settingsModel.locale == null
                    ? 'en'
                    : state.settingsModel.locale!.languageCode;
              }
            },
            builder: (context, state) {
              if (state is SettingsStateGlobal) {
                languageCode = state.settingsModel.locale == null
                    ? 'en'
                    : state.settingsModel.locale!.languageCode;
              }

              return SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: SizedBox(
                      height: size.height - systemBarSize - bottomBarSize,
                      width: size.width,
                      child: Column(children: [
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: colorScheme.tertiary,
                                radius: 50,
                                backgroundImage: NetworkImage(
                                    currentAuthState.authUser.avatar)),
                            const SizedBox(width: 10),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentAuthState.authUser.displayName,
                                    style: TextStyle(
                                        color: colorScheme.onBackground,
                                        fontSize: 18,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    currentAuthState.authUser.email,
                                    style: TextStyle(
                                        color: colorScheme.outline,
                                        fontSize: 12,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ]),
                            const Expanded(child: SizedBox()),
                            IconButton(
                                onPressed: () {},
                                icon: ImageIcon(
                                  color: colorScheme.onBackground,
                                  const AssetImage(
                                      'assets/icons/short_right.png'),
                                ))
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  color: colorScheme.outline, height: 1),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              intlStrings.settingsAppBarTitle,
                              style: TextStyle(
                                  color: colorScheme.outline,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const _SettingsIcon(icon: Icons.language),
                            const SizedBox(width: 10),
                            Text(
                              intlStrings.settingsLanguage,
                              style: TextStyle(
                                  color: colorScheme.outline, fontSize: 17),
                            ),
                            const Expanded(child: SizedBox()),
                            PopupMenuButton(
                              itemBuilder: ((context) => [
                                    PopupMenuItem(
                                      value: 'English',
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/icons/england_flag.png',
                                            height: 20,
                                            width: 20,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            intlStrings.settignsEnglish,
                                            style: TextStyle(
                                                color: colorScheme.onBackground,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: 'English',
                                      child:
                                          Text(intlStrings.settignsPortuguese),
                                    ),
                                    PopupMenuItem(
                                      value: 'Spanish',
                                      child: Text(intlStrings.settignsSpanish),
                                    ),
                                  ]),
                              child: Text(
                                languageCode == 'en'
                                    ? 'English'
                                    : languageCode == 'pt'
                                        ? 'Português'
                                        : 'Español',
                                style: TextStyle(
                                    color: colorScheme.primary, fontSize: 16),
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                ),
              );
            }));
  }
}

class _SettingsIcon extends StatelessWidget {
  final IconData icon;
  const _SettingsIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: colorScheme.outline.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Icon(
        icon,
        color: colorScheme.secondary,
      ),
    );
  }
}
