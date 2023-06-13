import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_list.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_model.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_error.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings/edit_details_bloc.dart';

import '../../../../../mocks/auth/model/auth_user_model_mock.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'en'));
  const AvatarModel avatar = CustomAvatar(id: 1, path: 'path', url: 'url');
  final AvatarList avatarList = AvatarList();
  final AuthUserModel authUser = AuthUserModelMock();
  final AuthError authError = AuthErrorNetworkError();

  group('[EditDetailsIdle]', () {
    test('supports value comparisons', () {
      expect(
        EditDetailsIdle(
            authUser: authUser, avatar: avatar, avatarList: avatarList),
        EditDetailsIdle(
            authUser: authUser, avatar: avatar, avatarList: avatarList),
      );
    });
  });
  group('[EditDetailsLoading]', () {
    test('supports value comparisons', () {
      expect(
        EditDetailsLoading(
            authUser: authUser, avatar: avatar, avatarList: avatarList),
        EditDetailsLoading(
            authUser: authUser, avatar: avatar, avatarList: avatarList),
      );
    });
  });
  group('[EditDetailsError]', () {
    test('supports value comparisons', () {
      expect(
        EditDetailsError(
            authUser: authUser,
            avatar: avatar,
            avatarList: avatarList,
            authError: authError),
        EditDetailsError(
            authUser: authUser,
            avatar: avatar,
            avatarList: avatarList,
            authError: authError),
      );
    });
  });
}
