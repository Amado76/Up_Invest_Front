class AuthUserModel {
  final String userId;
  final String token;
  final String displayName;
  final bool isEmailVerified;
  AuthUserModel(
      {required this.displayName,
      required this.isEmailVerified,
      required this.userId,
      required this.token});
}
