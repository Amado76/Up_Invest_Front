import 'package:up_invest_front/app/modules/auth/credential_dto.dart';
import 'package:up_invest_front/app/modules/auth/gateway/auth_gateway_interface.dart';
import 'package:up_invest_front/app/modules/auth/gateway/auth_social_network_gateway_interface.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  @override
  final IAuthGateway authGateway;
  @override
  final IAuthSocialNetworkGateway authSocialNetworkGateway;

  AuthRepository(this.authGateway, this.authSocialNetworkGateway);
  @override
  Future<AuthUserModel> createAccount(
      {required String email,
      required String password,
      required String displayName,
      required String avatar}) async {
    AuthUserModel user =
        await authGateway.createAccount(email, password, displayName, avatar);
    return user;
  }

  @override
  Future<void> deleteUser() async {
    authGateway.deleteUser();
  }

  @override
  Future<bool> isUserSignedIn() async {
    return await authGateway.isUserSignedIn();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await authGateway.sendPasswordResetEmail(email);
  }

  @override
  Future<AuthUserModel> signInWithEmailAndPassword(
      String email, String password) async {
    AuthUserModel user =
        await authGateway.signInWithEmailAndPassword(email, password);
    return user;
  }

  @override
  Future<AuthUserModel> signInWithSocialNetwork(String socialNetwork) async {
    final CredentialDTO credential;
    final AuthUserModel authUser;

    credential = await getGoogleCredential();
    authUser =
        await authGateway.signInWithSocialNetwork(socialNetwork, credential);

    return authUser;
  }

  Future<CredentialDTO> getGoogleCredential() async {
    final CredentialDTO googleCredential;
    googleCredential = await authSocialNetworkGateway.getCredential('google');
    return googleCredential;
  }

  @override
  Future<void> signOut() async {
    authGateway.signOut();
  }

  @override
  Future<void> updatePhoto(String newAvatar) async {
    await authGateway.updatePhoto(newAvatar);
  }

  @override
  Future<void> updatePassword(
      {required String oldPassword,
      required String newPassword,
      required String email}) async {
    await authGateway.updatePassword(oldPassword, newPassword, email);
  }

  @override
  Future<AuthUserModel> getLoggedUser() async {
    return await authGateway.getLoggedUser();
  }

  @override
  Future<void> reauthenticateAUser(String email, String password) async {
    await authGateway.reauthenticateAUser(email, password);
  }
}
