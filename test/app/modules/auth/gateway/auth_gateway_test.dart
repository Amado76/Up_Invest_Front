import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/auth/gateway/firebase_gateway.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/credential_dto.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {
  @override
  User? get currentUser => UserMock();
  @override
  Future<UserCredential> signInWithCredential(AuthCredential credential) async {
    UserCredentialMock userCredentialMock = UserCredentialMock();
    return userCredentialMock;
  }
}

class UserCredentialMock extends Mock implements UserCredential {
  @override
  User? get user => UserMock();
  @override
  AuthCredential? get credential => AuthCredentialMock();
}

class AuthCredentialMock extends Mock implements AuthCredential {
  @override
  String get signInMethod => 'Facebook';
}

class UserMock extends Mock implements User {
  @override
  String displayName = 'Walter White';
  @override
  String email = 'walter.white@gmail.com';
  @override
  String photoURL = 'Kabum';
  @override
  bool emailVerified = true;
  @override
  String get uid => 'uidTeste';
  @override
  Future<void> updatePhotoURL(String? newAvatar) async {
    photoURL = newAvatar ?? photoURL;
  }

  @override
  Future<void> updateDisplayName(String? newDisplayName) async {
    displayName = newDisplayName ?? displayName;
  }

  @override
  Future<String> getIdToken([bool forceRefresh = false]) async {
    return 'foo';
  }
}

class CredentialDTOMock extends Mock implements CredentialDTO {}

Future<void> main() async {
  group('AuthGateway', () {
    final firebaseAuthMock = FirebaseAuthMock();
    final userCredential = UserCredentialMock();
    final firebaseGateway = FireBaseGateway(auth: firebaseAuthMock);
    test('Should return a AuthUserModel when creating a new account', () async {
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
        'Should return a AuthUserModel after sucesseful sign in with email and password',
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
        'Should return a AuthUserModel after sucesseful sign in with Google account',
        () async {
      //Act
      AuthUserModel signInWithGoogle =
          await firebaseGateway.signInWithSocialNetwork(
              'google', CredentialDTO(acessToken: 'acessToken', idToken: ''));

      //Assert

      expect(signInWithGoogle, const TypeMatcher<AuthUserModel>());
    });
    test(
        'Should return a AuthUserModel after sucesseful sign in with Facebook account',
        () async {
      //Act
      AuthUserModel signInWithGoogle =
          await firebaseGateway.signInWithSocialNetwork(
              'facebook', CredentialDTO(acessToken: 'acessToken'));

      //Assert

      expect(signInWithGoogle, const TypeMatcher<AuthUserModel>());
    });
    test('Should throw an exception if an invalid sign-in option is received',
        () async {
      //Act
      try {
        await firebaseGateway.signInWithSocialNetwork(
            'orkut', CredentialDTO(acessToken: 'acessToken'));
      } catch (e) {
        //Assert
        expect(e, 'Invalid Social Network');
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

    test('Should return false when the user logs out', () async {
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
      when(() => firebaseAuthMock.authStateChanges())
          .thenAnswer((_) => Stream.fromIterable([UserMock()]));

      //Act
      bool isSignedIn = await firebaseGateway.isUserSignedIn();
      //Assert
      expect(isSignedIn, true);
    });
  });
}
