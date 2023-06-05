import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/modules/auth/bloc/sign_up/sign_up_bloc.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_list.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_model.dart';

import 'package:up_invest_front/app/modules/auth/util/auth_error.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'pt'));
  AvatarList avatarList = AvatarList();
  AvatarModel avatar = avatarList.avatars[1]!;
  AuthErrorNetworkError authError = AuthErrorNetworkError();
  group('[SignUpStateIdle]', () {
    test('supports value comparisons', () {
      expect(SignUpIdle(avatar: avatar, avatarList: avatarList),
          SignUpIdle(avatar: avatar, avatarList: avatarList));
    });
  });
  group('[SignUpLoading]', () {
    test('supports value comparisons', () {
      expect(SignUpLoading(avatar: avatar, avatarList: avatarList),
          SignUpLoading(avatar: avatar, avatarList: avatarList));
    });
  });
  group('[SignUpError]', () {
    test('supports value comparisons', () {
      expect(
          SignUpError(
              avatar: avatar, authError: authError, avatarList: avatarList),
          SignUpError(
              avatar: avatar, authError: authError, avatarList: avatarList));
    });
  });
}
