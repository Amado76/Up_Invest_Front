import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SettingsScaffold extends StatelessWidget {
  final String appBarTitle;
  final Widget widget;
  const SettingsScaffold(
      {super.key, required this.appBarTitle, required this.widget});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final size = MediaQuery.sizeOf(context);
    final systemBarSize = MediaQuery.viewPaddingOf(context).top;
    final bottomBarSize = MediaQuery.viewPaddingOf(context).bottom;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            appBarTitle,
            style: TextStyle(
                color: colorScheme.onBackground,
                fontSize: 25,
                fontWeight: FontWeight.w400),
          ),
          backgroundColor: colorScheme.background,
          elevation: 0,
          leading: FittedBox(
            fit: BoxFit.cover,
            child: IconButton(
                onPressed: () {
                  Modular.to.pop();
                },
                icon: ImageIcon(
                  color: colorScheme.onBackground,
                  const AssetImage('assets/icons/short_left.png'),
                )),
          ),
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: SizedBox(
                  height: size.height - systemBarSize - bottomBarSize,
                  width: size.width,
                  child: widget,
                ))));
  }
}
