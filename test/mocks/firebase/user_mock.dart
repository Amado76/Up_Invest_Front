import 'package:firebase_auth/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';

import 'user_info_mock.dart';

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
