import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';

void main() async {
  late IntlStrings intlStrings;
  group('[English Strings]', () {
    setUp(() async {
      await IntlStrings.load(const Locale.fromSubtags(languageCode: 'en'));
      intlStrings = IntlStrings.current;
    });
    test('should return the correct value for the key "nameHintText"', () {
      expect(intlStrings.nameHintText, 'Name');
    });
    test('should return the correct value for the key "emailHintText"', () {
      expect(intlStrings.emailHintText, 'Email');
    });
    test(
        'should return the correct value for the key "confirmYourPasswordHintText"',
        () {
      expect(intlStrings.confirmYourPasswordHintText, 'Confirm your password');
    });
    test('should return the correct value for the key "forgotPassword"', () {
      expect(intlStrings.forgotPassword, 'Forgot your password?');
    });
    test('should return the correct value for the key "loading"', () {
      expect(intlStrings.loading, 'Loading!');
    });
    test('should return the correct value for the key "submitButton"', () {
      expect(intlStrings.submitButton, 'Submit!');
    });
    test('should return the correct value for the key "cancelButton"', () {
      expect(intlStrings.cancelButton, 'Cancel!');
    });
    test('should return the correct value for the key "saveButton"', () {
      expect(intlStrings.saveButton, 'Save!');
    });
    test('should return the correct value for the key "splashScreenText"', () {
      expect(intlStrings.splashScreenText,
          'Track your assets and \njourney to financial success!');
    });
    test('should return the correct value for the key "getStartedText"', () {
      expect(intlStrings.getStartedText,
          'Take off towards your\nFinancial Independence');
    });
    test('should return the correct value for the key "getStartedButton"', () {
      expect(intlStrings.getStartedButton, 'Begin your journey');
    });
    test('should return the correct value for the key "signInWith"', () {
      expect(intlStrings.signInWith, 'Or sign in with');
    });
    test('should return the correct value for the key "signInDoNotHaveAccount"',
        () {
      expect(intlStrings.signInDoNotHaveAccount, 'Don\'t have an account?');
    });
    test('should return the correct value for the key "signInSignUp"', () {
      expect(intlStrings.signInSignUp, 'Sign up!');
    });
    test('should return the correct value for the key "loginForm"', () {
      expect(intlStrings.loginForm, 'Sign in');
    });
    test('should return the correct value for the key "recoverPasswordBody"',
        () {
      expect(intlStrings.recoverPasswordBody,
          'No problem! Just enter your email \nand our astrounauts will send you a recovery code!');
    });
    test('should return the correct value for the key "signUpTitle"', () {
      expect(intlStrings.signUpTitle, 'Enter your details');
    });
    test('should return the correct value for the key "signUpSubTitle"', () {
      expect(intlStrings.signUpSubTitle, 'You can edit them later!');
    });
    test('should return the correct value for the key "signUpAgreeTerms"', () {
      expect(
          intlStrings.signUpAgreeTerms, 'I agree to the terms and conditions');
    });
    test(
        'should return the correct value for the key "authValidatorEnterYourEmail"',
        () {
      expect(
          intlStrings.authValidatorEnterYourEmail, 'Please enter your email');
    });
    test(
        'should return the correct value for the key "authValidatorValidEmail"',
        () {
      expect(intlStrings.authValidatorValidEmail, 'Please enter a valid email');
    });

    test(
        'should return the correct value for the key "authValidatorPasswordMinLength"',
        () {
      expect(intlStrings.authValidatorPasswordMinLength,
          'Your password have less than 6 characters!');
    });
    test(
        'should return the correct value for the key "authValidatorEnterYourPassword"',
        () {
      expect(intlStrings.authValidatorEnterYourPassword,
          'Please enter your password!');
    });
    test(
        'should return the correct value for the key "authValidatorPasswordInvalidRequirements"',
        () {
      expect(intlStrings.authValidatorPasswordInvalidRequirements,
          'Password requires at least one special character \nand one uppercase letter');
    });
    test(
        'should return the correct value for the key "authValidatorPasswordDoNotMatch"',
        () {
      expect(intlStrings.authValidatorPasswordDoNotMatch,
          'The passwords do not match');
    });
    test(
        'should return the correct value for the key "authValidatorNameMinLength"',
        () {
      expect(intlStrings.authValidatorNameMinLength,
          'Please enter a name with at least 4 characters');
    });
    test('should return the correct value for the key "Authentication error"',
        () {
      expect(intlStrings.authErrorUnknownTitle, 'Authentication error');
    });
    test(
        'should return the correct value for the key "authErrorUnknownMessage"',
        () {
      expect(
          intlStrings.authErrorUnknownMessage, 'Unknown authentication error');
    });
    test(
        'should return the correct value for the key "authErrorEmailAlreadyExistsTitle"',
        () {
      expect(
          intlStrings.authErrorEmailAlreadyExistsTitle, 'Email already in use');
    });
    test(
        'should return the correct value for the key "authErrorEmailAlreadyExistsMessage"',
        () {
      expect(intlStrings.authErrorEmailAlreadyExistsMessage,
          'Please choose another email to register with!');
    });
    test(
        'should return the correct value for the key "authErrorTokenExpiredTitle"',
        () {
      expect(intlStrings.authErrorTokenExpiredTitle, 'Session Expired');
    });
    test(
        'should return the correct value for the key "authErrorTokenExpiredMessage"',
        () {
      expect(intlStrings.authErrorTokenExpiredMessage,
          'Your session has expired. Please sign in again!');
    });
    test(
        'should return the correct value for the key "authErrorTokenRevokedTitle"',
        () {
      expect(intlStrings.authErrorTokenRevokedTitle, 'Session Expired');
    });
    test(
        'should return the correct value for the key "authErrorTokenRevokedMessage"',
        () {
      expect(intlStrings.authErrorTokenRevokedMessage,
          'Your session has expired. Please sign in again!');
    });
    test(
        'should return the correct value for the key "authErrorInvalidEmailTitle"',
        () {
      expect(intlStrings.authErrorInvalidEmailTitle, 'Invalid Email');
    });
    test(
        'should return the correct value for the key "authErrorInvalidEmailMessage"',
        () {
      expect(intlStrings.authErrorInvalidEmailMessage,
          'Please enter a valid email address!');
    });
    test(
        'should return the correct value for the key "authErrorOperationNotAllowedTitle"',
        () {
      expect(intlStrings.authErrorOperationNotAllowedTitle,
          'Operation not allowed');
    });
    test(
        'should return the correct value for the key "authErrorOperationNotAllowedMessage"',
        () {
      expect(intlStrings.authErrorOperationNotAllowedMessage,
          'You cannot register using this method at this moment!');
    });
    test(
        'should return the correct value for the key "authErrorUserNotFoundTitle"',
        () {
      expect(intlStrings.authErrorUserNotFoundTitle, 'User not found!');
    });
    test(
        'should return the correct value for the key "authErrorUserNotFoundMessage"',
        () {
      expect(intlStrings.authErrorUserNotFoundMessage,
          'No current user with this information was found!');
    });
    test(
        'should return the correct value for the key "authErrorRequiresRecentLoginTitle"',
        () {
      expect(intlStrings.authErrorRequiresRecentLoginTitle,
          'Requires recent login');
    });
    test(
        'should return the correct value for the key "authErrorRequiresRecentLoginMessage"',
        () {
      expect(intlStrings.authErrorRequiresRecentLoginMessage,
          'You need to log out and log back in again in order to perform this operation');
    });
    test(
        'should return the correct value for the key "authErrorWeakPasswordTitle"',
        () {
      expect(intlStrings.authErrorWeakPasswordTitle, 'Weak password');
    });
    test(
        'should return the correct value for the key "authErrorWeakPasswordMessage"',
        () {
      expect(intlStrings.authErrorWeakPasswordMessage,
          'Please choose a stronger password consisting of more characters!');
    });
    test(
        'should return the correct value for the key "authErrorWrongPasswordTitle"',
        () {
      expect(
          intlStrings.authErrorWrongPasswordTitle, 'Wrong email or password');
    });
    test(
        'should return the correct value for the key "authErrorWrongPasswordMessage"',
        () {
      expect(intlStrings.authErrorWrongPasswordMessage,
          'Please verify your email and password and try again.');
    });
    test(
        'should return the correct value for the key "authErrorUserMismatchTitle"',
        () {
      expect(intlStrings.authErrorUserMismatchTitle, 'User Mismatch');
    });
    test(
        'should return the correct value for the key "authErrorUserMismatchMessage"',
        () {
      expect(intlStrings.authErrorUserMismatchMessage,
          'The provided credential does not correspond to the user!');
    });
    test(
        'should return the correct value for the key "authErrorTooManyRequestsTitle"',
        () {
      expect(intlStrings.authErrorTooManyRequestsTitle,
          'To many failed login attempts');
    });
    test(
        'should return the correct value for the key "authErrorTooManyRequestsMessage"',
        () {
      expect(intlStrings.authErrorTooManyRequestsMessage,
          'Access to this account has been temporarily disabled due to many failed login attempts.');
    });
    test('should return the correct value for the key "settingsAppBarTitle"',
        () {
      expect(intlStrings.settingsAppBarTitle, 'Settings');
    });
    test('should return the correct value for the key "settingsLanguage"', () {
      expect(intlStrings.settingsLanguage, 'Language');
    });

    test('should return the correct value for the key "settingsEnglish"', () {
      expect(intlStrings.settingsEnglish, 'English');
    });
    test('should return the correct value for the key "settingsSpanish"', () {
      expect(intlStrings.settingsSpanish, 'Spanish');
    });
    test('should return the correct value for the key "settingsPortuguese"',
        () {
      expect(intlStrings.settingsPortuguese, 'Portuguese');
    });
    test('should return the correct value for the key "settingsDark"', () {
      expect(intlStrings.settingsDark, 'Dark');
    });
    test('should return the correct value for the key "settingsLight"', () {
      expect(intlStrings.settingsLight, 'Light');
    });
    test('should return the correct value for the key "settingsLogout"', () {
      expect(intlStrings.settingsLogout, 'Logout');
    });
    test('should return the correct value for the key "settingsLogoutButton"',
        () {
      expect(intlStrings.settingsLogoutButton, 'Logout');
    });
    test(
        'should return the correct value for the key "settingsLogoutWarningMessage"',
        () {
      expect(intlStrings.settingsLogoutWarningMessage,
          'Are you sure you want to logout?');
    });
    test(
        'should return the correct value for the key "settingsEmailIsNotVerified"',
        () {
      expect(intlStrings.settingsEmailIsNotVerified,
          'Your email is not verified!');
    });
    test('should return the correct value for the key "settingsCurrency"', () {
      expect(intlStrings.settingsCurrency, 'Currency');
    });
    test('should return the correct value for the key "settingsBRL"', () {
      expect(intlStrings.settingsBRL, 'BRL');
    });
    test('should return the correct value for the key "settingsUSD"', () {
      expect(intlStrings.settingsUSD, 'USD');
    });
    test('should return the correct value for the key "settingsAboutUs"', () {
      expect(intlStrings.settingsAboutUs, 'About us');
    });
    test('should return the correct value for the key "aboutUsTextOne"', () {
      expect(intlStrings.aboutUsTextOne,
          'My name is Bruno Amado, I am a mobile developer, and I created UpInvest as a personal project, combining two passions: mobile app development and financial investments.\n\nI would be delighted to hear from you if you have any suggestions, criticisms, or compliments! Please feel free to get in touch with me through the following channels:');
    });
    test('should return the correct value for the key "aboutUsTextTwo"', () {
      expect(intlStrings.aboutUsTextTwo,
          'Thank you for using UpInvest and for being a part of my journey of development and learning in Flutter!');
    });
    test('should return the correct value for the key "editDetailsAppBarTitle"',
        () {
      expect(intlStrings.editDetailsAppBarTitle, 'Edit Profile');
    });
    test(
        'should return the correct value for the key "editDetailsChooseAvatar"',
        () {
      expect(intlStrings.editDetailsChooseAvatar, 'Choose your avatar');
    });
    test(
        'should return the correct value for the key "editDetailsProfilePicture"',
        () {
      expect(intlStrings.editDetailsProfilePicture, 'PROFILE PICTURE');
    });
    test(
        'should return the correct value for the key "editDetailsChangeDisplayName"',
        () {
      expect(intlStrings.editDetailsChangeDisplayName, 'Change your user name');
    });
    test('should return the correct value for the key "editDetailsChangeEmail"',
        () {
      expect(intlStrings.editDetailsChangeEmail, 'Change your email');
    });
    test(
        'should return the correct value for the key "editDetailsNewEmailHintText"',
        () {
      expect(intlStrings.editDetailsNewEmailHintText, 'New email');
    });
    test(
        'should return the correct value for the key "editDetailsChangePassword"',
        () {
      expect(intlStrings.editDetailsChangePassword, 'Change your password');
    });
    test(
        'should return the correct value for the key "editDetailsNewPasswordHintText"',
        () {
      expect(intlStrings.editDetailsNewPasswordHintText, 'New password');
    });
    test(
        'should return the correct value for the key "editDetailsConfirmNewPasswordHintText"',
        () {
      expect(intlStrings.editDetailsConfirmNewPasswordHintText,
          'Confirm your new password');
    });
    test(
        'should return the correct value for the key "editDetailsDeleteAccount"',
        () {
      expect(intlStrings.editDetailsDeleteAccount, 'Delete your account');
    });
    test('should return the correct value for the key "editDetailsDelete"', () {
      expect(intlStrings.editDetailsDelete, 'Delete');
    });
    test(
        'should return the correct value for the key "editDetailsSadToSeeYouGo"',
        () {
      expect(intlStrings.editDetailsSadToSeeYouGo, 'Sad to See You Go');
    });
    test(
        'should return the correct value for the key "editDetailsDeleteAccoutnWarningPersonalData"',
        () {
      expect(intlStrings.editDetailsDeleteAccoutnWarningPersonalData,
          'Deleting your profile will remove all personal data!');
    });
    test(
        'should return the correct value for the key "editDetailsDeleteAccountWarning"',
        () {
      expect(intlStrings.editDetailsDeleteAccountWarning,
          'Are you sure you want to delete your account? This action cannot be undone!');
    });
    test('should return the correct value for the key "dropDownMenuHome"', () {
      expect(intlStrings.dropDownMenuHome, 'Home');
    });
    test('should return the correct value for the key "dropDownMenuSettings"',
        () {
      expect(intlStrings.dropDownMenuSettings, 'Settings');
    });
    test('should return the correct value for the key "dropDownMenuDashboard"',
        () {
      expect(intlStrings.dropDownMenuDashboard, 'Dashboard');
    });
    test('should return the correct value for the key "dropDownMenuPortfolio"',
        () {
      expect(intlStrings.dropDownMenuPortfolio, 'Portfolio');
    });
    test('should return the correct value for the key "dropDownMeuGoals"', () {
      expect(intlStrings.dropDownMeuGoals, 'Goals');
    });
    test(
        'should return the correct value for the key "dropDownMenuAchievements"',
        () {
      expect(intlStrings.dropDownMenuAchievements, 'Achievements');
    });
    test('should return the correct value for the key "dropDownMenuAboutUs"',
        () {
      expect(intlStrings.dropDownMenuAboutUs, 'About us');
    });
    test('should return the correct value for the key "dropDownMenuLogout"',
        () {
      expect(intlStrings.dropDownMenuLogout, 'Logout');
    });
    test('should return the correct value for the key "homeWelcomeTitle"', () {
      expect(intlStrings.homeWelcomeTitle('Bruno'), 'Welcome, Bruno!');
    });
    test('should return the correct value for the key "homeValueInDollar"', () {
      expect(intlStrings.homeValueInDollar(1000), '\$1,000.00');
    });
    test('should return the correct value for the key "homeValueInReais"', () {
      expect(intlStrings.homeValueInReais(1000), 'R\$1,000.00');
    });
    test('should return the correct value for the key "homeWelcomeMessage"',
        () {
      expect(intlStrings.homeWelcomeMessage, 'Let\'s start investing!');
    });
    test('should return the correct value for the key "homeSearchBarHint"', () {
      expect(intlStrings.homeSearchBarHint, 'Search for a asset...');
    });
    test('should return the correct value for the key "homeDashboardTitle"',
        () {
      expect(intlStrings.homeDashboardTitle, 'Dashboard');
    });
    test('should return the correct value for the key "homeOperationTitle"',
        () {
      expect(intlStrings.homeOperationTitle, 'Transaction');
    });
    test('should return the correct value for the key "homePortfolioTitle"',
        () {
      expect(intlStrings.homePortfolioTitle, 'Portfolio');
    });
    test('should return the correct value for the key "homeCurrentBalance"',
        () {
      expect(intlStrings.homeCurrentBalance, 'Current Balance');
    });
    test('should return the correct value for the key "homeInvestedAmount"',
        () {
      expect(intlStrings.homeInvestedAmount, 'Invested Amount');
    });
    test('should return the correct value for the key "homeGoalCardTitle"', () {
      expect(
          intlStrings.homeGoalCardTitle, 'Journey to Financial Independence');
    });
    test('should return the correct value for the key "homeMonthDividendsGoal"',
        () {
      expect(intlStrings.homeMonthDividendsGoal, 'Month Dividends Goal');
    });
    test(
        'should return the correct value for the key "homeLastMonthDividendsValue"',
        () {
      expect(intlStrings.homeLastMonthDividendsValue, 'Last Month Dividends');
    });
  }); //
}
