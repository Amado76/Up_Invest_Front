import 'package:firebase_auth/firebase_auth.dart';
import 'package:up_invest_front/app/modules/auth/credential_dto.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';

abstract class IAuthGateway {
  final FirebaseAuth auth;

  IAuthGateway({required this.auth});
  Future<AuthUserModel> singInWithEmailAndPassword(
      String email, String password);

  Future<AuthUserModel> singInWithSocialNetwork(
      String socialNetwork, CredentialDTO credentialDTO);

  Future<AuthUserModel> createAccount(
      String email, String password, String displayName, String avatarPicture);

  Future<void> updatePassword(
      String oldPassword, String newPassword, String email);

  Future<void> updatePhoto(String newAvatarPicture);

  Future<void> updateDisplayName(String newDisplayName);

  Future<void> deleteUser(String email, String password);

  Future<void> sendPasswordResetEmail(String email);

  Future<void> singOut();

  Future<bool> isUserSignedIn();
}
