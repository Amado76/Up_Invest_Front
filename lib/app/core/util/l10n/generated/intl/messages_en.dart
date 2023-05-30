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

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
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
        "authSuccessResetPasswordMessage": MessageLookupByLibrary.simpleMessage(
            "We have sent an email with instructions to reset your password!"),
        "authSuccessResetPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Email Sent!"),
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
        "confirmYourPasswordHintText":
            MessageLookupByLibrary.simpleMessage("Confirm your password"),
        "emailHintText": MessageLookupByLibrary.simpleMessage("Email"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot your password?"),
        "getStartedButton":
            MessageLookupByLibrary.simpleMessage("Begin your journey"),
        "getStartedText": MessageLookupByLibrary.simpleMessage(
            "Take off towards your\nFinancial Independence"),
        "loading": MessageLookupByLibrary.simpleMessage("Loading!"),
        "loginForm": MessageLookupByLibrary.simpleMessage("Sign in"),
        "nameHintText": MessageLookupByLibrary.simpleMessage("Name"),
        "passwordHintText": MessageLookupByLibrary.simpleMessage("Password"),
        "recoverPasswordBody": MessageLookupByLibrary.simpleMessage(
            "No problem! Just enter your email \nand our astrounauts will send you a recovery code!"),
        "settignsEnglish": MessageLookupByLibrary.simpleMessage("English"),
        "settignsPortuguese":
            MessageLookupByLibrary.simpleMessage("Portuguese"),
        "settignsSpanish": MessageLookupByLibrary.simpleMessage("Spanish"),
        "settingsAppBarTitle": MessageLookupByLibrary.simpleMessage("Settings"),
        "settingsErrorOnSaveTitle":
            MessageLookupByLibrary.simpleMessage("Error Saving Settings!"),
        "settingsErrorOnSaveessage": MessageLookupByLibrary.simpleMessage(
            "An error occurred while saving the settings, please try again!"),
        "settingsErrorUnknownMessage":
            MessageLookupByLibrary.simpleMessage("An unknown error occurred."),
        "settingsErrorUnknownTitle":
            MessageLookupByLibrary.simpleMessage("Unknown error!"),
        "settingsLanguage": MessageLookupByLibrary.simpleMessage("Language"),
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
