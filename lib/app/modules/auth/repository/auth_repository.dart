import 'package:up_invest_front/app/modules/auth/gateway/auth_gateway_interface.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  @override
  final IAuthGateway authGateway;

  AuthRepository(this.authGateway);
  @override
  Future<AuthUserModel> createAccount(String email, String password,
      String displayName, String avatarPicture) async {
    AuthUserModel user = await authGateway.createAccount(
        email, password, displayName, avatarPicture);
    return user;
  }

  @override
  Future<void> deleteUser(String email, String password) async {
    authGateway.deleteUser(email, password);
  }

  @override
  Future<bool> isUserSignedIn() async {
    return await authGateway.isUserSignedIn();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    authGateway.sendPasswordResetEmail(email);
  }

  @override
  Future<AuthUserModel> signInWithEmailAndPassword(
      String email, String password) async {
    AuthUserModel user =
        await authGateway.signInWithEmailAndPassword(email, password);
    return user;
  }

  @override
  Future<AuthUserModel> signInWithSocialNetwork(
      String email, String socialNetwork) {
    // TODO: implement singInWithSocialNetwork
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    authGateway.signOut();
  }

  @override
  Future<void> updatePassword(
      String oldPassword, String newPassword, String email) async {
    authGateway.updatePassword(oldPassword, newPassword, email);
  }

  @override
  Future<AuthUserModel> getLoggedUser() {
    return authGateway.getLoggedUser();
  }
}
