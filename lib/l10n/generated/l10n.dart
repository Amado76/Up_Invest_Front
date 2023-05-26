// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class IntlStrings {
  IntlStrings();

  static IntlStrings? _current;

  static IntlStrings get current {
    assert(_current != null,
        'No instance of IntlStrings was loaded. Try to initialize the IntlStrings delegate before accessing IntlStrings.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<IntlStrings> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = IntlStrings();
      IntlStrings._current = instance;

      return instance;
    });
  }

  static IntlStrings of(BuildContext context) {
    final instance = IntlStrings.maybeOf(context);
    assert(instance != null,
        'No instance of IntlStrings present in the widget tree. Did you add IntlStrings.delegate in localizationsDelegates?');
    return instance!;
  }

  static IntlStrings? maybeOf(BuildContext context) {
    return Localizations.of<IntlStrings>(context, IntlStrings);
  }

  /// `Take off towards your\nFinancial Independence`
  String get getStartedText {
    return Intl.message(
      'Take off towards your\nFinancial Independence',
      name: 'getStartedText',
      desc: '',
      args: [],
    );
  }

  /// `Begin your journey`
  String get getStartedButton {
    return Intl.message(
      'Begin your journey',
      name: 'getStartedButton',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<IntlStrings> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<IntlStrings> load(Locale locale) => IntlStrings.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
