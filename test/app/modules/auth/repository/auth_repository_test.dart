import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';

import '../../../../mocks/gateway/auth_gateway_mock.dart';
import '../../../../mocks/gateway/auth_social_network_gateway_mock.dart';
import '../gateway/auth_gateway_test.dart';

void main() async {
  group('AuthRepository', () {
    final authGatewayMock = AuthGatewayMock();
    final authSocialNetworkGateway = AuthSocialNetworkGatewayMock();
    final authRepository =
        AuthRepository(authGatewayMock, authSocialNetworkGateway);

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
    test('Should return an AuthUser when logging with google', () async {
      //Arrange

      when(() => authSocialNetworkGateway.getCredential('google'))
          .thenAnswer((_) async => CredentialDTOMock());

      //Act
      AuthUserModel expectUser =
          await authRepository.signInWithSocialNetwork('google');
      //Assert

      expect(expectUser, const TypeMatcher<AuthUserModel>());
    });
  });
}
