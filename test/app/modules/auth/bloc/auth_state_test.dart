// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_error.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_sucess.dart';

import '../../../../mocks/auth/model/auth_user_model_mock.dart';
import '../../../../mocks/file_mock.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'en'));
  final authUserModelMock = AuthUserModelMock();
  final file = FileMock();

  group('[AuthLoggedIn]', () {
    test('supports value comparisonso', () {
      expect(AuthLoggedIn(authUser: authUserModelMock, avatar: file),
          AuthLoggedIn(authUser: authUserModelMock, avatar: file));
    });
  });
  group('[AuthLoggedOut]', () {
    test('supports value comparisons', () {
      expect(AuthLoggedOut(), AuthLoggedOut());
    });
  });
  group('[AuthLoading]', () {
    test('supports value comparisons', () {
      expect(AuthLoading(), AuthLoading());
    });
  });
  group('[AuthSuccessState]', () {
    test('supports value comparisons', () {
      expect(AuthSuccessState(authSucess: AuthSuccessSetNewPassword()),
          AuthSuccessState(authSucess: AuthSuccessSetNewPassword()));
    });
  });
  group('[AuthErrorState]', () {
    test('supports value comparisons', () {
      expect(AuthErrorState(authError: AuthErrorInvalidEmail()),
          AuthErrorState(authError: AuthErrorInvalidEmail()));
    });
  });
}
