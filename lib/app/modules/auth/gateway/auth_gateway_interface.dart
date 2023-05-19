import 'package:firebase_auth/firebase_auth.dart';
import 'package:up_invest_front/app/modules/auth/credential_dto.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';

abstract class IAuthGateway {
  final FirebaseAuth auth;

  IAuthGateway({required this.auth});
  Future<AuthUserModel> signInWithEmailAndPassword(
      String email, String password);

  Future<AuthUserModel> signInWithSocialNetwork(
      String socialNetwork, CredentialDTO credentialDTO);

  Future<AuthUserModel> createAccount(
      String email, String password, String displayName, String avatar);

  Future<void> updatePassword(
      String oldPassword, String newPassword, String email);

  Future<void> updatePhoto(String newAvatarPicture);

  Future<void> updateDisplayName(String newDisplayName);

  Future<void> deleteUser();

  Future<void> sendPasswordResetEmail(String email);

  Future<void> signOut();

  Future<bool> isUserSignedIn();

  Future<AuthUserModel> getLoggedUser();
  Future<void> reauthenticateAUser(String email, String password);
}
