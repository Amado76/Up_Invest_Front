// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';

import '../../../../mocks/auth/model/auth_user_model_mock.dart';

void main() {
  const isLoading = true;
  group('[AuthStateIdle]', () {
    test('supports value comparisons', () {
      expect(AuthStateIdle(isLoading: isLoading),
          AuthStateIdle(isLoading: isLoading));
    });
  });
  group('[AuthStateLoggedIn]', () {
    test('supports value comparisons', () {
      expect(
          AuthStateLoggedIn(
              isLoading: isLoading, authUser: AuthUserModelMock()),
          AuthStateLoggedIn(
              isLoading: isLoading, authUser: AuthUserModelMock()));
    });
  });
  group('[AuthStateLoggedOut]', () {
    test('supports value comparisons', () {
      expect(AuthStateLoggedOut(isLoading: isLoading),
          AuthStateLoggedOut(isLoading: isLoading));
    });
  });
  group('[AuthStateRecoverPassword]', () {
    test('supports value comparisons', () {
      expect(AuthStateRecoverPassword(isLoading: isLoading),
          AuthStateRecoverPassword(isLoading: isLoading));
    });
  });
  group('[AuthStateRecoverPassword]', () {
    test('supports value comparisons', () {
      expect(AuthStateSigningUp(isLoading: isLoading, index: 1, avatar: ''),
          AuthStateSigningUp(isLoading: isLoading, index: 1, avatar: ''));
    });
  });
}
