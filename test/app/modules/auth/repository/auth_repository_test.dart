import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';

import '../../../../mocks/auth/adapter/auth_adapter_mock.dart';
import '../../../../mocks/auth/adapter/auth_social_network_adapter_mock.dart';
import '../../../../mocks/auth/model/auth_user_model_mock.dart';
import '../../../../mocks/core/adapter/remote_storage_mock.dart';
import '../adapter/auth_adapter_interface_test.dart';

class MockStreamController<T> extends Mock implements StreamController<T> {}

void main() async {
  group('[AuthRepository]', () {
    final authAdapterMock = AuthAdapterMock();
    final authSocialNetworkAdapter = AuthSocialNetworkAdapterMock();
    final remoteStorageAdapter = RemoteStorageAdapterMock();
    final authRepository = AuthRepository(
        authAdapter: authAdapterMock,
        authSocialNetworkAdapter: authSocialNetworkAdapter,
        remoteStorageAdapter: remoteStorageAdapter);

    test('test stream', () {
      AuthUserModelMock authUserMock = AuthUserModelMock();
      authRepository.authUser.listen((event) {});
      expectLater(authRepository.controller.stream, emits(authUserMock));
      authRepository.addAuthUserToStream(authUserMock);
    });
    group('[createAccount]', () {
      test('should return an [AuthUser] when creating a [new account]',
          () async {
        //Act
        AuthUserModel expectUser = await authRepository.createAccount(
            email: 'email', password: 'password');
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
        when(() => authSocialNetworkAdapter.getCredential('google'))
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
          'should call authAdapter.deleteUser',
          () async => {
                //Arrange
                when(() => authAdapterMock.deleteUser())
                    .thenAnswer((_) => Future.value()),

                //Act
                await authRepository.deleteUser(),

                //Assert
                verify(() => authAdapterMock.deleteUser()).called(1)
              });
    });
    group('[deleteUserAllData]', () {
      test(
          'should call [authAdapter.deleteUser]',
          () async => {
                //Arrange
                when(() => remoteStorageAdapter.deleteAllData(
                        userId: AuthUserModelMock().userId))
                    .thenAnswer((_) => Future.value()),

                //Act
                await authRepository.deleteAllData(
                    authUser: AuthUserModelMock()),

                //Assert
                verify(() => remoteStorageAdapter.deleteAllData(
                    userId: AuthUserModelMock().userId)).called(1)
              });
    });
    group('isUserSignedIn', () {
      test(
          'should call authAdapter.isUserSignedIn',
          () async => {
                //Arrange
                when(() => authAdapterMock.isUserSignedIn())
                    .thenAnswer((_) async => true),

                //Act
                await authRepository.isUserSignedIn(),

                //Assert
                verify(() => authAdapterMock.isUserSignedIn()).called(1)
              });
    });
    group('sendPasswordResetEmail', () {
      test(
          'should call authAdapter.sendPasswordResetEmail',
          () async => {
                //Arrange
                when(() => authAdapterMock.sendPasswordResetEmail('email'))
                    .thenAnswer((_) => Future.value()),

                //Act
                await authRepository.sendPasswordResetEmail('email'),

                //Assert
                verify(() => authAdapterMock.sendPasswordResetEmail('email'))
                    .called(1)
              });
    });
    group('signOut', () {
      test(
          'should call authAdapter.signOut',
          () async => {
                //Arrange
                when(() => authAdapterMock.signOut())
                    .thenAnswer((_) => Future.value()),

                //Act
                await authRepository.signOut(),

                //Assert
                verify(() => authAdapterMock.signOut()).called(1)
              });
    });
    group('updatePhoto', () {
      test(
          'should call authAdapter.updatePhoto',
          () async => {
                //Arrange
                when(() => authAdapterMock.updatePhoto('avatar'))
                    .thenAnswer((_) => Future.value()),
                when(() =>
                        authAdapterMock.updateAccountDetails(avatar: 'avatar'))
                    .thenAnswer((invocation) async => AuthUserModelMock()),

                //Act
                await authRepository.updateAccountDetails(avatar: 'avatar'),

                //Assert
                verify(() =>
                        authAdapterMock.updateAccountDetails(avatar: 'avatar'))
                    .called(1)
              });
    });
    group('updatePassword', () {
      test(
          'should call authAdapter.updatePassword',
          () async => {
                //Arrange
                when(() => authAdapterMock.updatePassword('newPassword'))
                    .thenAnswer((_) => Future.value()),

                //Act
                await authRepository.updatePassword(newPassword: 'newPassword'),

                //Assert
                verify(() => authAdapterMock.updatePassword('newPassword'))
                    .called(1)
              });
    });
    group('getLoggedUser', () {
      test(
          'should call authAdapter.getLoggedUser',
          () async => {
                //Arrange
                when(() => authAdapterMock.getLoggedUser())
                    .thenAnswer((_) async => AuthUserModelMock()),

                //Act
                await authRepository.getLoggedUser(),

                //Assert
                verify(() => authAdapterMock.getLoggedUser()).called(1)
              });
    });
    group('reauthenticateAUser', () {
      test(
          'should call authAdapter.reauthenticateAUser',
          () async => {
                //Arrange
                when(() => authAdapterMock.reauthenticateAUser(
                    'email', 'password')).thenAnswer((_) => Future.value()),

                //Act
                await authRepository.reauthenticateAUser('email', 'password'),

                //Assert
                verify(() => authAdapterMock.reauthenticateAUser(
                    'email', 'password')).called(1)
              });
    });
    group('updateEmail', () {
      test(
          'should call authAdapter.updateEmail',
          () async => {
                //Arrange
                when(() => authAdapterMock.updateEmail('email'))
                    .thenAnswer((_) => Future.value()),

                //Act
                await authRepository.updateEmail(newEmail: 'email'),

                //Assert
                verify(() => authAdapterMock.updateEmail('email')).called(1)
              });
    });
    group('sendEmailVerification', () {
      test(
          'should call authAdapter.sendEmailVerification',
          () async => {
                //Arrange
                when(() => authAdapterMock.sendEmailVerification())
                    .thenAnswer((_) => Future.value()),

                //Act
                await authRepository.sendEmailVerification(),

                //Assert
                verify(() => authAdapterMock.sendEmailVerification()).called(1)
              });
    });
  });
}
