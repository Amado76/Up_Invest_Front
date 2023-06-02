// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/auth/bloc/sign_up/sign_up_bloc.dart';

void main() {
  group('[SignUpChangeAvatar]', () {
    test('supports value comparisons', () {
      expect(SignUpChangeAvatar(avatarNavigation: 'foward'),
          SignUpChangeAvatar(avatarNavigation: 'foward'));
    });
  });
  group('[SignUpCreateAccount]', () {
    test('supports value comparisons', () {
      expect(
          SignUpCreateAccount(
              password: 'password', email: 'email', displayName: 'displayName'),
          SignUpCreateAccount(
              password: 'password',
              email: 'email',
              displayName: 'displayName'));
    });
  });
}
