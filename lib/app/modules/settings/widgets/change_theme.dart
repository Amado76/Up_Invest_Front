// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings_bloc.dart';
import 'package:up_invest_front/app/modules/settings/widgets/settings_options_row.dart';

class ChangeTheme extends StatelessWidget {
  const ChangeTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsBloc = context.watch<SettingsBloc>((bloc) => bloc.stream);
    final currentAuthState = settingsBloc.state as SettingsStateGlobal;
    ThemeMode themeMode = currentAuthState.settingsModel.themeMode;
    Brightness systemBrightness = MediaQuery.of(context).platformBrightness;
    final inltStrings = IntlStrings.of(context);

    IconData getTheme(ThemeMode themeMode, Brightness systemBrightness) {
      if (themeMode == ThemeMode.dark) {
        return Icons.dark_mode_outlined;
      }
      if (themeMode == ThemeMode.system) {
        return systemBrightness == Brightness.dark
            ? Icons.dark_mode_outlined
            : Icons.light_mode_outlined;
      }
      return Icons.light_mode_outlined;
    }

    String getString(ThemeMode themeMode, Brightness systemBrightness) {
      if (themeMode == ThemeMode.dark) {
        return inltStrings.settingsDark;
      }
      if (themeMode == ThemeMode.system) {
        return systemBrightness == Brightness.dark
            ? inltStrings.settingsDark
            : inltStrings.settingsLight;
      }
      return inltStrings.settingsLight;
    }

    return SettingsOptionsRow(
      icon: getTheme(themeMode, systemBrightness),
      text: getString(themeMode, systemBrightness),
      button: _ChangeThemeButton(
        isNight:
            getString(themeMode, systemBrightness) == 'dark' ? 'dark' : 'light',
      ),
    );
  }
}

class _ChangeThemeButton extends StatefulWidget {
  final String isNight;

  const _ChangeThemeButton({
    required this.isNight,
    Key? key,
  }) : super(key: key);

  @override
  State<_ChangeThemeButton> createState() => _ChangeThemeButtonState();
}

class _ChangeThemeButtonState extends State<_ChangeThemeButton> {
  final double _switchWidth = 60;
  final double _switchHeight = 30;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Duration _animationDurationThumb = const Duration(milliseconds: 100);

  @override
  Widget build(BuildContext context) {
    final settingsBloc = context.watch<SettingsBloc>((bloc) => bloc.stream);
    final currentTheme = settingsBloc.state.settingsModel.themeMode;
    Brightness systemBrightness = MediaQuery.of(context).platformBrightness;

    bool isNight = currentTheme == ThemeMode.dark
        ? true
        : (currentTheme == ThemeMode.system &&
                systemBrightness == Brightness.dark)
            ? true
            : false;

    void onTapSwitch() {
      isNight = !isNight;
      settingsBloc
          .add(SettingsEventChangeTheme(theme: isNight ? 'dark' : 'light'));
    }

    return SizedBox(
      width: _switchWidth,
      height: _switchHeight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onTapSwitch,
            child: SizedBox(
              width: _switchWidth,
              height: _switchHeight,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: _animationDuration,
                    width: isNight ? _switchWidth : 0,
                    top: 0,
                    bottom: 0,
                    right: 0,
                    child: SizedBox(
                        width: _switchWidth,
                        height: _switchHeight,
                        child: Ink.image(
                            image: const AssetImage(
                                'assets/images/night_background.png'),
                            fit: BoxFit.cover)),
                  ),
                  AnimatedPositioned(
                    duration: _animationDuration,
                    top: 0,
                    bottom: 0,
                    right: isNight ? 0 : (_switchWidth - _switchHeight),
                    child: AnimatedOpacity(
                      duration: _animationDurationThumb,
                      opacity: isNight ? 1 : 0,
                      child: Image.asset('assets/images/moon.png'),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: _animationDuration,
                    width: isNight ? 0 : _switchWidth,
                    top: 0,
                    bottom: 0,
                    left: 0,
                    child: SizedBox(
                        width: _switchWidth,
                        height: _switchHeight,
                        child: Ink.image(
                            image: const AssetImage(
                                'assets/images/day_background.png'),
                            fit: BoxFit.cover)),
                  ),
                  AnimatedPositioned(
                    duration: _animationDuration,
                    top: 0,
                    bottom: 0,
                    left: isNight ? (_switchWidth - _switchHeight) : 0,
                    child: AnimatedOpacity(
                      duration: _animationDurationThumb,
                      opacity: isNight ? 0 : 1,
                      child: Image.asset('assets/images/sun.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
