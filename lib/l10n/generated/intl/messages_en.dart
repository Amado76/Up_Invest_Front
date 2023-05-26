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
