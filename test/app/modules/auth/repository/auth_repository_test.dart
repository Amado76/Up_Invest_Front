import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';

import '../../../../mocks/gateway/auth_gateway_mock.dart';
import '../../../../mocks/gateway/social_network_gateway_mock.dart';

void main() async {
  group('AuthRepository', () {
    final authGatewayMock = AuthGatewayMock();
    final socialNetworkGatewayMock = SocialNetworkGatewayMock();
    final authRepository =
        AuthRepository(authGatewayMock, socialNetworkGatewayMock);

    test('Should return an AuthUser when creating a new account', () async {
      //Act
      AuthUserModel expectUser = await authRepository.createAccount(
          email: 'email',
          password: 'password',
          displayName: 'displayName',
          avatar: 'avatarPicture');
      //Assert
      expect(expectUser, const TypeMatcher<AuthUserModel>());
    });
    test('Should return an AuthUser when logging', () async {
      //Act
      AuthUserModel expectUser =
          await authRepository.signInWithEmailAndPassword('email', 'password');
      //Assert
      expect(expectUser, const TypeMatcher<AuthUserModel>());
    });
  });
}
