import 'package:firebase_auth/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';

class AuthCredentialMock extends Mock implements AuthCredential {
  @override
  String get signInMethod => 'Facebook';
}
