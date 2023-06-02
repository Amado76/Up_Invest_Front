// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';

import 'package:up_invest_front/app/modules/auth/bloc/recovery_password/recover_password_bloc.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_error.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_sucess.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'pt'));
  group('[RecoverPasswordIdle]', () {
    test('supports value comparisons', () {
      expect(RecoverPasswordIdle(), RecoverPasswordIdle());
    });
  });

  group('[RecoverPasswordError]', () {
    test('supports value comparisons', () {
      expect(RecoverPasswordError(authError: AuthErrorInvalidEmail()),
          RecoverPasswordError(authError: AuthErrorInvalidEmail()));
    });
  });

  group('[RecoverPasswordLoading]', () {
    test('supports value comparisons', () {
      expect(RecoverPasswordLoading(), RecoverPasswordLoading());
    });
  });
  group('[RecoverPasswordSuccess]', () {
    test('supports value comparisons', () {
      expect(RecoverPasswordSuccess(authSuccess: AuthSuccessResetPassword()),
          RecoverPasswordSuccess(authSuccess: AuthSuccessResetPassword()));
    });
  });
}
