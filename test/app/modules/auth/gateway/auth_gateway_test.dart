import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/auth/gateway/firebase_gateway.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/util/credential_dto.dart';
import '../../../../mocks/firebase/firebase_auth_mock.dart';
import '../../../../mocks/firebase/user_credential_mock.dart';
import '../../../../mocks/firebase/user_mock.dart';

class CredentialDTOMock extends Mock implements CredentialDTO {}

Future<void> main() async {
  group('AuthGateway', () {
    final firebaseAuthMock = FirebaseAuthMock();
    final userCredential = UserCredentialMock();
    final firebaseGateway = FireBaseGateway(auth: firebaseAuthMock);
    test('Should return an AuthUserModel when creating a new account',
        () async {
      //Arrage
      // Configure the FirebaseAuth mock to return the UserCredential mock
      when(() => firebaseAuthMock.createUserWithEmailAndPassword(
          email: 'email',
          password: 'password')).thenAnswer((_) async => userCredential);

      //Act
      AuthUserModel newAccount = await firebaseGateway.createAccount(
          'email', 'password', 'displayName', 'avatar');

      //Assert
      expect(newAccount, const TypeMatcher<AuthUserModel>());
    });

    test(
        'Should return an AuthUserModel after successful sign-in with email and password',
        () async {
      //Arrage
      // Configure the FirebaseAuth mock to return the UserCredential mock
      when(() => firebaseAuthMock.signInWithEmailAndPassword(
          email: 'email',
          password: 'password')).thenAnswer((_) async => userCredential);

      //Act
      AuthUserModel signInWithEmailAndPassword =
          await firebaseGateway.signInWithEmailAndPassword('email', 'password');

      //Assert
      expect(signInWithEmailAndPassword, const TypeMatcher<AuthUserModel>());
    });

    test(
        'Should return an AuthUserModel after successful sign-in with Google account',
        () async {
      //Act
      AuthUserModel signInWithGoogle =
          await firebaseGateway.signInWithSocialNetwork(
              'google', CredentialDTO(acessToken: 'acessToken', idToken: ''));

      //Assert

      expect(signInWithGoogle, const TypeMatcher<AuthUserModel>());
    });
    test(
        'Should return an AuthUserModel after successful sign-in with Facebook account',
        () async {
      //Act
      AuthUserModel signInWithGoogle =
          await firebaseGateway.signInWithSocialNetwork(
              'facebook', CredentialDTO(acessToken: 'acessToken'));

      //Assert

      expect(signInWithGoogle, const TypeMatcher<AuthUserModel>());
    });
    test('Should return an AuthUserModel after requesting the logged-in user',
        () async {
      //Act
      AuthUserModel signedInUser = await firebaseGateway.getLoggedUser();

      //Assert
      expect(signedInUser, const TypeMatcher<AuthUserModel>());
    });
    test('Should throw an exception if an invalid sign-in option is received',
        () async {
      //Act
      try {
        await firebaseGateway.signInWithSocialNetwork(
            'orkut', CredentialDTO(acessToken: 'acessToken'));
      } catch (e) {
        //Assert
        expect(e.toString(), ('Exception: invalid-social-network'));
      }
    });

    test('Should return false when there is no logged-in user', () async {
      //Arrage
      when(() => firebaseAuthMock.authStateChanges())
          .thenAnswer((_) => Stream.fromIterable([null]));
      //Act
      bool isSignedIn = await firebaseGateway.isUserSignedIn();
      //Assert
      expect(isSignedIn, false);
    });

    test('Should return false when the user logout', () async {
      //Arrage
      bool isSignedIn = true;
      when(() => firebaseAuthMock.authStateChanges())
          .thenAnswer((_) => Stream.fromIterable([null]));

      //Act
      isSignedIn = await firebaseGateway.isUserSignedIn();
      //Assert
      expect(isSignedIn, false);
    });

    test('Should return true when the user is logged', () async {
      //Arrage
      UserMock userMock = UserMock();
      when(() => firebaseAuthMock.authStateChanges())
          .thenAnswer((_) => Stream.fromIterable([userMock]));

      //Act
      bool isSignedIn = await firebaseGateway.isUserSignedIn();
      //Assert
      expect(isSignedIn, true);
    });
  });
}
