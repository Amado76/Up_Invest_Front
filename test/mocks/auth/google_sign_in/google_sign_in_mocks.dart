import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';

class GoogleSignInAuthenticationMock extends Mock
    implements GoogleSignInAuthentication {
  @override
  String? get accessToken => 'test';
  @override
  String? get idToken => 'idToken';
}

class GoogleSignInAccountMock extends Mock implements GoogleSignInAccount {
  @override
  Future<GoogleSignInAuthentication> get authentication async =>
      GoogleSignInAuthenticationMock();
}

class GoogleSignInMock extends Mock implements GoogleSignIn {
  @override
  Future<GoogleSignInAccount?> signIn() async {
    return GoogleSignInAccountMock();
  }
}
