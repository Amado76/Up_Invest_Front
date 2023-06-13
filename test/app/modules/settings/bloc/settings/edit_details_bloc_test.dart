import 'dart:ui' show Locale;

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_list.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings/edit_details_bloc.dart';

import '../../../../../mocks/auth/adapter/auth_adapter_mock.dart';
import '../../../../../mocks/auth/model/auth_user_model_mock.dart';
import '../../../../../mocks/auth/model/avatar_model_mock.dart';
import '../../../../../mocks/auth/repository/auth_repository_mock.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'en'));
  late EditDetailsBloc editDetailsBloc;
  late AuthRepository authRepositoryMock;
  late AuthUserModel authUserMock;
  late AvatarModel standardAvatarMock;
  late AvatarList avatarList;
  late AvatarList avatarListWithNewAvatar;

  setUp(() {
    avatarList = AvatarList();
    authRepositoryMock = AuthRepositoryMock(authAdapter: AuthAdapterMock());
    authUserMock = AuthUserModelMock();
    standardAvatarMock = StandardAvatarMock();
    editDetailsBloc = EditDetailsBloc(
        authRepository: authRepositoryMock,
        authUser: authUserMock,
        avatar: standardAvatarMock);
  });

  test('initial state is EditDetailsIdle', () {
    expect(editDetailsBloc.state, isA<EditDetailsIdle>());
  });

  group('[EditDetailsAddToAvatarList]', () {
    setUp(() {
      avatarListWithNewAvatar = AvatarList();
      avatarListWithNewAvatar.addNetworkAvatar('newImagePath');
    });
    blocTest<EditDetailsBloc, EditDetailsState>(
        'when [EditDetailsAddToAvatarList] is added, return [EditDetailsIdle] with new avatar',
        build: () => editDetailsBloc,
        seed: () => EditDetailsIdle(
            authUser: authUserMock,
            avatar: standardAvatarMock,
            avatarList: avatarList),
        act: (bloc) => bloc
            .add(const EditDetailsAddToAvatarList(imagePath: 'newImagePath')),
        expect: () => <EditDetailsState>[
              EditDetailsIdle(
                  authUser: authUserMock,
                  avatar: const NetworkAvatar(
                      id: 9, path: 'newImagePath', url: 'newImagePath'),
                  avatarList: avatarListWithNewAvatar)
            ]);
  });
  group('[EditDetailsUploadPhoto]', () {
    setUp(() {
      avatarListWithNewAvatar = AvatarList();
      avatarListWithNewAvatar.addCustomAvatar('newImagePath', 'newImagePath');
    });
    blocTest<EditDetailsBloc, EditDetailsState>(
        'when [EditDetailsUploadPhoto] is added, return [EditDetailsIdle] with new avatar',
        build: () => editDetailsBloc,
        seed: () => EditDetailsIdle(
            authUser: authUserMock,
            avatar: standardAvatarMock,
            avatarList: avatarList),
        act: (bloc) =>
            bloc.add(const EditDetailsUploadPhoto(imagePath: 'newImagePath')),
        expect: () => <EditDetailsState>[
              EditDetailsIdle(
                  authUser: authUserMock,
                  avatar: const CustomAvatar(
                      id: 9, path: 'newImagePath', url: 'newImagePath'),
                  avatarList: avatarListWithNewAvatar)
            ]);
  });

  group('when [EditDetailsChangeAvatar] is added', () {
    const String kidAvatarUrl = 'https://i.ibb.co/4S6cYZS/kid.png';
    String kittyAvatarUrl = 'https://i.ibb.co/m6NHwyd/kitty.png';
    blocTest<EditDetailsBloc, EditDetailsState>(
      'and [index] is 1 and [avatarNavigation] is "FowardButton" emits [EditDetailsIdle] with [index] 2 and [avatar] equal to "assets/avatars/dog.png"',
      build: () => editDetailsBloc,
      seed: () => EditDetailsIdle(
          avatar: avatarList.avatars[1]!,
          avatarList: avatarList,
          authUser: authUserMock),
      act: (bloc) => bloc.add(
        const EditDetailsChangeAvatar(avatarNavigation: 'FowardButton'),
      ),
      expect: () => <EditDetailsState>[
        EditDetailsIdle(
            avatar: avatarList.avatars[2]!,
            avatarList: avatarList,
            authUser: authUserMock)
      ],
    );
    blocTest<EditDetailsBloc, EditDetailsState>(
        'and [index] is 8 and [avatarNavigation] is "FowardButton" emits [EditDetailsIdle] with [index] 8 and [avatar] equal to "assets/avatars/kid.png"',
        build: () => editDetailsBloc,
        seed: () => EditDetailsIdle(
            authUser: authUserMock,
            avatar: avatarList.avatars[8]!,
            avatarList: avatarList),
        act: (bloc) => bloc.add(
              const EditDetailsChangeAvatar(avatarNavigation: 'FowardButton'),
            ),
        verify: (bloc) {
          expect(
            (bloc.state as EditDetailsIdle).avatar.path,
            'assets/avatars/kid.png',
          );
          expect(
            (bloc.state as EditDetailsIdle).avatar.id,
            8,
          );

          expect((bloc.state as EditDetailsIdle).avatar.url, kidAvatarUrl);
        });
    blocTest<EditDetailsBloc, EditDetailsState>(
      'and [index] is 4 and [avatarNavigation] is "BackButton" emits [EditDetailsIdle] with [index] 3 and [avatar] equal to "assets/avatars/man.png"',
      build: () => editDetailsBloc,
      seed: () => EditDetailsIdle(
          authUser: authUserMock,
          avatar: avatarList.avatars[4]!,
          avatarList: avatarList),
      act: (bloc) => bloc.add(
        const EditDetailsChangeAvatar(avatarNavigation: 'BackButton'),
      ),
      expect: () => <EditDetailsState>[
        EditDetailsIdle(
            avatar: avatarList.avatars[3]!,
            avatarList: avatarList,
            authUser: authUserMock)
      ],
    );
    blocTest<EditDetailsBloc, EditDetailsState>(
        'and [index] is 1 and [avatarNavigation] is "BackButton" emits [EditDetailsIdle] with [index] 1 and [avatar] equal to "assets/avatars/kitty.png"',
        build: () => editDetailsBloc,
        seed: () => EditDetailsIdle(
            authUser: authUserMock,
            avatar: avatarList.avatars[1]!,
            avatarList: avatarList),
        act: (bloc) => bloc.add(
              const EditDetailsChangeAvatar(avatarNavigation: 'BackButton'),
            ),
        verify: (bloc) {
          expect(
            (bloc.state as EditDetailsIdle).avatar.path,
            'assets/avatars/kitty.png',
          );
          expect(
            (bloc.state as EditDetailsIdle).avatar.id,
            1,
          );

          expect(
            (bloc.state as EditDetailsIdle).avatar.url,
            kittyAvatarUrl,
          );
        });
  });
}
