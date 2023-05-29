import 'package:firebase_auth/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {
  @override
  Future<UserCredential> signInWithCredential(AuthCredential credential) async {
    UserCredentialMock userCredentialMock = UserCredentialMock();
    return userCredentialMock;
  }
}

class AuthCredentialMock extends Mock implements AuthCredential {
  @override
  String get signInMethod => 'Facebook';
}

class UserCredentialMock extends Mock implements UserCredential {
  @override
  User? get user => UserMock();
  @override
  AuthCredential? get credential => AuthCredentialMock();
}

class UserInfoMock extends Mock implements UserInfo {
  @override
  get providerId {
    return 'email';
  }
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
  List<UserInfo> get providerData {
    List<UserInfo> userInfoList = [UserInfoMock()];
    return userInfoList;
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
