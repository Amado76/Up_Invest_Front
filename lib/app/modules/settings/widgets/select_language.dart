import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings_bloc.dart';
import 'package:up_invest_front/app/modules/settings/widgets/settings_options_row.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final intlStrings = IntlStrings.of(context);

    return SettingsOptionsRow(
      icon: Icons.language,
      text: intlStrings.settingsLanguage,
      button: const _SelectLanguageButton(),
    );
  }
}

class _SelectLanguageButton extends StatefulWidget {
  const _SelectLanguageButton();

  @override
  State<_SelectLanguageButton> createState() => _SelectLanguageButtonState();
}

class _SelectLanguageButtonState extends State<_SelectLanguageButton> {
  _SelectLanguageButtonState();
  @override
  Widget build(BuildContext context) {
    final settingsBloc = context.watch<SettingsBloc>((bloc) => bloc.stream);
    final settignsState = settingsBloc.state;
    String systemLangauge = Localizations.localeOf(context).languageCode;
    String dropdownValue =
        settignsState.settingsModel.locale?.languageCode ?? systemLangauge;

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final intlStrings = IntlStrings.of(context);
    return DropdownButton(
      value: dropdownValue,
      onChanged: (String? newValue) {
        settingsBloc
            .add(SettingsEventChangeLanguage(language: newValue ?? 'en'));
      },
      items: [
        DropdownMenuItem(
          value: 'en',
          child: Row(
            children: [
              Image.asset(
                'assets/icons/england_flag.png',
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 5),
              Text(
                intlStrings.settingsEnglish,
                style: TextStyle(color: colorScheme.onBackground, fontSize: 16),
              ),
            ],
          ),
        ),
        DropdownMenuItem(
          value: 'pt',
          child: Row(
            children: [
              Image.asset(
                'assets/icons/brazil_flag.png',
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 5),
              Text(
                intlStrings.settingsPortuguese,
                style: TextStyle(color: colorScheme.onBackground, fontSize: 16),
              ),
            ],
          ),
        ),
        DropdownMenuItem(
          value: 'es',
          child: Row(
            children: [
              Image.asset(
                'assets/icons/spain_flag.png',
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 5),
              Text(
                intlStrings.settingsSpanish,
                style: TextStyle(color: colorScheme.onBackground, fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
