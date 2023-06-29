import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:up_invest_front/app/core/widgets/custom_scaffold/custom_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return CustomScaffold(
      appBarTitle: 'Home',
      backgroundColor: colorScheme.primary,
      textColor: colorScheme.onPrimary,
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                Modular.to.pushNamed('/settings/');
              },
              child: const Text('Go to Settings')),
        ],
      ),
    );
  }
}
