import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/auth/adapter/auth_adapter_interface.dart';
import 'package:up_invest_front/app/modules/auth/util/credential_dto.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';

import '../model/auth_user_model_mock.dart';

class AuthAdapterMock extends Mock implements FirebaseAuthAdapter {
  @override
  Future<AuthUserModel> createAccount(String email, String password) async {
    return AuthUserModelMock();
  }

  @override
  Future<AuthUserModel> signInWithEmailAndPassword(
      String email, String password) async {
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
