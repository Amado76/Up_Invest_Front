import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/auth/util/credential_dto.dart';
import 'package:up_invest_front/app/modules/auth/gateway/firebase_gateway.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';

import '../model/auth_user_model_mock.dart';

class AuthGatewayMock extends Mock implements FireBaseGateway {
  @override
  Future<AuthUserModel> createAccount(
      String email, String password, String displayName, String avatar) async {
    return AuthUserModelMock();
  }

  @override
  Future<AuthUserModel> signInWithEmailAndPassword(
      String email, String password) async {
    return AuthUserModelMock();
  }

  @override
  Future<void> signOut() async {}
  @override
  Future<void> deleteUser() async {}
  @override
  Future<void> sendPasswordResetEmail(String email) async {}
  @override
  Future<void> updatePassword(
      String oldPassword, String newPassword, String email) async {}
  @override
  Future<void> reauthenticateAUser(String email, String password) async {}
  @override
  signInWithGoogle(CredentialDTO credentialDTO) async {
    return AuthUserModelMock();
  }

  @override
  Future<AuthUserModel> signInWithSocialNetwork(
      String socialNetwork, CredentialDTO credentialDTO) async {
    return AuthUserModelMock();
  }

  @override
  signInWithFacebook(CredentialDTO credentialDTO) async {
    return AuthUserModelMock();
  }
}
