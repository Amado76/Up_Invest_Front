import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings_bloc.dart';
import 'package:up_invest_front/app/modules/settings/model/settings_model.dart'
    show Currency;
import 'settings_options_row.dart';

class SelectCurrency extends StatelessWidget {
  const SelectCurrency({super.key});

  @override
  Widget build(BuildContext context) {
    final intlStrings = IntlStrings.of(context);

    return SettingsOptionsRow(
      icon: Icons.language,
      text: intlStrings.settingsCurrency,
      button: const _SelectCurrencyButton(),
    );
  }
}

class _SelectCurrencyButton extends StatefulWidget {
  const _SelectCurrencyButton();

  @override
  State<_SelectCurrencyButton> createState() => _SelectCurrencyButtonState();
}

class _SelectCurrencyButtonState extends State<_SelectCurrencyButton> {
  _SelectCurrencyButtonState();
  @override
  Widget build(BuildContext context) {
    final settingsBloc = context.watch<SettingsBloc>((bloc) => bloc.stream);
    final settignsState = settingsBloc.state;
    Currency currency = Currency.usd;
    Currency dropdownValue = settignsState.settingsModel.currency;

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final intlStrings = IntlStrings.of(context);
    return DropdownButton(
      value: dropdownValue,
      onChanged: (Currency? newValue) {
        settingsBloc
            .add(SettingsEventChangeCurrency(currency: newValue ?? currency));
      },
      items: [
        DropdownMenuItem(
          value: Currency.usd,
          child: Row(
            children: [
              Image.asset(
                'assets/icons/usd_flag.png',
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 5),
              Text(
                intlStrings.settingsUSD,
                style: TextStyle(color: colorScheme.outline, fontSize: 16),
              ),
            ],
          ),
        ),
        DropdownMenuItem(
          value: Currency.brl,
          child: Row(
            children: [
              Image.asset(
                'assets/icons/brazil_flag.png',
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 5),
              Text(
                intlStrings.settingsBRL,
                style: TextStyle(color: colorScheme.outline, fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
