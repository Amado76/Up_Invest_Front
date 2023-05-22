import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/auth/gateway/auth_gateway_interface.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';

import '../model/auth_user_model_mock.dart';

class AuthGatewayMock extends Mock implements IAuthGateway {
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
}
