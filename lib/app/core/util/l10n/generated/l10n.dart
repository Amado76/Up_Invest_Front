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

  /// `Authentication error`
  String get authErrorUnknownTitle {
    return Intl.message(
      'Authentication error',
      name: 'authErrorUnknownTitle',
      desc: '',
      args: [],
    );
  }

  /// `Unknown authentication error`
  String get authErrorUnknownMessage {
    return Intl.message(
      'Unknown authentication error',
      name: 'authErrorUnknownMessage',
      desc: '',
      args: [],
    );
  }

  /// `Email already in use`
  String get authErrorEmailAlreadyExistsTitle {
    return Intl.message(
      'Email already in use',
      name: 'authErrorEmailAlreadyExistsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please choose another email to register with!`
  String get authErrorEmailAlreadyExistsMessage {
    return Intl.message(
      'Please choose another email to register with!',
      name: 'authErrorEmailAlreadyExistsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Session Expired`
  String get authErrorTokenExpiredTitle {
    return Intl.message(
      'Session Expired',
      name: 'authErrorTokenExpiredTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your session has expired. Please sign in again!`
  String get authErrorTokenExpiredMessage {
    return Intl.message(
      'Your session has expired. Please sign in again!',
      name: 'authErrorTokenExpiredMessage',
      desc: '',
      args: [],
    );
  }

  /// `Session Expired`
  String get authErrorTokenRevokedTitle {
    return Intl.message(
      'Session Expired',
      name: 'authErrorTokenRevokedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your session has expired. Please sign in again!`
  String get authErrorTokenRevokedMessage {
    return Intl.message(
      'Your session has expired. Please sign in again!',
      name: 'authErrorTokenRevokedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email`
  String get authErrorInvalidEmailTitle {
    return Intl.message(
      'Invalid Email',
      name: 'authErrorInvalidEmailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address!`
  String get authErrorInvalidEmailMessage {
    return Intl.message(
      'Please enter a valid email address!',
      name: 'authErrorInvalidEmailMessage',
      desc: '',
      args: [],
    );
  }

  /// `Operation not allowed`
  String get authErrorOperationNotAllowedTitle {
    return Intl.message(
      'Operation not allowed',
      name: 'authErrorOperationNotAllowedTitle',
      desc: '',
      args: [],
    );
  }

  /// `You cannot register using this method at this moment!`
  String get authErrorOperationNotAllowedMessage {
    return Intl.message(
      'You cannot register using this method at this moment!',
      name: 'authErrorOperationNotAllowedMessage',
      desc: '',
      args: [],
    );
  }

  /// `User not found!`
  String get authErrorUserNotFoundTitle {
    return Intl.message(
      'User not found!',
      name: 'authErrorUserNotFoundTitle',
      desc: '',
      args: [],
    );
  }

  /// `No current user with this information was found!`
  String get authErrorUserNotFoundMessage {
    return Intl.message(
      'No current user with this information was found!',
      name: 'authErrorUserNotFoundMessage',
      desc: '',
      args: [],
    );
  }

  /// `Requires recent login`
  String get authErrorRequiresRecentLoginTitle {
    return Intl.message(
      'Requires recent login',
      name: 'authErrorRequiresRecentLoginTitle',
      desc: '',
      args: [],
    );
  }

  /// `You need to log out and log back in again in order to perform this operation`
  String get authErrorRequiresRecentLoginMessage {
    return Intl.message(
      'You need to log out and log back in again in order to perform this operation',
      name: 'authErrorRequiresRecentLoginMessage',
      desc: '',
      args: [],
    );
  }

  /// `Weak password`
  String get authErrorWeakPasswordTitle {
    return Intl.message(
      'Weak password',
      name: 'authErrorWeakPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please choose a stronger password consisting of more characters!`
  String get authErrorWeakPasswordMessage {
    return Intl.message(
      'Please choose a stronger password consisting of more characters!',
      name: 'authErrorWeakPasswordMessage',
      desc: '',
      args: [],
    );
  }

  /// `Wrong email or password`
  String get authErrorWrongPasswordTitle {
    return Intl.message(
      'Wrong email or password',
      name: 'authErrorWrongPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please verify your email and password and try again.`
  String get authErrorWrongPasswordMessage {
    return Intl.message(
      'Please verify your email and password and try again.',
      name: 'authErrorWrongPasswordMessage',
      desc: '',
      args: [],
    );
  }

  /// `User Mismatch`
  String get authErrorUserMismatchTitle {
    return Intl.message(
      'User Mismatch',
      name: 'authErrorUserMismatchTitle',
      desc: '',
      args: [],
    );
  }

  /// `The provided credential does not correspond to the user!`
  String get authErrorUserMismatchMessage {
    return Intl.message(
      'The provided credential does not correspond to the user!',
      name: 'authErrorUserMismatchMessage',
      desc: '',
      args: [],
    );
  }

  /// `To many failed login attempts`
  String get authErrorTooManyRequestsTitle {
    return Intl.message(
      'To many failed login attempts',
      name: 'authErrorTooManyRequestsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Access to this account has been temporarily disabled due to many failed login attempts.`
  String get authErrorTooManyRequestsMessage {
    return Intl.message(
      'Access to this account has been temporarily disabled due to many failed login attempts.',
      name: 'authErrorTooManyRequestsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Connection Error!`
  String get authErrorNetworkErrorTitle {
    return Intl.message(
      'Connection Error!',
      name: 'authErrorNetworkErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection and try again.`
  String get authErrorNetworkErrorMessage {
    return Intl.message(
      'Please check your internet connection and try again.',
      name: 'authErrorNetworkErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Success!`
  String get authSuccessUnknownTitle {
    return Intl.message(
      'Success!',
      name: 'authSuccessUnknownTitle',
      desc: '',
      args: [],
    );
  }

  /// `Successful request!`
  String get authSuccessUnknownMessage {
    return Intl.message(
      'Successful request!',
      name: 'authSuccessUnknownMessage',
      desc: '',
      args: [],
    );
  }

  /// `Email Sent!`
  String get authSuccessResetPasswordTitle {
    return Intl.message(
      'Email Sent!',
      name: 'authSuccessResetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `We have sent an email with instructions to reset your password!`
  String get authSuccessResetPasswordMessage {
    return Intl.message(
      'We have sent an email with instructions to reset your password!',
      name: 'authSuccessResetPasswordMessage',
      desc: '',
      args: [],
    );
  }

  /// `Password Successfully Changed!`
  String get authSuccessSetNewPasswordTitle {
    return Intl.message(
      'Password Successfully Changed!',
      name: 'authSuccessSetNewPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been changed successfully!`
  String get authSuccessSetNewPasswordMessage {
    return Intl.message(
      'Your password has been changed successfully!',
      name: 'authSuccessSetNewPasswordMessage',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error!`
  String get settingsErrorUnknownTitle {
    return Intl.message(
      'Unknown error!',
      name: 'settingsErrorUnknownTitle',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred.`
  String get settingsErrorUnknownMessage {
    return Intl.message(
      'An unknown error occurred.',
      name: 'settingsErrorUnknownMessage',
      desc: '',
      args: [],
    );
  }

  /// `Error Saving Settings!`
  String get settingsErrorOnSaveTitle {
    return Intl.message(
      'Error Saving Settings!',
      name: 'settingsErrorOnSaveTitle',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while saving the settings, please try again!`
  String get settingsErrorOnSaveessage {
    return Intl.message(
      'An error occurred while saving the settings, please try again!',
      name: 'settingsErrorOnSaveessage',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsAppBarTitle {
    return Intl.message(
      'Settings',
      name: 'settingsAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get settingsLanguage {
    return Intl.message(
      'Language',
      name: 'settingsLanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get settingsEnglish {
    return Intl.message(
      'English',
      name: 'settingsEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Spanish`
  String get settingsSpanish {
    return Intl.message(
      'Spanish',
      name: 'settingsSpanish',
      desc: '',
      args: [],
    );
  }

  /// `Portuguese`
  String get settingsPortuguese {
    return Intl.message(
      'Portuguese',
      name: 'settingsPortuguese',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get settingsDark {
    return Intl.message(
      'Dark',
      name: 'settingsDark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get settingsLight {
    return Intl.message(
      'Light',
      name: 'settingsLight',
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
