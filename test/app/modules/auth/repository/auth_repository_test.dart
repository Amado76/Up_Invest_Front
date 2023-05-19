import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/auth/gateway/auth_gateway_interface.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';

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

class AuthUserModelMock extends Mock implements AuthUserModel {
  @override
  String get userId => 'SoItSeemsLikeThisInternetThingIsHereToStay.';
  @override
  String get email => 'chandler@bing.com';
  @override
  String get token => 'IMakeJokesWhenIamUncomfortable.';
  @override
  String get displayName => 'Chandler Bing';
  @override
  String get avatarPicture => 'default';
  @override
  String get signInMethod => 'facebook';
  @override
  bool get isEmailVerified => true;
}

void main() async {
  group('AuthRepository', () {
    final authGatewayMock = AuthGatewayMock();
    final authRepository = AuthRepository(authGatewayMock);

    test('Should return an AuthUser when creating a new account', () async {
      //Act
      AuthUserModel expectUser = await authRepository.createAccount(
          'email', 'password', 'displayName', 'avatarPicture');
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
