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

  /// `Cancel!`
  String get cancelButton {
    return Intl.message(
      'Cancel!',
      name: 'cancelButton',
      desc: '',
      args: [],
    );
  }

  /// `Save!`
  String get saveButton {
    return Intl.message(
      'Save!',
      name: 'saveButton',
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

  /// `Verification email sent!`
  String get authSuccessEmailSentTitle {
    return Intl.message(
      'Verification email sent!',
      name: 'authSuccessEmailSentTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please check your inbox and follow the instructions to complete the email verification process.`
  String get authSuccessSetEmailSentMessage {
    return Intl.message(
      'Please check your inbox and follow the instructions to complete the email verification process.',
      name: 'authSuccessSetEmailSentMessage',
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

  /// `Error opening external link!`
  String get settingsErrorExternalLinkTitle {
    return Intl.message(
      'Error opening external link!',
      name: 'settingsErrorExternalLinkTitle',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while opening an external link, please try again!`
  String get settingsErrorExternalLinkMessage {
    return Intl.message(
      'An error occurred while opening an external link, please try again!',
      name: 'settingsErrorExternalLinkMessage',
      desc: '',
      args: [],
    );
  }

  /// `Success!`
  String get settingsSuccessUnknownTitle {
    return Intl.message(
      'Success!',
      name: 'settingsSuccessUnknownTitle',
      desc: '',
      args: [],
    );
  }

  /// `Successful request!`
  String get settingsSuccessUnknownMessage {
    return Intl.message(
      'Successful request!',
      name: 'settingsSuccessUnknownMessage',
      desc: '',
      args: [],
    );
  }

  /// `Avatar changed successfully!`
  String get settingsSuccessChangeAvatarTitle {
    return Intl.message(
      'Avatar changed successfully!',
      name: 'settingsSuccessChangeAvatarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your avatar has been changed successfully!`
  String get settingsSuccessChangeAvatarMessage {
    return Intl.message(
      'Your avatar has been changed successfully!',
      name: 'settingsSuccessChangeAvatarMessage',
      desc: '',
      args: [],
    );
  }

  /// `User Name changed successfully!`
  String get settingsSuccessNameUpdatedTitle {
    return Intl.message(
      'User Name changed successfully!',
      name: 'settingsSuccessNameUpdatedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your user name has been changed successfully!`
  String get settingsSuccessNameUpdatedMessage {
    return Intl.message(
      'Your user name has been changed successfully!',
      name: 'settingsSuccessNameUpdatedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully!`
  String get settingsSuccessPasswordChangedTitle {
    return Intl.message(
      'Password changed successfully!',
      name: 'settingsSuccessPasswordChangedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been changed successfully!`
  String get settingsSuccessPasswordChangedMessage {
    return Intl.message(
      'Your password has been changed successfully!',
      name: 'settingsSuccessPasswordChangedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Email changed successfully!`
  String get settingsSuccessUpdateEmaiTitle {
    return Intl.message(
      'Email changed successfully!',
      name: 'settingsSuccessUpdateEmaiTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your email has been changed successfully!`
  String get settingsSuccessUpdateEmaiMessage {
    return Intl.message(
      'Your email has been changed successfully!',
      name: 'settingsSuccessUpdateEmaiMessage',
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

  /// `Logout`
  String get settingsLogout {
    return Intl.message(
      'Logout',
      name: 'settingsLogout',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get settingsLogoutButton {
    return Intl.message(
      'Logout',
      name: 'settingsLogoutButton',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get settingsLogoutWarningMessage {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'settingsLogoutWarningMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your email is not verified!`
  String get settingsEmailIsNotVerified {
    return Intl.message(
      'Your email is not verified!',
      name: 'settingsEmailIsNotVerified',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get settingsCurrency {
    return Intl.message(
      'Currency',
      name: 'settingsCurrency',
      desc: '',
      args: [],
    );
  }

  /// `BRL`
  String get settingsBRL {
    return Intl.message(
      'BRL',
      name: 'settingsBRL',
      desc: '',
      args: [],
    );
  }

  /// `USD`
  String get settingsUSD {
    return Intl.message(
      'USD',
      name: 'settingsUSD',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get settingsAboutUs {
    return Intl.message(
      'About us',
      name: 'settingsAboutUs',
      desc: '',
      args: [],
    );
  }

  /// `My name is Bruno Amado, I am a mobile developer, and I created UpInvest as a personal project, combining two passions: mobile app development and financial investments.\n\nI would be delighted to hear from you if you have any suggestions, criticisms, or compliments! Please feel free to get in touch with me through the following channels:`
  String get aboutUsTextOne {
    return Intl.message(
      'My name is Bruno Amado, I am a mobile developer, and I created UpInvest as a personal project, combining two passions: mobile app development and financial investments.\n\nI would be delighted to hear from you if you have any suggestions, criticisms, or compliments! Please feel free to get in touch with me through the following channels:',
      name: 'aboutUsTextOne',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for using UpInvest and for being a part of my journey of development and learning in Flutter!`
  String get aboutUsTextTwo {
    return Intl.message(
      'Thank you for using UpInvest and for being a part of my journey of development and learning in Flutter!',
      name: 'aboutUsTextTwo',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editDetailsAppBarTitle {
    return Intl.message(
      'Edit Profile',
      name: 'editDetailsAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose your avatar`
  String get editDetailsChooseAvatar {
    return Intl.message(
      'Choose your avatar',
      name: 'editDetailsChooseAvatar',
      desc: '',
      args: [],
    );
  }

  /// `PROFILE PICTURE`
  String get editDetailsProfilePicture {
    return Intl.message(
      'PROFILE PICTURE',
      name: 'editDetailsProfilePicture',
      desc: '',
      args: [],
    );
  }

  /// `Change your user name`
  String get editDetailsChangeDisplayName {
    return Intl.message(
      'Change your user name',
      name: 'editDetailsChangeDisplayName',
      desc: '',
      args: [],
    );
  }

  /// `Change your email`
  String get editDetailsChangeEmail {
    return Intl.message(
      'Change your email',
      name: 'editDetailsChangeEmail',
      desc: '',
      args: [],
    );
  }

  /// `New email`
  String get editDetailsNewEmailHintText {
    return Intl.message(
      'New email',
      name: 'editDetailsNewEmailHintText',
      desc: '',
      args: [],
    );
  }

  /// `Change your password`
  String get editDetailsChangePassword {
    return Intl.message(
      'Change your password',
      name: 'editDetailsChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get editDetailsNewPasswordHintText {
    return Intl.message(
      'New password',
      name: 'editDetailsNewPasswordHintText',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your new password`
  String get editDetailsConfirmNewPasswordHintText {
    return Intl.message(
      'Confirm your new password',
      name: 'editDetailsConfirmNewPasswordHintText',
      desc: '',
      args: [],
    );
  }

  /// `Delete your account`
  String get editDetailsDeleteAccount {
    return Intl.message(
      'Delete your account',
      name: 'editDetailsDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get editDetailsDelete {
    return Intl.message(
      'Delete',
      name: 'editDetailsDelete',
      desc: '',
      args: [],
    );
  }

  /// `Sad to See You Go`
  String get editDetailsSadToSeeYouGo {
    return Intl.message(
      'Sad to See You Go',
      name: 'editDetailsSadToSeeYouGo',
      desc: '',
      args: [],
    );
  }

  /// `Deleting your profile will remove all personal data!`
  String get editDetailsDeleteAccoutnWarningPersonalData {
    return Intl.message(
      'Deleting your profile will remove all personal data!',
      name: 'editDetailsDeleteAccoutnWarningPersonalData',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account? This action cannot be undone!`
  String get editDetailsDeleteAccountWarning {
    return Intl.message(
      'Are you sure you want to delete your account? This action cannot be undone!',
      name: 'editDetailsDeleteAccountWarning',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Error`
  String get remoteStorageErrorUnknownTitle {
    return Intl.message(
      'Unknown Error',
      name: 'remoteStorageErrorUnknownTitle',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error, please try again.`
  String get remoteStorageErrorUnknownMessage {
    return Intl.message(
      'Unknown error, please try again.',
      name: 'remoteStorageErrorUnknownMessage',
      desc: '',
      args: [],
    );
  }

  /// `Time Exceeded`
  String get remoteStorageErrorRetryLimitExceededTitle {
    return Intl.message(
      'Time Exceeded',
      name: 'remoteStorageErrorRetryLimitExceededTitle',
      desc: '',
      args: [],
    );
  }

  /// `The operation's time limit has been exceeded, please try again.`
  String get remoteStorageErrorRetryLimitExceededMessage {
    return Intl.message(
      'The operation\'s time limit has been exceeded, please try again.',
      name: 'remoteStorageErrorRetryLimitExceededMessage',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get dropDownMenuHome {
    return Intl.message(
      'Home',
      name: 'dropDownMenuHome',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get dropDownMenuSettings {
    return Intl.message(
      'Settings',
      name: 'dropDownMenuSettings',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dropDownMenuDashboard {
    return Intl.message(
      'Dashboard',
      name: 'dropDownMenuDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Portfolio`
  String get dropDownMenuPortfolio {
    return Intl.message(
      'Portfolio',
      name: 'dropDownMenuPortfolio',
      desc: '',
      args: [],
    );
  }

  /// `Goals`
  String get dropDownMeuGoals {
    return Intl.message(
      'Goals',
      name: 'dropDownMeuGoals',
      desc: '',
      args: [],
    );
  }

  /// `Achievements`
  String get dropDownMenuAchievements {
    return Intl.message(
      'Achievements',
      name: 'dropDownMenuAchievements',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get dropDownMenuAboutUs {
    return Intl.message(
      'About us',
      name: 'dropDownMenuAboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get dropDownMenuLogout {
    return Intl.message(
      'Logout',
      name: 'dropDownMenuLogout',
      desc: '',
      args: [],
    );
  }

  /// `Welcome, {firstName}!`
  String homeWelcomeTitle(Object firstName) {
    return Intl.message(
      'Welcome, $firstName!',
      name: 'homeWelcomeTitle',
      desc: 'Welcome message on the Home screen',
      args: [firstName],
    );
  }

  /// `{valueInUSD}`
  String homeValueInDollar(double valueInUSD) {
    final NumberFormat valueInUSDNumberFormat = NumberFormat.currency(
        locale: Intl.getCurrentLocale(),
        decimalDigits: 2,
        name: 'USD',
        symbol: '\$',
        customPattern: '¤#,000.00');
    final String valueInUSDString = valueInUSDNumberFormat.format(valueInUSD);

    return Intl.message(
      valueInUSDString,
      name: 'homeValueInDollar',
      desc: 'Balance value on the Home screen',
      args: [valueInUSDString],
    );
  }

  /// `{valueInBRL}`
  String homeValueInReais(double valueInBRL) {
    final NumberFormat valueInBRLNumberFormat = NumberFormat.currency(
        locale: Intl.getCurrentLocale(),
        decimalDigits: 2,
        name: 'BRL',
        symbol: 'R\$',
        customPattern: '¤#,000.00');
    final String valueInBRLString = valueInBRLNumberFormat.format(valueInBRL);

    return Intl.message(
      valueInBRLString,
      name: 'homeValueInReais',
      desc: 'Balance value on the Home screen',
      args: [valueInBRLString],
    );
  }

  /// `Let's start investing!`
  String get homeWelcomeMessage {
    return Intl.message(
      'Let\'s start investing!',
      name: 'homeWelcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Search for a asset...`
  String get homeSearchBarHint {
    return Intl.message(
      'Search for a asset...',
      name: 'homeSearchBarHint',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get homeDashboardTitle {
    return Intl.message(
      'Dashboard',
      name: 'homeDashboardTitle',
      desc: '',
      args: [],
    );
  }

  /// `Transaction`
  String get homeOperationTitle {
    return Intl.message(
      'Transaction',
      name: 'homeOperationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Portfolio`
  String get homePortfolioTitle {
    return Intl.message(
      'Portfolio',
      name: 'homePortfolioTitle',
      desc: '',
      args: [],
    );
  }

  /// `Current Balance`
  String get homeCurrentBalance {
    return Intl.message(
      'Current Balance',
      name: 'homeCurrentBalance',
      desc: '',
      args: [],
    );
  }

  /// `Invested Amount`
  String get homeInvestedAmount {
    return Intl.message(
      'Invested Amount',
      name: 'homeInvestedAmount',
      desc: '',
      args: [],
    );
  }

  /// `Journey to Financial Independence`
  String get homeGoalCardTitle {
    return Intl.message(
      'Journey to Financial Independence',
      name: 'homeGoalCardTitle',
      desc: '',
      args: [],
    );
  }

  /// `Month Dividends Goal`
  String get homeMonthDividendsGoal {
    return Intl.message(
      'Month Dividends Goal',
      name: 'homeMonthDividendsGoal',
      desc: '',
      args: [],
    );
  }

  /// `Last Month Dividends`
  String get homeLastMonthDividendsValue {
    return Intl.message(
      'Last Month Dividends',
      name: 'homeLastMonthDividendsValue',
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
