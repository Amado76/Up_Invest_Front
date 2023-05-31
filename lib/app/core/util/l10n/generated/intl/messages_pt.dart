// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
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
  String get localeName => 'pt';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "authErrorEmailAlreadyExistsMessage":
            MessageLookupByLibrary.simpleMessage(
                "Por favor, escolha outro email para se cadastrar!"),
        "authErrorEmailAlreadyExistsTitle":
            MessageLookupByLibrary.simpleMessage("Email em uso"),
        "authErrorInvalidEmailMessage": MessageLookupByLibrary.simpleMessage(
            "Por favor, insira um endereço de email válido!"),
        "authErrorInvalidEmailTitle":
            MessageLookupByLibrary.simpleMessage("Email inválido"),
        "authErrorNetworkErrorMessage": MessageLookupByLibrary.simpleMessage(
            "Por favor, verifique sua conexão com a internet e tente novamente."),
        "authErrorNetworkErrorTitle":
            MessageLookupByLibrary.simpleMessage("Erro de conexão!"),
        "authErrorOperationNotAllowedMessage":
            MessageLookupByLibrary.simpleMessage(
                "Você não pode se cadastrar usando este método neste momento!"),
        "authErrorOperationNotAllowedTitle":
            MessageLookupByLibrary.simpleMessage("Operação não permitida"),
        "authErrorRequiresRecentLoginMessage": MessageLookupByLibrary.simpleMessage(
            "Você precisa sair e entrar novamente para realizar esta operação"),
        "authErrorRequiresRecentLoginTitle":
            MessageLookupByLibrary.simpleMessage("Requer login recente"),
        "authErrorTokenExpiredMessage": MessageLookupByLibrary.simpleMessage(
            "Sua sessão expirou. Por favor, faça o login novamente!"),
        "authErrorTokenExpiredTitle":
            MessageLookupByLibrary.simpleMessage("Sessão expirada"),
        "authErrorTokenRevokedMessage": MessageLookupByLibrary.simpleMessage(
            "Sua sessão expirou. Por favor, faça o login novamente!"),
        "authErrorTokenRevokedTitle":
            MessageLookupByLibrary.simpleMessage("Sessão expirada"),
        "authErrorTooManyRequestsMessage": MessageLookupByLibrary.simpleMessage(
            "O acesso a esta conta foi temporariamente bloqueado devido a muitas tentativas de login fracassadas."),
        "authErrorTooManyRequestsTitle":
            MessageLookupByLibrary.simpleMessage("Muitas tentativas de login!"),
        "authErrorUnknownMessage": MessageLookupByLibrary.simpleMessage(
            "Erro de autenticação desconhecido"),
        "authErrorUnknownTitle":
            MessageLookupByLibrary.simpleMessage("Erro de autenticação"),
        "authErrorUserMismatchMessage": MessageLookupByLibrary.simpleMessage(
            "As credenciais fornecidas não correspondem ao usuário!"),
        "authErrorUserMismatchTitle": MessageLookupByLibrary.simpleMessage(
            "Incompatibilidade de usuário"),
        "authErrorUserNotFoundMessage": MessageLookupByLibrary.simpleMessage(
            "Nenhum usuário atual com estas informações foi encontrado!"),
        "authErrorUserNotFoundTitle":
            MessageLookupByLibrary.simpleMessage("Usuário não encontrado!"),
        "authErrorWeakPasswordMessage": MessageLookupByLibrary.simpleMessage(
            "Por favor, escolha uma senha mais forte!"),
        "authErrorWeakPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Senha fraca"),
        "authErrorWrongPasswordMessage": MessageLookupByLibrary.simpleMessage(
            "Por favor, verifique seu email e senha e tente novamente."),
        "authErrorWrongPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Email ou senha incorretos"),
        "authSuccessResetPasswordMessage": MessageLookupByLibrary.simpleMessage(
            "Enviamos um email com instruções para redefinir sua senha!"),
        "authSuccessResetPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Email Enviado!"),
        "authSuccessSetNewPasswordMessage":
            MessageLookupByLibrary.simpleMessage(
                "Sua senha foi alterada com sucesso!"),
        "authSuccessSetNewPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Senha Alterada com Sucesso!"),
        "authSuccessUnknownMessage":
            MessageLookupByLibrary.simpleMessage("Requisição bem-sucedida!"),
        "authSuccessUnknownTitle":
            MessageLookupByLibrary.simpleMessage("Sucesso!"),
        "authValidatorEnterYourEmail": MessageLookupByLibrary.simpleMessage(
            "Por favor, digite seu e-mail"),
        "authValidatorEnterYourPassword": MessageLookupByLibrary.simpleMessage(
            "Por favor, digite sua senha!"),
        "authValidatorNameMinLength": MessageLookupByLibrary.simpleMessage(
            "Por favor, digite um nome com pelo menos 4 caracteres"),
        "authValidatorPasswordDoNotMatch":
            MessageLookupByLibrary.simpleMessage("As senhas não correspondem"),
        "authValidatorPasswordInvalidRequirements":
            MessageLookupByLibrary.simpleMessage(
                "A senha deve conter pelo menos um caractere especial \ne uma letra maiúscula"),
        "authValidatorPasswordMinLength": MessageLookupByLibrary.simpleMessage(
            "Sua senha possui menos de 6 caracteres!"),
        "authValidatorValidEmail": MessageLookupByLibrary.simpleMessage(
            "Por favor, digite um e-mail válido"),
        "confirmYourPasswordHintText":
            MessageLookupByLibrary.simpleMessage("Confirme sua senha"),
        "emailHintText": MessageLookupByLibrary.simpleMessage("E-mail"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Esqueceu sua senha?"),
        "getStartedButton":
            MessageLookupByLibrary.simpleMessage("Inicie sua jornada"),
        "getStartedText": MessageLookupByLibrary.simpleMessage(
            "Voe para a sua\nIndependência financeira"),
        "loading": MessageLookupByLibrary.simpleMessage("Carregando!"),
        "loginForm": MessageLookupByLibrary.simpleMessage("Fazer login"),
        "nameHintText": MessageLookupByLibrary.simpleMessage("Nome"),
        "passwordHintText": MessageLookupByLibrary.simpleMessage("Senha"),
        "recoverPasswordBody": MessageLookupByLibrary.simpleMessage(
            "Sem problemas! Basta digitar o seu e-mail \ne nossos astrounautas enviarão o código \nde recuperação para você!"),
        "settingsAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Configurações"),
        "settingsDark": MessageLookupByLibrary.simpleMessage("Escuro"),
        "settingsEnglish": MessageLookupByLibrary.simpleMessage("Ingles"),
        "settingsErrorOnSaveTitle": MessageLookupByLibrary.simpleMessage(
            "Erro ao salvar as configurações!"),
        "settingsErrorUnknownMessage": MessageLookupByLibrary.simpleMessage(
            "Ocorreu um erro desconhecido."),
        "settingsErrorUnknownTitle":
            MessageLookupByLibrary.simpleMessage("Erro desconhecido!"),
        "settingsLanguage": MessageLookupByLibrary.simpleMessage("Idioma"),
        "settingsLight": MessageLookupByLibrary.simpleMessage("Claro"),
        "settingsPortuguese": MessageLookupByLibrary.simpleMessage("Portugues"),
        "settingsSpanish": MessageLookupByLibrary.simpleMessage("Espanhol"),
        "signInDoNotHaveAccount":
            MessageLookupByLibrary.simpleMessage("Ainda não tem uma conta?"),
        "signInSignUp": MessageLookupByLibrary.simpleMessage("Cadastre-se!"),
        "signInWith": MessageLookupByLibrary.simpleMessage("Ou continue com"),
        "signUpAgreeTerms": MessageLookupByLibrary.simpleMessage(
            "Concordo com os termos de uso"),
        "signUpSubTitle": MessageLookupByLibrary.simpleMessage(
            "Você poderá edita-los mais tarde!"),
        "signUpTitle":
            MessageLookupByLibrary.simpleMessage("Preencha os seus dados"),
        "splashScreenText": MessageLookupByLibrary.simpleMessage(
            "Acompanhe seus ativos e \nvoe até o seu sucesso financeiro!"),
        "submitButton": MessageLookupByLibrary.simpleMessage("Submeter!")
      };
}
