// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(valueInUSD) => "${valueInUSD}";

  static String m1(valueInBRL) => "${valueInBRL}";

  static String m2(firstName) => "Welcome, ${firstName}!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aboutUsTextOne": MessageLookupByLibrary.simpleMessage(
            "My name is Bruno Amado, I am a mobile developer, and I created UpInvest as a personal project, combining two passions: mobile app development and financial investments.\n\nI would be delighted to hear from you if you have any suggestions, criticisms, or compliments! Please feel free to get in touch with me through the following channels:"),
        "aboutUsTextTwo": MessageLookupByLibrary.simpleMessage(
            "Thank you for using UpInvest and for being a part of my journey of development and learning in Flutter!"),
        "authErrorEmailAlreadyExistsMessage":
            MessageLookupByLibrary.simpleMessage(
                "Please choose another email to register with!"),
        "authErrorEmailAlreadyExistsTitle":
            MessageLookupByLibrary.simpleMessage("Email already in use"),
        "authErrorInvalidEmailMessage": MessageLookupByLibrary.simpleMessage(
            "Please enter a valid email address!"),
        "authErrorInvalidEmailTitle":
            MessageLookupByLibrary.simpleMessage("Invalid Email"),
        "authErrorNetworkErrorMessage": MessageLookupByLibrary.simpleMessage(
            "Please check your internet connection and try again."),
        "authErrorNetworkErrorTitle":
            MessageLookupByLibrary.simpleMessage("Connection Error!"),
        "authErrorOperationNotAllowedMessage":
            MessageLookupByLibrary.simpleMessage(
                "You cannot register using this method at this moment!"),
        "authErrorOperationNotAllowedTitle":
            MessageLookupByLibrary.simpleMessage("Operation not allowed"),
        "authErrorRequiresRecentLoginMessage": MessageLookupByLibrary.simpleMessage(
            "You need to log out and log back in again in order to perform this operation"),
        "authErrorRequiresRecentLoginTitle":
            MessageLookupByLibrary.simpleMessage("Requires recent login"),
        "authErrorTokenExpiredMessage": MessageLookupByLibrary.simpleMessage(
            "Your session has expired. Please sign in again!"),
        "authErrorTokenExpiredTitle":
            MessageLookupByLibrary.simpleMessage("Session Expired"),
        "authErrorTokenRevokedMessage": MessageLookupByLibrary.simpleMessage(
            "Your session has expired. Please sign in again!"),
        "authErrorTokenRevokedTitle":
            MessageLookupByLibrary.simpleMessage("Session Expired"),
        "authErrorTooManyRequestsMessage": MessageLookupByLibrary.simpleMessage(
            "Access to this account has been temporarily disabled due to many failed login attempts."),
        "authErrorTooManyRequestsTitle": MessageLookupByLibrary.simpleMessage(
            "To many failed login attempts"),
        "authErrorUnknownMessage": MessageLookupByLibrary.simpleMessage(
            "Unknown authentication error"),
        "authErrorUnknownTitle":
            MessageLookupByLibrary.simpleMessage("Authentication error"),
        "authErrorUserMismatchMessage": MessageLookupByLibrary.simpleMessage(
            "The provided credential does not correspond to the user!"),
        "authErrorUserMismatchTitle":
            MessageLookupByLibrary.simpleMessage("User Mismatch"),
        "authErrorUserNotFoundMessage": MessageLookupByLibrary.simpleMessage(
            "No current user with this information was found!"),
        "authErrorUserNotFoundTitle":
            MessageLookupByLibrary.simpleMessage("User not found!"),
        "authErrorWeakPasswordMessage": MessageLookupByLibrary.simpleMessage(
            "Please choose a stronger password consisting of more characters!"),
        "authErrorWeakPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Weak password"),
        "authErrorWrongPasswordMessage": MessageLookupByLibrary.simpleMessage(
            "Please verify your email and password and try again."),
        "authErrorWrongPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Wrong email or password"),
        "authSuccessEmailSentTitle":
            MessageLookupByLibrary.simpleMessage("Verification email sent!"),
        "authSuccessResetPasswordMessage": MessageLookupByLibrary.simpleMessage(
            "We have sent an email with instructions to reset your password!"),
        "authSuccessResetPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Email Sent!"),
        "authSuccessSetEmailSentMessage": MessageLookupByLibrary.simpleMessage(
            "Please check your inbox and follow the instructions to complete the email verification process."),
        "authSuccessSetNewPasswordMessage":
            MessageLookupByLibrary.simpleMessage(
                "Your password has been changed successfully!"),
        "authSuccessSetNewPasswordTitle": MessageLookupByLibrary.simpleMessage(
            "Password Successfully Changed!"),
        "authSuccessUnknownMessage":
            MessageLookupByLibrary.simpleMessage("Successful request!"),
        "authSuccessUnknownTitle":
            MessageLookupByLibrary.simpleMessage("Success!"),
        "authValidatorEnterYourEmail":
            MessageLookupByLibrary.simpleMessage("Please enter your email"),
        "authValidatorEnterYourPassword":
            MessageLookupByLibrary.simpleMessage("Please enter your password!"),
        "authValidatorNameMinLength": MessageLookupByLibrary.simpleMessage(
            "Please enter a name with at least 4 characters"),
        "authValidatorPasswordDoNotMatch":
            MessageLookupByLibrary.simpleMessage("The passwords do not match"),
        "authValidatorPasswordInvalidRequirements":
            MessageLookupByLibrary.simpleMessage(
                "Password requires at least one special character \nand one uppercase letter"),
        "authValidatorPasswordMinLength": MessageLookupByLibrary.simpleMessage(
            "Your password have less than 6 characters!"),
        "authValidatorValidEmail":
            MessageLookupByLibrary.simpleMessage("Please enter a valid email"),
        "cancelButton": MessageLookupByLibrary.simpleMessage("Cancel!"),
        "confirmYourPasswordHintText":
            MessageLookupByLibrary.simpleMessage("Confirm your password"),
        "dropDownMenuAboutUs": MessageLookupByLibrary.simpleMessage("About us"),
        "dropDownMenuAchievements":
            MessageLookupByLibrary.simpleMessage("Achievements"),
        "dropDownMenuDashboard":
            MessageLookupByLibrary.simpleMessage("Dashboard"),
        "dropDownMenuHome": MessageLookupByLibrary.simpleMessage("Home"),
        "dropDownMenuLogout": MessageLookupByLibrary.simpleMessage("Logout"),
        "dropDownMenuPortfolio":
            MessageLookupByLibrary.simpleMessage("Portfolio"),
        "dropDownMenuSettings":
            MessageLookupByLibrary.simpleMessage("Settings"),
        "dropDownMeuGoals": MessageLookupByLibrary.simpleMessage("Goals"),
        "editDetailsAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Edit Profile"),
        "editDetailsChangeDisplayName":
            MessageLookupByLibrary.simpleMessage("Change your user name"),
        "editDetailsChangeEmail":
            MessageLookupByLibrary.simpleMessage("Change your email"),
        "editDetailsChangePassword":
            MessageLookupByLibrary.simpleMessage("Change your password"),
        "editDetailsChooseAvatar":
            MessageLookupByLibrary.simpleMessage("Choose your avatar"),
        "editDetailsConfirmNewPasswordHintText":
            MessageLookupByLibrary.simpleMessage("Confirm your new password"),
        "editDetailsDelete": MessageLookupByLibrary.simpleMessage("Delete"),
        "editDetailsDeleteAccount":
            MessageLookupByLibrary.simpleMessage("Delete your account"),
        "editDetailsDeleteAccountWarning": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete your account? This action cannot be undone!"),
        "editDetailsDeleteAccoutnWarningPersonalData":
            MessageLookupByLibrary.simpleMessage(
                "Deleting your profile will remove all personal data!"),
        "editDetailsNewEmailHintText":
            MessageLookupByLibrary.simpleMessage("New email"),
        "editDetailsNewPasswordHintText":
            MessageLookupByLibrary.simpleMessage("New password"),
        "editDetailsProfilePicture":
            MessageLookupByLibrary.simpleMessage("PROFILE PICTURE"),
        "editDetailsSadToSeeYouGo":
            MessageLookupByLibrary.simpleMessage("Sad to See You Go"),
        "emailHintText": MessageLookupByLibrary.simpleMessage("Email"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot your password?"),
        "getStartedButton":
            MessageLookupByLibrary.simpleMessage("Begin your journey"),
        "getStartedText": MessageLookupByLibrary.simpleMessage(
            "Take off towards your\nFinancial Independence"),
        "homeCurrentBalance":
            MessageLookupByLibrary.simpleMessage("Current Balance"),
        "homeDashboardTitle": MessageLookupByLibrary.simpleMessage("Dashboard"),
        "homeGoalCardTitle": MessageLookupByLibrary.simpleMessage(
            "Journey to Financial Independence"),
        "homeInvestedAmount":
            MessageLookupByLibrary.simpleMessage("Invested Amount"),
        "homeLastMonthDividendsValue":
            MessageLookupByLibrary.simpleMessage("Last Month Dividends"),
        "homeMonthDividendsGoal":
            MessageLookupByLibrary.simpleMessage("Month Dividends Goal"),
        "homeOperationTitle":
            MessageLookupByLibrary.simpleMessage("Transaction"),
        "homePortfolioTitle": MessageLookupByLibrary.simpleMessage("Portfolio"),
        "homeSearchBarHint":
            MessageLookupByLibrary.simpleMessage("Search for a asset..."),
        "homeValueInDollar": m0,
        "homeValueInReais": m1,
        "homeWelcomeMessage":
            MessageLookupByLibrary.simpleMessage("Let\'s start investing!"),
        "homeWelcomeTitle": m2,
        "loading": MessageLookupByLibrary.simpleMessage("Loading!"),
        "loginForm": MessageLookupByLibrary.simpleMessage("Sign in"),
        "nameHintText": MessageLookupByLibrary.simpleMessage("Name"),
        "passwordHintText": MessageLookupByLibrary.simpleMessage("Password"),
        "recoverPasswordBody": MessageLookupByLibrary.simpleMessage(
            "No problem! Just enter your email \nand our astrounauts will send you a recovery code!"),
        "remoteStorageErrorRetryLimitExceededMessage":
            MessageLookupByLibrary.simpleMessage(
                "The operation\'s time limit has been exceeded, please try again."),
        "remoteStorageErrorRetryLimitExceededTitle":
            MessageLookupByLibrary.simpleMessage("Time Exceeded"),
        "remoteStorageErrorUnknownMessage":
            MessageLookupByLibrary.simpleMessage(
                "Unknown error, please try again."),
        "remoteStorageErrorUnknownTitle":
            MessageLookupByLibrary.simpleMessage("Unknown Error"),
        "saveButton": MessageLookupByLibrary.simpleMessage("Save!"),
        "settingsAboutUs": MessageLookupByLibrary.simpleMessage("About us"),
        "settingsAppBarTitle": MessageLookupByLibrary.simpleMessage("Settings"),
        "settingsBRL": MessageLookupByLibrary.simpleMessage("BRL"),
        "settingsCurrency": MessageLookupByLibrary.simpleMessage("Currency"),
        "settingsDark": MessageLookupByLibrary.simpleMessage("Dark"),
        "settingsEmailIsNotVerified":
            MessageLookupByLibrary.simpleMessage("Your email is not verified!"),
        "settingsEnglish": MessageLookupByLibrary.simpleMessage("English"),
        "settingsErrorExternalLinkMessage": MessageLookupByLibrary.simpleMessage(
            "An error occurred while opening an external link, please try again!"),
        "settingsErrorExternalLinkTitle": MessageLookupByLibrary.simpleMessage(
            "Error opening external link!"),
        "settingsErrorOnSaveTitle":
            MessageLookupByLibrary.simpleMessage("Error Saving Settings!"),
        "settingsErrorOnSaveessage": MessageLookupByLibrary.simpleMessage(
            "An error occurred while saving the settings, please try again!"),
        "settingsErrorUnknownMessage":
            MessageLookupByLibrary.simpleMessage("An unknown error occurred."),
        "settingsErrorUnknownTitle":
            MessageLookupByLibrary.simpleMessage("Unknown error!"),
        "settingsLanguage": MessageLookupByLibrary.simpleMessage("Language"),
        "settingsLight": MessageLookupByLibrary.simpleMessage("Light"),
        "settingsLogout": MessageLookupByLibrary.simpleMessage("Logout"),
        "settingsLogoutButton": MessageLookupByLibrary.simpleMessage("Logout"),
        "settingsLogoutWarningMessage": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to logout?"),
        "settingsPortuguese":
            MessageLookupByLibrary.simpleMessage("Portuguese"),
        "settingsSpanish": MessageLookupByLibrary.simpleMessage("Spanish"),
        "settingsSuccessChangeAvatarMessage":
            MessageLookupByLibrary.simpleMessage(
                "Your avatar has been changed successfully!"),
        "settingsSuccessChangeAvatarTitle":
            MessageLookupByLibrary.simpleMessage(
                "Avatar changed successfully!"),
        "settingsSuccessNameUpdatedMessage":
            MessageLookupByLibrary.simpleMessage(
                "Your user name has been changed successfully!"),
        "settingsSuccessNameUpdatedTitle": MessageLookupByLibrary.simpleMessage(
            "User Name changed successfully!"),
        "settingsSuccessPasswordChangedMessage":
            MessageLookupByLibrary.simpleMessage(
                "Your password has been changed successfully!"),
        "settingsSuccessPasswordChangedTitle":
            MessageLookupByLibrary.simpleMessage(
                "Password changed successfully!"),
        "settingsSuccessUnknownMessage":
            MessageLookupByLibrary.simpleMessage("Successful request!"),
        "settingsSuccessUnknownTitle":
            MessageLookupByLibrary.simpleMessage("Success!"),
        "settingsSuccessUpdateEmaiMessage":
            MessageLookupByLibrary.simpleMessage(
                "Your email has been changed successfully!"),
        "settingsSuccessUpdateEmaiTitle":
            MessageLookupByLibrary.simpleMessage("Email changed successfully!"),
        "settingsUSD": MessageLookupByLibrary.simpleMessage("USD"),
        "signInDoNotHaveAccount":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "signInSignUp": MessageLookupByLibrary.simpleMessage("Sign up!"),
        "signInWith": MessageLookupByLibrary.simpleMessage("Or sign in with"),
        "signUpAgreeTerms": MessageLookupByLibrary.simpleMessage(
            "I agree to the terms and conditions"),
        "signUpSubTitle":
            MessageLookupByLibrary.simpleMessage("You can edit them later!"),
        "signUpTitle":
            MessageLookupByLibrary.simpleMessage("Enter your details"),
        "splashScreenText": MessageLookupByLibrary.simpleMessage(
            "Track your assets and \njourney to financial success!"),
        "submitButton": MessageLookupByLibrary.simpleMessage("Submit!")
      };
}
