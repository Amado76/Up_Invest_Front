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

  /// `Name`
  String get nameHintText {
    return Intl.message(
      'Name',
      name: 'nameHintText',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailHintText {
    return Intl.message(
      'Email',
      name: 'emailHintText',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordHintText {
    return Intl.message(
      'Password',
      name: 'passwordHintText',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your password`
  String get confirmYourPasswordHintText {
    return Intl.message(
      'Confirm your password',
      name: 'confirmYourPasswordHintText',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot your password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Loading!`
  String get loading {
    return Intl.message(
      'Loading!',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Submit!`
  String get submitButton {
    return Intl.message(
      'Submit!',
      name: 'submitButton',
      desc: '',
      args: [],
    );
  }

  /// `Track your assets and \njourney to financial success!`
  String get splashScreenText {
    return Intl.message(
      'Track your assets and \njourney to financial success!',
      name: 'splashScreenText',
      desc: '',
      args: [],
    );
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

  /// `Or sign in with`
  String get signInWith {
    return Intl.message(
      'Or sign in with',
      name: 'signInWith',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get signInDoNotHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'signInDoNotHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up!`
  String get signInSignUp {
    return Intl.message(
      'Sign up!',
      name: 'signInSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get loginForm {
    return Intl.message(
      'Sign in',
      name: 'loginForm',
      desc: '',
      args: [],
    );
  }

  /// `No problem! Just enter your email \nand our astrounauts will send you a recovery code!`
  String get recoverPasswordBody {
    return Intl.message(
      'No problem! Just enter your email \nand our astrounauts will send you a recovery code!',
      name: 'recoverPasswordBody',
      desc: '',
      args: [],
    );
  }

  /// `Enter your details`
  String get signUpTitle {
    return Intl.message(
      'Enter your details',
      name: 'signUpTitle',
      desc: '',
      args: [],
    );
  }

  /// `You can edit them later!`
  String get signUpSubTitle {
    return Intl.message(
      'You can edit them later!',
      name: 'signUpSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the terms and conditions`
  String get signUpAgreeTerms {
    return Intl.message(
      'I agree to the terms and conditions',
      name: 'signUpAgreeTerms',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get authValidatorEnterYourEmail {
    return Intl.message(
      'Please enter your email',
      name: 'authValidatorEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get authValidatorValidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'authValidatorValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Your password have less than 6 characters!`
  String get authValidatorPasswordMinLength {
    return Intl.message(
      'Your password have less than 6 characters!',
      name: 'authValidatorPasswordMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password!`
  String get authValidatorEnterYourPassword {
    return Intl.message(
      'Please enter your password!',
      name: 'authValidatorEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password requires at least one special character \nand one uppercase letter`
  String get authValidatorPasswordInvalidRequirements {
    return Intl.message(
      'Password requires at least one special character \nand one uppercase letter',
      name: 'authValidatorPasswordInvalidRequirements',
      desc: '',
      args: [],
    );
  }

  /// `The passwords do not match`
  String get authValidatorPasswordDoNotMatch {
    return Intl.message(
      'The passwords do not match',
      name: 'authValidatorPasswordDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a name with at least 4 characters`
  String get authValidatorNameMinLength {
    return Intl.message(
      'Please enter a name with at least 4 characters',
      name: 'authValidatorNameMinLength',
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
