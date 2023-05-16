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
  Future<bool> isUserLoggedIn() {
    // TODO: implement isUserLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    authGateway.sendPasswordResetEmail(email);
  }

  @override
  Future<AuthUserModel> singInWithEmailAndPassword(
      String email, String password) async {
    AuthUserModel user =
        await authGateway.singInWithEmailAndPassword(email, password);
    return user;
  }

  @override
  Future<AuthUserModel> singInWithSocialNetwork(
      String email, String socialNetwork) {
    // TODO: implement singInWithSocialNetwork
    throw UnimplementedError();
  }

  @override
  Future<void> singOut() async {
    authGateway.singOut();
  }

  @override
  Future<void> updatePassword(
      String oldPassword, String newPassword, String email) async {
    authGateway.updatePassword(oldPassword, newPassword, email);
  }
}
