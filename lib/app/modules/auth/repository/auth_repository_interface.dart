import 'package:up_invest_front/app/modules/auth/gateway/auth_gateway_interface.dart';
import 'package:up_invest_front/app/modules/auth/gateway/auth_social_network_gateway_interface.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';

abstract class IAuthRepository {
  final IAuthGateway authGateway;
  final IAuthSocialNetworkGateway authSocialNetworkGateway;

  IAuthRepository(
      {required this.authSocialNetworkGateway, required this.authGateway});

  Future<AuthUserModel> signInWithEmailAndPassword(
      String email, String password);

  Future<AuthUserModel> signInWithSocialNetwork(String socialNetwork);

  Future<AuthUserModel> createAccount(
      {required String email,
      required String password,
      required String displayName,
      required String avatar});

  Future<void> updatePassword(
      {required String oldPassword,
      required String newPassword,
      required String email});

  Future<void> updatePhoto(String newAvatar);

  Future<void> deleteUser();

  Future<void> sendPasswordResetEmail(String email);

  Future<void> signOut();

  Future<bool> isUserSignedIn();

  Future<AuthUserModel> getLoggedUser();

  Future<void> reauthenticateAUser(String email, String password);
}
