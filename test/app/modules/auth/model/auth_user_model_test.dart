import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';

void main() {
  group('AuthUserModel', () {
    String userId = 'mock-userID';
    String email = 'mock-email';
    String token = 'mock-token';
    String displayName = 'mock-displayName';
    String avatar = 'mock-avatar';
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
