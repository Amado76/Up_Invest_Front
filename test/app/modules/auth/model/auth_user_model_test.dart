import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_model.dart';

void main() {
  group('AuthUserModel', () {
    String userId = 'mock-userID';
    String email = 'mock-email';
    String token = 'mock-token';
    String displayName = 'mock-displayName';
    AvatarModel avatar = const StandardAvatar(
        id: 1,
        path: 'assets/avatars/kitty.png',
        url: 'https://i.ibb.co/m6NHwyd/kitty.png');
    String signInMethod = 'signInMethod-token';
    bool isEmailVerified = true;
    test('supports value comparisons', () {
      expect(
          // ignore: prefer_const_constructors
          AuthUserModel(
            userId: userId,
            email: email,
            token: token,
            displayName: displayName,
            avatar: avatar,
            signInMethod: signInMethod,
            isEmailVerified: isEmailVerified,
          ),
          AuthUserModel(
            userId: userId,
            email: email,
            token: token,
            displayName: displayName,
            avatar: avatar,
            signInMethod: signInMethod,
            isEmailVerified: isEmailVerified,
          ));
    });
  });
}
