import 'package:firebase_auth/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';

class UserInfoMock extends Mock implements UserInfo {
  @override
  get providerId {
    return 'email';
  }
}
