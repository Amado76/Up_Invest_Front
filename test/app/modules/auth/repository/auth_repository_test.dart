import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';

import '../../../../mocks/auth/gateway/auth_gateway_mock.dart';
import '../../../../mocks/auth/gateway/auth_social_network_gateway_mock.dart';
import '../../../../mocks/auth/model/auth_user_model_mock.dart';
import '../gateway/auth_gateway_interface_test.dart';

class MockStreamController<T> extends Mock implements StreamController<T> {}

void main() async {
  group('AuthRepository', () {
    final authGatewayMock = AuthGatewayMock();
    final authSocialNetworkGateway = AuthSocialNetworkGatewayMock();
    final authRepository = AuthRepository(
        authGateway: authGatewayMock,
        authSocialNetworkGateway: authSocialNetworkGateway);

    group('[createAccount]', () {
      test('should return an [AuthUser] when creating a new account', () async {
        //Act
        AuthUserModel expectUser = await authRepository.createAccount(
            email: 'email',
            password: 'password',
            displayName: 'displayName',
            avatar: 'avatarPicture');
        //Assert
        expect(expectUser, const TypeMatcher<AuthUserModel>());
      });
    });

    group('[signInWithEmailAndPassword]', () {
      test('should return an [AuthUser] when logging', () async {
        //Act
        AuthUserModel expectUser = await authRepository
            .signInWithEmailAndPassword('email', 'password');
        //Assert
        expect(expectUser, const TypeMatcher<AuthUserModel>());
      });
    });

    group('[signInWithSocialNetwork]', () {
      test('should return an [AuthUser] when logging with [google]', () async {
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
    group('deleteUser', () {
      test(
          'should call authGateway.deleteUser',
          () async => {
                //Arrange
                when(() => authGatewayMock.deleteUser())
                    .thenAnswer((_) => Future.value()),

                //Act
                await authRepository.deleteUser(),

                //Assert
                verify(() => authGatewayMock.deleteUser()).called(1)
              });
    });
    group('isUserSignedIn', () {
      test(
          'should call authGateway.isUserSignedIn',
          () async => {
                //Arrange
                when(() => authGatewayMock.isUserSignedIn())
                    .thenAnswer((_) async => true),

                //Act
                await authRepository.isUserSignedIn(),

                //Assert
                verify(() => authGatewayMock.isUserSignedIn()).called(1)
              });
    });
    group('sendPasswordResetEmail', () {
      test(
          'should call authGateway.sendPasswordResetEmail',
          () async => {
                //Arrange
                when(() => authGatewayMock.sendPasswordResetEmail('email'))
                    .thenAnswer((_) => Future.value()),

                //Act
                await authRepository.sendPasswordResetEmail('email'),

                //Assert
                verify(() => authGatewayMock.sendPasswordResetEmail('email'))
                    .called(1)
              });
    });
    group('signOut', () {
      test(
          'should call authGateway.signOut',
          () async => {
                //Arrange
                when(() => authGatewayMock.signOut())
                    .thenAnswer((_) => Future.value()),

                //Act
                await authRepository.signOut(),

                //Assert
                verify(() => authGatewayMock.signOut()).called(1)
              });
    });
    group('updatePhoto', () {
      test(
          'should call authGateway.updatePhoto',
          () async => {
                //Arrange
                when(() => authGatewayMock.updatePhoto('avatar'))
                    .thenAnswer((_) => Future.value()),

                //Act
                await authRepository.updatePhoto('avatar'),

                //Assert
                verify(() => authGatewayMock.updatePhoto('avatar')).called(1)
              });
    });
    group('updatePassword', () {
      test(
          'should call authGateway.updatePassword',
          () async => {
                //Arrange
                when(() => authGatewayMock.updatePassword('newPassword'))
                    .thenAnswer((_) => Future.value()),

                //Act
                await authRepository.updatePassword(newPassword: 'newPassword'),

                //Assert
                verify(() => authGatewayMock.updatePassword('newPassword'))
                    .called(1)
              });
    });
    group('getLoggedUser', () {
      test(
          'should call authGateway.getLoggedUser',
          () async => {
                //Arrange
                when(() => authGatewayMock.getLoggedUser())
                    .thenAnswer((_) async => AuthUserModelMock()),

                //Act
                await authRepository.getLoggedUser(),

                //Assert
                verify(() => authGatewayMock.getLoggedUser()).called(1)
              });
    });
    group('reauthenticateAUser', () {
      test(
          'should call authGateway.reauthenticateAUser',
          () async => {
                //Arrange
                when(() => authGatewayMock.reauthenticateAUser(
                    'email', 'password')).thenAnswer((_) => Future.value()),

                //Act
                await authRepository.reauthenticateAUser('email', 'password'),

                //Assert
                verify(() => authGatewayMock.reauthenticateAUser(
                    'email', 'password')).called(1)
              });
    });
  });
}
