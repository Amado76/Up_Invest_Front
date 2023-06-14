import 'dart:ui' show Locale;

import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_list.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';
import 'package:up_invest_front/app/modules/auth/repository/avatar_model_repository.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_error.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings/edit_details_bloc.dart';
import 'package:up_invest_front/app/modules/settings/util/settings_error.dart';
import 'package:up_invest_front/app/modules/settings/util/settings_success.dart';

import '../../../../../mocks/auth/adapter/auth_adapter_mock.dart';
import '../../../../../mocks/auth/model/auth_user_model_mock.dart';
import '../../../../../mocks/auth/model/avatar_model_mock.dart';
import '../../../../../mocks/auth/repository/auth_repository_mock.dart';
import '../../../../../mocks/auth/repository/avatar_repository_mock.dart';
import '../../../../../mocks/core/adapter/remote_storage_mock.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'en'));
  late EditDetailsBloc editDetailsBloc;
  late AuthRepository authRepositoryMock;
  late AuthUserModel authUserMock;
  late AvatarModel standardAvatarMock;
  late AvatarList avatarList;
  late AvatarList avatarListWithNewAvatar;
  late IAvatarRepository avatarRepositoryMock;

  setUp(() {
    avatarRepositoryMock =
        AvatarRepositoryMock(storageAdapter: RemoteStorageAdapterMock());

    avatarList = AvatarList();
    authRepositoryMock = AuthRepositoryMock(authAdapter: AuthAdapterMock());
    authUserMock = AuthUserModelMock();
    standardAvatarMock = StandardAvatarMock();
    editDetailsBloc = EditDetailsBloc(
        avatarRepository: avatarRepositoryMock,
        authRepository: authRepositoryMock,
        authUser: authUserMock,
        avatar: standardAvatarMock);
  });

  test('initial state is EditDetailsIdle', () {
    expect(editDetailsBloc.state, isA<EditDetailsIdle>());
  });

  group('[EditDetailsUpdateAvatar]', () {
    late NetworkAvatar newAvatar;
    late AvatarList newAvatarList;
    setUp(() {
      newAvatar = const NetworkAvatar(id: 9, url: 'url', path: 'url');
      newAvatarList = AvatarList()..addNetworkAvatar(newAvatar.url);
      registerFallbackValue(authUserMock);
      registerFallbackValue(const StandardAvatar(id: 1, path: '', url: ''));
      when(() => avatarRepositoryMock.uploadAvatar(
              authUser: any(named: 'authUser'),
              avatarModel: any(named: 'avatarModel')))
          .thenAnswer((_) => Future.value(null));
      when(() => avatarRepositoryMock.getUrlFromRemoteStorage(
              avatarModel: any(named: 'avatarModel'),
              authUser: any(named: 'authUser')))
          .thenAnswer((invocation) async => standardAvatarMock);
    });
    blocTest<EditDetailsBloc, EditDetailsState>(
        'when [EditDetailsUpdateAvatar] is added and operation is successful return [EditDetailsSuccess] with the updated AuthUser',
        setUp: () {
          when(() => authRepositoryMock.updateAccountDetails(
                  newName: any(named: 'newName'), avatar: any(named: 'avatar')))
              .thenAnswer((_) async => authUserMock);
        },
        build: () => editDetailsBloc,
        seed: () => EditDetailsIdle(
            authUser: authUserMock,
            avatar: standardAvatarMock,
            avatarList: avatarList),
        act: (bloc) => bloc.add(const EditDetailsUpdateAvatar()),
        expect: () => <EditDetailsState>[
              EditDetailsLoading(
                  authUser: authUserMock,
                  avatar: standardAvatarMock,
                  avatarList: avatarList),
              EditDetailsSuccess(
                  avatar: standardAvatarMock,
                  avatarList: newAvatarList,
                  authUser: authUserMock,
                  settingsSuccess: SettingsSuccessAvatarChanged())
            ]);
    blocTest<EditDetailsBloc, EditDetailsState>(
        'when [EditDetailsUpdateAvatar] is added and user did not changed the avatar, return [EditDetailsIdle] with the same [Avatar]',
        build: () => editDetailsBloc,
        seed: () => EditDetailsIdle(
            authUser: authUserMock,
            avatar: const NetworkAvatar(id: 9, url: 'url', path: 'url'),
            avatarList: avatarList),
        act: (bloc) => bloc.add(const EditDetailsUpdateAvatar()),
        expect: () => <EditDetailsState>[
              EditDetailsLoading(
                  authUser: authUserMock,
                  avatar: const NetworkAvatar(id: 9, url: 'url', path: 'url'),
                  avatarList: avatarList),
              EditDetailsIdle(
                avatar: const NetworkAvatar(id: 9, url: 'url', path: 'url'),
                avatarList: avatarList,
                authUser: authUserMock,
              )
            ]);
    blocTest<EditDetailsBloc, EditDetailsState>(
        'when [EditDetailsUpdateAvatar] is added and operation throw FirebaseAuthException return [EditDetailsError]',
        setUp: () {
          when(() => authRepositoryMock.updateAccountDetails(
                  newName: any(named: 'newName'), avatar: any(named: 'avatar')))
              .thenThrow(FirebaseAuthException(code: 'error'));
        },
        build: () => editDetailsBloc,
        seed: () => EditDetailsIdle(
            authUser: authUserMock,
            avatar: standardAvatarMock,
            avatarList: avatarList),
        act: (bloc) => bloc.add(const EditDetailsUpdateAvatar()),
        expect: () => <EditDetailsState>[
              EditDetailsLoading(
                  authUser: authUserMock,
                  avatar: standardAvatarMock,
                  avatarList: avatarList),
              EditDetailsError(
                  avatar: standardAvatarMock,
                  avatarList: AvatarList(),
                  authUser: authUserMock,
                  authError: AuthErrorUnknown())
            ]);
    blocTest<EditDetailsBloc, EditDetailsState>(
        'when [EditDetailsUpdateAvatar] is added and operation throw Exception return [EditDetailsError]',
        setUp: () {
          when(() => authRepositoryMock.updateAccountDetails(
              newName: any(named: 'newName'),
              avatar: any(named: 'avatar'))).thenThrow(Exception('error'));
        },
        build: () => editDetailsBloc,
        seed: () => EditDetailsIdle(
            authUser: authUserMock,
            avatar: standardAvatarMock,
            avatarList: avatarList),
        act: (bloc) => bloc.add(const EditDetailsUpdateAvatar()),
        expect: () => <EditDetailsState>[
              EditDetailsLoading(
                  authUser: authUserMock,
                  avatar: standardAvatarMock,
                  avatarList: avatarList),
              EditDetailsError(
                  avatar: standardAvatarMock,
                  avatarList: AvatarList(),
                  authUser: authUserMock,
                  settingsError: SettingsErrorUnknown())
            ]);
  });
  group('[EditDetailsAddAvatarFromGallery]', () {
    setUp(() {
      avatarListWithNewAvatar = AvatarList();
      avatarListWithNewAvatar.addCustomAvatar('newImagePath', 'newImagePath');
    });
    blocTest<EditDetailsBloc, EditDetailsState>(
        'when [EditDetailsAddAvatarFromGallery] is added, return [EditDetailsIdle] with new avatar',
        build: () => editDetailsBloc,
        seed: () => EditDetailsIdle(
            authUser: authUserMock,
            avatar: standardAvatarMock,
            avatarList: avatarList),
        act: (bloc) => bloc.add(
            const EditDetailsAddAvatarFromGallery(imagePath: 'newImagePath')),
        expect: () => <EditDetailsState>[
              EditDetailsIdle(
                  authUser: authUserMock,
                  avatar: const CustomAvatar(
                      id: 9, path: 'newImagePath', url: 'newImagePath'),
                  avatarList: avatarListWithNewAvatar)
            ]);
  });
  group('[EditDetailsCancelAvatarEdit]', () {
    late NetworkAvatar avatar;
    late NetworkAvatar newAvatar;

    setUp(() {
      avatar = const NetworkAvatar(id: null, path: 'path', url: 'url');
      newAvatar = const NetworkAvatar(id: 9, path: 'url', url: 'url');
    });
    blocTest<EditDetailsBloc, EditDetailsState>(
        'when [EditDetailsCancelAvatarEdit] is added, return [EditDetailsIdle] with last avatar]',
        build: () => editDetailsBloc,
        seed: () => EditDetailsIdle(
            authUser: authUserMock,
            avatar: avatar,
            avatarList: AvatarList()..addNetworkAvatar('url')),
        act: (bloc) => bloc.add(const EditDetailsCancelAvatarEdit()),
        expect: () => <EditDetailsState>[
              EditDetailsIdle(
                  authUser: authUserMock,
                  avatar: newAvatar,
                  avatarList: AvatarList()..addNetworkAvatar('url'))
            ]);
  });

  group('[EditDetailsCleanAvatarList]', () {
    late NetworkAvatar avatarWithNullId;
    late NetworkAvatar avatarWithId;
    late NetworkAvatar newAvatar;
    setUp(() {
      avatarWithNullId =
          const NetworkAvatar(id: null, path: 'path', url: 'url');
      avatarWithId = const NetworkAvatar(id: 9, path: 'path', url: 'url');
      newAvatar = const NetworkAvatar(id: 9, path: 'url', url: 'url');
      avatarListWithNewAvatar = AvatarList();
      avatarListWithNewAvatar.addNetworkAvatar('url');
    });
    blocTest<EditDetailsBloc, EditDetailsState>(
        'when [EditDetailsCleanAvatarList] is added and [avatar.id == null], return [EditDetailsIdle] with new avatarList]',
        build: () => editDetailsBloc,
        seed: () => EditDetailsIdle(
            authUser: authUserMock,
            avatar: avatarWithNullId,
            avatarList: avatarList),
        act: (bloc) => bloc.add(const EditDetailsCleanAvatarList()),
        expect: () => <EditDetailsState>[
              EditDetailsIdle(
                  authUser: authUserMock,
                  avatar: newAvatar,
                  avatarList: avatarListWithNewAvatar)
            ]);
    blocTest<EditDetailsBloc, EditDetailsState>(
        'when [EditDetailsCleanAvatarList] is added and [avatar.id != null], return [EditDetailsIdle] with new avatarList]',
        build: () => editDetailsBloc,
        seed: () => EditDetailsIdle(
            authUser: authUserMock,
            avatar: avatarWithId,
            avatarList: avatarList),
        act: (bloc) => bloc.add(const EditDetailsCleanAvatarList()),
        expect: () => <EditDetailsState>[
              EditDetailsIdle(
                  authUser: authUserMock,
                  avatar: newAvatar,
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
        const EditDetailsChangeDisplayAvatar(avatarNavigation: 'FowardButton'),
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
              const EditDetailsChangeDisplayAvatar(
                  avatarNavigation: 'FowardButton'),
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
        const EditDetailsChangeDisplayAvatar(avatarNavigation: 'BackButton'),
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
              const EditDetailsChangeDisplayAvatar(
                  avatarNavigation: 'BackButton'),
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
