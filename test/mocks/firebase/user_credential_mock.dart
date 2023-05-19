import 'package:firebase_auth/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'auth_credential_mock.dart';
import 'user_mock.dart';

class UserCredentialMock extends Mock implements UserCredential {
  @override
  User? get user => UserMock();
  @override
  AuthCredential? get credential => AuthCredentialMock();
}
