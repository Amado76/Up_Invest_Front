import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';

abstract class IAuthGateway {
  Future<AuthUserModel> singInWithEmailAndPassword(
      String email, String password, bool keepLogged);
  Future<AuthUserModel> singInWithSocialNetwork(
      String email, String socialNetwork);
  Future<AuthUserModel> createAccount(
      String email, String password, bool keepLogged);
  Future<void> updatePassword(String oldPassword, String newPassword);
  Future<void> deleteUser();
  Future<void> sendPasswordResetEmail(String email);
  Future<void> singOunt();
  Future<bool> isUserLoggedIn();
}
