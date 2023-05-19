import 'package:firebase_auth/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';

import 'user_credential_mock.dart';
import 'user_mock.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {
  @override
  User? get currentUser => UserMock();
  @override
  Future<UserCredential> signInWithCredential(AuthCredential credential) async {
    UserCredentialMock userCredentialMock = UserCredentialMock();
    return userCredentialMock;
  }
}
