import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/auth/gateway/firebase_gateway.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {
  @override
  User? get currentUser => UserMock();
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
  Future<void> updatePhotoURL(String? newAvatarPicture) async {
    photoURL = newAvatarPicture ?? photoURL;
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

Future<void> main() async {
  final mockFirebaseAuth = FirebaseAuthMock();
  final userCredential = UserCredentialMock();
  final firebaseGateway = FireBaseGateway(auth: mockFirebaseAuth);
  test('Should return a AuthUserModel after create a new account', () async {
    //Arrage
    // Configure the FirebaseAuth mock to return the UserCredential mock
    when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
        email: 'email',
        password: 'password')).thenAnswer((_) async => userCredential);

    //Act
    AuthUserModel newAccount = await firebaseGateway.createAccount(
        'email', 'password', 'displayName', 'avatarPicture');

    //Assert
    expect(newAccount, const TypeMatcher<AuthUserModel>());
  });

  test('Should return a AuthUserModel after sucesseful sing in', () async {
    //Arrage
    // Configure the FirebaseAuth mock to return the UserCredential mock
    when(() => mockFirebaseAuth.signInWithEmailAndPassword(
        email: 'email',
        password: 'password')).thenAnswer((_) async => userCredential);

    //Act
    AuthUserModel newAccount =
        await firebaseGateway.singInWithEmailAndPassword('email', 'password');

    //Assert
    expect(newAccount, const TypeMatcher<AuthUserModel>());
  });

  test('Should return false when there is no logged-in user', () async {
    //Arrage
    when(() => mockFirebaseAuth.authStateChanges())
        .thenAnswer((_) => Stream.fromIterable([null]));
    //Act
    bool isSignedIn = await firebaseGateway.isUserSignedIn();
    //Assert
    expect(isSignedIn, false);
  });

  test('Should return false when the user logs out', () async {
    //Arrage
    bool isSignedIn = true;
    when(() => mockFirebaseAuth.authStateChanges())
        .thenAnswer((_) => Stream.fromIterable([null]));

    //Act
    isSignedIn = await firebaseGateway.isUserSignedIn();
    //Assert
    expect(isSignedIn, false);
  });

  test('Should return true when the user is logged', () async {
    //Arrage
    when(() => mockFirebaseAuth.authStateChanges())
        .thenAnswer((_) => Stream.fromIterable([UserMock()]));

    //Act
    bool isSignedIn = await firebaseGateway.isUserSignedIn();
    //Assert
    expect(isSignedIn, true);
  });
}
