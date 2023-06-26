import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomBottomNavigatorBar extends StatefulWidget {
  const CustomBottomNavigatorBar({super.key});

  @override
  State<CustomBottomNavigatorBar> createState() =>
      _CustomBottomNavigatorBarState();
}

class _CustomBottomNavigatorBarState extends State<CustomBottomNavigatorBar> {
  int _selectedMenu = Modular.args.data ?? 4;

  @override
  void initState() {
    if (Modular.routerDelegate.path == '/home/') {
      _selectedMenu = 0;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return BottomAppBar(
        height: 70,
        color: colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Visibility(
                    visible: _selectedMenu == 0,
                    child: Container(
                      color: colorScheme.primary,
                      height: 3,
                      width: 30,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  IconButton(
                      onPressed: () {
                        Modular.to.navigate('/home/', arguments: 0);
                      },
                      icon: ImageIcon(
                          color: _selectedMenu == 0
                              ? colorScheme.primary
                              : colorScheme.outline,
                          const AssetImage('assets/icons/home_icon.png'))),
                ],
              ),
              Column(
                children: [
                  Visibility(
                    visible: _selectedMenu == 1,
                    child: Container(
                      color: colorScheme.primary,
                      height: 3,
                      width: 30,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                          color: _selectedMenu == 1
                              ? colorScheme.primary
                              : colorScheme.outline,
                          const AssetImage('assets/icons/dashboard_icon.png'))),
                ],
              ),
              Column(
                children: [
                  Visibility(
                    visible: _selectedMenu == 2,
                    child: Container(
                      color: colorScheme.primary,
                      height: 3,
                      width: 30,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                          color: _selectedMenu == 2
                              ? colorScheme.primary
                              : colorScheme.outline,
                          const AssetImage('assets/icons/port_icon.png'))),
                ],
              ),
              Column(
                children: [
                  Visibility(
                    visible: _selectedMenu == 3,
                    child: Container(
                      color: colorScheme.primary,
                      height: 3,
                      width: 30,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                          color: _selectedMenu == 3
                              ? colorScheme.primary
                              : colorScheme.outline,
                          const AssetImage('assets/icons/goal.png'))),
                ],
              ),
              Column(
                children: [
                  Visibility(
                    visible: _selectedMenu == 4,
                    child: Container(
                      color: colorScheme.primary,
                      height: 3,
                      width: 30,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  IconButton(
                      onPressed: () {
                        Modular.to.pushNamed('/settings/', arguments: 4);
                      },
                      icon: ImageIcon(
                          color: _selectedMenu == 4
                              ? colorScheme.primary
                              : colorScheme.outline,
                          const AssetImage('assets/icons/config_icon.png'))),
                ],
              ),
            ],
          ),
        ));
  }
}
