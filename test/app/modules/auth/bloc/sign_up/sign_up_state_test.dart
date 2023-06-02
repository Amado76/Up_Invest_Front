import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/modules/auth/bloc/sign_up/sign_up_bloc.dart';

import 'package:up_invest_front/app/modules/auth/util/auth_error.dart';
import 'package:up_invest_front/app/modules/user/avatar_model.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'pt'));
  AvatarModel avatar = AvatarModel(id: 1);
  AuthErrorNetworkError authError = AuthErrorNetworkError();
  group('[SignUpStateIdle]', () {
    test('supports value comparisons', () {
      expect(SignUpIdle(avatar: avatar), SignUpIdle(avatar: avatar));
    });
  });
  group('[SignUpLoading]', () {
    test('supports value comparisons', () {
      expect(SignUpLoading(avatar: avatar), SignUpLoading(avatar: avatar));
    });
  });
  group('[SignUpError]', () {
    test('supports value comparisons', () {
      expect(SignUpError(avatar: avatar, authError: authError),
          SignUpError(avatar: avatar, authError: authError));
    });
  });
}
