class CredentialDTO {
  final String acessToken;
  String? idToken;
  String? secret;

  CredentialDTO(this.idToken, this.secret, {required this.acessToken});
}
