import 'package:up_invest_front/app/modules/settings/model/settings_model.dart';

stringToCurrency(String value) {
  value = value.trim().toLowerCase();
  if (value == 'brl') {
    return Currency.brl;
  }
  if (value == 'usd') {
    return Currency.usd;
  }
  throw Exception('invalid-currency');
}

currencyToString(Currency value) {
  if (value == Currency.brl) {
    return 'brl';
  }
  if (value == Currency.usd) {
    return 'usd';
  }
  throw Exception('invalid-currency');
}
