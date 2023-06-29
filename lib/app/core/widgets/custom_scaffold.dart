import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/widgets/custom_bottom_navigator_bar.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/core/widgets/logout_widget.dart';

class CustomScaffold extends StatelessWidget {
  final String appBarTitle;
  final Widget widget;
  final double leftPadding;
  final double rightPadding;
  final Color backgroundColor;
  final Color textColor;

  const CustomScaffold(
      {super.key,
      required this.appBarTitle,
      required this.widget,
      this.leftPadding = 30,
      this.rightPadding = 30,
      required this.backgroundColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final size = MediaQuery.sizeOf(context);
    final systemBarSize = MediaQuery.viewPaddingOf(context).top;
    final bottomBarSize = MediaQuery.viewPaddingOf(context).bottom;

    return Scaffold(
        bottomNavigationBar: const CustomBottomNavigatorBar(),
        drawer: const CustomDrawer(),
        appBar: AppBar(
          title: Text(
            appBarTitle,
            style: TextStyle(
                color: textColor, fontSize: 25, fontWeight: FontWeight.w400),
          ),
          backgroundColor: backgroundColor,
          elevation: 0,
        ),
        body: SafeArea(
            child: Padding(
                padding:
                    EdgeInsets.only(left: leftPadding, right: rightPadding),
                child: SizedBox(
                  height: size.height - systemBarSize - bottomBarSize,
                  width: size.width,
                  child: widget,
                ))));
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final authBloc = Modular.get<AuthBloc>();
    final authUser = authBloc.state.authUser;
    final size = MediaQuery.sizeOf(context);
    final systemBarSize = MediaQuery.viewPaddingOf(context).top;
    final bottomBarSize = MediaQuery.viewPaddingOf(context).bottom;
    const double profileCardSize = 180;
    final intlStrings = IntlStrings.current;

    return NavigationDrawer(
      backgroundColor: colorScheme.primaryContainer,
      children: [
        SizedBox(
          height: profileCardSize,
          child: Column(
            children: [
              CircleAvatar(
                  radius: 51,
                  backgroundColor: colorScheme.tertiary,
                  child: CircleAvatar(
                    backgroundColor: colorScheme.tertiary,
                    radius: 50,
                    backgroundImage: authBloc.state is AuthLoggedIn
                        ? FileImage((authBloc.state as AuthLoggedIn).avatar)
                        : null,
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(authUser == null ? '' : authUser.displayName,
                  style: TextStyle(
                      color: colorScheme.onPrimaryContainer,
                      fontSize: 20,
                      fontWeight: FontWeight.w400)),
              Text(authUser == null ? '' : authUser.email,
                  style: TextStyle(
                      color: colorScheme.onPrimaryContainer,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              const SizedBox(height: 20),
            ],
          ),
        ),
        Container(
          color: colorScheme.background,
          height: size.height - systemBarSize - bottomBarSize - profileCardSize,
          child: Material(
            color: Colors.transparent,
            child: Column(children: [
              _DropDownRowButton(
                title: intlStrings.dropDownMenuHome,
                path: '/home',
                argumentIndex: 0,
                iconImage: 'assets/icons/home_icon.png',
              ),
              _DropDownRowButton(
                title: intlStrings.dropDownMenuDashboard,
                path: '/settings',
                argumentIndex: 1,
                iconImage: 'assets/icons/dashboard_icon.png',
              ),
              _DropDownRowButton(
                title: intlStrings.dropDownMenuPortfolio,
                path: '/settings',
                argumentIndex: 2,
                iconImage: 'assets/icons/port_icon.png',
              ),
              _DropDownRowButton(
                title: intlStrings.dropDownMeuGoals,
                path: '/settings',
                argumentIndex: 3,
                iconImage: 'assets/icons/goal.png',
              ),
              _DropDownRowButton(
                title: intlStrings.dropDownMenuAchievements,
                path: '/settings',
                argumentIndex: 3,
                iconImage: 'assets/icons/badge.png',
              ),
              _DropDownRowButton(
                title: intlStrings.dropDownMenuSettings,
                path: '/settings',
                argumentIndex: 4,
                iconImage: 'assets/icons/config_icon.png',
              ),
              const SizedBox(height: 30),
              const LoggoutWidget(),
            ]),
          ),
        ),
      ],
    );
  }
}

class _DropDownRowButton extends StatelessWidget {
  const _DropDownRowButton({
    required this.path,
    required this.argumentIndex,
    required this.iconImage,
    required this.title,
  });
  final String path;
  final int argumentIndex;
  final String iconImage;
  final String title;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 20),
      child: InkWell(
        onTap: () {
          Modular.to.pop();
          Modular.to.pushNamed(path, arguments: argumentIndex);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ImageIcon(color: colorScheme.outline, AssetImage(iconImage)),
            const SizedBox(width: 30),
            Text(
              title,
              style: TextStyle(fontSize: 20, color: colorScheme.outline),
            )
          ],
        ),
      ),
    );
  }
}
