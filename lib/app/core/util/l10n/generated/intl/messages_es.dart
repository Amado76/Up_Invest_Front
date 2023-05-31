// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "authErrorEmailAlreadyExistsMessage":
            MessageLookupByLibrary.simpleMessage(
                "Por favor, elija otro correo electrónico para registrarse"),
        "authErrorEmailAlreadyExistsTitle":
            MessageLookupByLibrary.simpleMessage("Correo electrónico en uso"),
        "authErrorInvalidEmailMessage": MessageLookupByLibrary.simpleMessage(
            "Por favor, ingresa una dirección de correo electrónico válida"),
        "authErrorInvalidEmailTitle":
            MessageLookupByLibrary.simpleMessage("Correo electrónico inválido"),
        "authErrorNetworkErrorMessage": MessageLookupByLibrary.simpleMessage(
            "Por favor, verifica tu conexión a internet y vuelve a intentarlo"),
        "authErrorNetworkErrorTitle":
            MessageLookupByLibrary.simpleMessage("Error de conexión"),
        "authErrorOperationNotAllowedMessage":
            MessageLookupByLibrary.simpleMessage(
                "No puedes registrarte usando este método en este momento"),
        "authErrorOperationNotAllowedTitle":
            MessageLookupByLibrary.simpleMessage("Operación no permitida"),
        "authErrorRequiresRecentLoginMessage": MessageLookupByLibrary.simpleMessage(
            "Debes cerrar sesión e iniciarla nuevamente para realizar esta operación"),
        "authErrorRequiresRecentLoginTitle":
            MessageLookupByLibrary.simpleMessage(
                "Requiere inicio de sesión reciente"),
        "authErrorTokenExpiredMessage": MessageLookupByLibrary.simpleMessage(
            "Tu sesión ha expirado. Por favor, inicia la sesión nuevamente"),
        "authErrorTokenExpiredTitle":
            MessageLookupByLibrary.simpleMessage("Sesión expirada"),
        "authErrorTokenRevokedMessage": MessageLookupByLibrary.simpleMessage(
            "Tu sesión ha expirado. Por favor, inicia la sesión nuevamente"),
        "authErrorTokenRevokedTitle":
            MessageLookupByLibrary.simpleMessage("Sesión expirada"),
        "authErrorTooManyRequestsMessage": MessageLookupByLibrary.simpleMessage(
            "El acceso a esta cuenta ha sido temporalmente desactivado debido a muchos intentos de inicio de sesión fallidos"),
        "authErrorTooManyRequestsTitle": MessageLookupByLibrary.simpleMessage(
            "Demasiados intentos de inicio de sesión"),
        "authErrorUnknownMessage": MessageLookupByLibrary.simpleMessage(
            "Error de autenticación desconocido"),
        "authErrorUnknownTitle":
            MessageLookupByLibrary.simpleMessage("Error de autenticación"),
        "authErrorUserMismatchMessage": MessageLookupByLibrary.simpleMessage(
            "Las credenciales proporcionadas no corresponden al usuario"),
        "authErrorUserMismatchTitle":
            MessageLookupByLibrary.simpleMessage("Incompatibilidad de usuario"),
        "authErrorUserNotFoundMessage": MessageLookupByLibrary.simpleMessage(
            "No se encontró ningún usuario actual con esta información"),
        "authErrorUserNotFoundTitle":
            MessageLookupByLibrary.simpleMessage("Usuario no encontrado"),
        "authErrorWeakPasswordMessage": MessageLookupByLibrary.simpleMessage(
            "Por favor, elige una contraseña más fuerte"),
        "authErrorWeakPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Contraseña débil"),
        "authErrorWrongPasswordMessage": MessageLookupByLibrary.simpleMessage(
            "Por favor, verifica tu correo electrónico y contraseña e intenta nuevamente"),
        "authErrorWrongPasswordTitle": MessageLookupByLibrary.simpleMessage(
            "Correo electrónico o contraseña incorrectos"),
        "authSuccessResetPasswordMessage": MessageLookupByLibrary.simpleMessage(
            "Hemos enviado un correo electrónico con instrucciones para restablecer tu contraseña."),
        "authSuccessResetPasswordTitle": MessageLookupByLibrary.simpleMessage(
            "¡Correo Electrónico Enviado!"),
        "authSuccessSetNewPasswordMessage":
            MessageLookupByLibrary.simpleMessage(
                "Tu contraseña ha sido cambiada exitosamente!"),
        "authSuccessSetNewPasswordTitle": MessageLookupByLibrary.simpleMessage(
            "¡Contraseña Cambiada Exitosamente!"),
        "authSuccessUnknownMessage":
            MessageLookupByLibrary.simpleMessage("¡Solicitud exitosa!"),
        "authSuccessUnknownTitle":
            MessageLookupByLibrary.simpleMessage("Éxito!"),
        "authValidatorEnterYourEmail": MessageLookupByLibrary.simpleMessage(
            "Por favor, ingrese su correo electrónico"),
        "authValidatorEnterYourPassword": MessageLookupByLibrary.simpleMessage(
            "Por favor, ingrese su contraseña"),
        "authValidatorNameMinLength": MessageLookupByLibrary.simpleMessage(
            "Por favor, ingrese un nombre con al menos 4 caracteres"),
        "authValidatorPasswordDoNotMatch": MessageLookupByLibrary.simpleMessage(
            "Las contraseñas no coinciden"),
        "authValidatorPasswordInvalidRequirements":
            MessageLookupByLibrary.simpleMessage(
                "La contraseña debe contener al menos un carácter especial \ny una letra mayúscula"),
        "authValidatorPasswordMinLength": MessageLookupByLibrary.simpleMessage(
            "Su contraseña tiene menos de 6 caracteres"),
        "authValidatorValidEmail": MessageLookupByLibrary.simpleMessage(
            "Por favor, ingrese un correo electrónico válido"),
        "confirmYourPasswordHintText":
            MessageLookupByLibrary.simpleMessage("Confirma tu contraseña"),
        "emailHintText":
            MessageLookupByLibrary.simpleMessage("Correo electrónico"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("¿Olvidaste tu contraseña?"),
        "getStartedButton":
            MessageLookupByLibrary.simpleMessage("Empieza tu viaje"),
        "getStartedText": MessageLookupByLibrary.simpleMessage(
            "Vuela hacia tu \nindependencia financiera"),
        "loading": MessageLookupByLibrary.simpleMessage("Cargando!"),
        "loginForm": MessageLookupByLibrary.simpleMessage("Iniciar sesión"),
        "nameHintText": MessageLookupByLibrary.simpleMessage("Nombre"),
        "passwordHintText": MessageLookupByLibrary.simpleMessage("Contraseña"),
        "recoverPasswordBody": MessageLookupByLibrary.simpleMessage(
            "¡Sin problemas! ¡Simplemente ingrese tu e-mail y nuestros astronautas le enviarán el código de recuperación!"),
        "settingsAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Configuraciones"),
        "settingsDark": MessageLookupByLibrary.simpleMessage("Oscuro"),
        "settingsEnglish": MessageLookupByLibrary.simpleMessage("Inglés"),
        "settingsErrorOnSaveTitle": MessageLookupByLibrary.simpleMessage(
            "Error al guardar la configuración"),
        "settingsErrorUnknownMessage": MessageLookupByLibrary.simpleMessage(
            "Se produjo un error desconocido"),
        "settingsErrorUnknownTitle":
            MessageLookupByLibrary.simpleMessage("Error desconocido"),
        "settingsLanguage": MessageLookupByLibrary.simpleMessage("Idioma"),
        "settingsLight": MessageLookupByLibrary.simpleMessage("Claro"),
        "settingsPortuguese": MessageLookupByLibrary.simpleMessage("Portugués"),
        "settingsSpanish": MessageLookupByLibrary.simpleMessage("Español"),
        "signInDoNotHaveAccount":
            MessageLookupByLibrary.simpleMessage("¿No tienes una cuenta?"),
        "signInSignUp": MessageLookupByLibrary.simpleMessage("¡Regístrate!"),
        "signInWith": MessageLookupByLibrary.simpleMessage("o contiuar con"),
        "signUpAgreeTerms": MessageLookupByLibrary.simpleMessage(
            "Acepto los términos y condiciones"),
        "signUpSubTitle": MessageLookupByLibrary.simpleMessage(
            "¡Puedes editarlos más tarde!"),
        "signUpTitle":
            MessageLookupByLibrary.simpleMessage("Ingresa tus datos"),
        "splashScreenText": MessageLookupByLibrary.simpleMessage(
            "¡Haga un seguimiento de tus activos y vuela hacia el éxito financiero!"),
        "submitButton": MessageLookupByLibrary.simpleMessage("Enviar!")
      };
}
