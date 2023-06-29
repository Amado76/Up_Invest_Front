import 'package:flutter/material.dart';
import 'package:up_invest_front/app/core/widgets/custom_bottom_navigator_bar.dart';
import 'package:up_invest_front/app/core/widgets/custom_scaffold/custom_drawer.dart';

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
