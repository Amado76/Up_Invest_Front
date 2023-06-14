import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;
import 'package:flutter/material.dart' show Locale;
import 'package:flutter/services.dart' show PlatformException;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/modules/auth/bloc/sign_up/sign_up_bloc.dart';

import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_list.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';
import 'package:up_invest_front/app/modules/auth/repository/avatar_model_repository.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_error.dart';

import '../../../../../mocks/auth/adapter/auth_adapter_mock.dart';
import '../../../../../mocks/auth/model/auth_user_model_mock.dart';
import '../../../../../mocks/auth/repository/auth_repository_mock.dart';
import '../../../../../mocks/auth/repository/avatar_repository_mock.dart';
import '../../../../../mocks/core/adapter/remote_storage_mock.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'es'));
  group('SignUpBloc', () {
    String kittyAvatarUrl = 'https://i.ibb.co/m6NHwyd/kitty.png';
    String kidAvatarUrl = 'https://i.ibb.co/4S6cYZS/kid.png';
    late IAuthRepository authRepositoryMock;
    late SignUpBloc signUpBloc;
    late AuthUserModel authUserMock;
    AvatarList avatarList = AvatarList();
    late IAvatarRepository avatarRepositoryMock;

    setUp(() {
      authRepositoryMock = AuthRepositoryMock(authAdapter: AuthAdapterMock());
      authUserMock = AuthUserModelMock();
      avatarRepositoryMock =
          AvatarRepositoryMock(storageAdapter: RemoteStorageAdapterMock());

      signUpBloc = SignUpBloc(
          authRepository: authRepositoryMock,
          avatarRepository: avatarRepositoryMock);
    });

    test('initial state is [AuthStateIdle]', () {
      expect(signUpBloc.state.avatar, isA<AvatarModel>());
    });

    group('when [SignUpChangeAvatar] is added', () {
      blocTest<SignUpBloc, SignUpState>(
        'and [index] is 1 and [avatarNavigation] is "FowardButton" emits [SignUpIdle] with [index] 2 and [avatar] equal to "assets/avatars/dog.png"',
        build: () => signUpBloc,
        seed: () =>
            SignUpIdle(avatar: avatarList.avatars[1]!, avatarList: avatarList),
        act: (bloc) => bloc.add(
          const SignUpChangeAvatar(avatarNavigation: 'FowardButton'),
        ),
        expect: () => <SignUpState>[
          SignUpIdle(avatar: avatarList.avatars[2]!, avatarList: avatarList)
        ],
      );
      blocTest<SignUpBloc, SignUpState>(
          'and [index] is 8 and [avatarNavigation] is "FowardButton" emits [SignUpIdle] with [index] 8 and [avatar] equal to "assets/avatars/kid.png"',
          build: () => signUpBloc,
          seed: () => SignUpIdle(
              avatar: avatarList.avatars[8]!, avatarList: avatarList),
          act: (bloc) => bloc.add(
                const SignUpChangeAvatar(avatarNavigation: 'FowardButton'),
              ),
          verify: (bloc) {
            expect(
              (bloc.state as SignUpIdle).avatar.path,
              'assets/avatars/kid.png',
            );
            expect(
              (bloc.state as SignUpIdle).avatar.id,
              8,
            );

            expect((bloc.state as SignUpIdle).avatar.url, kidAvatarUrl);
          });
      blocTest<SignUpBloc, SignUpState>(
        'and [index] is 4 and [avatarNavigation] is "BackButton" emits [SignUpIdle] with [index] 3 and [avatar] equal to "assets/avatars/man.png"',
        build: () => signUpBloc,
        seed: () =>
            SignUpIdle(avatar: avatarList.avatars[4]!, avatarList: avatarList),
        act: (bloc) => bloc.add(
          const SignUpChangeAvatar(avatarNavigation: 'BackButton'),
        ),
        expect: () => <SignUpState>[
          SignUpIdle(avatar: avatarList.avatars[3]!, avatarList: avatarList)
        ],
      );
      blocTest<SignUpBloc, SignUpState>(
          'and [index] is 1 and [avatarNavigation] is "BackButton" emits [SignUpIdle] with [index] 1 and [avatar] equal to "assets/avatars/kitty.png"',
          build: () => signUpBloc,
          seed: () => SignUpIdle(
              avatar: avatarList.avatars[1]!, avatarList: avatarList),
          act: (bloc) => bloc.add(
                const SignUpChangeAvatar(avatarNavigation: 'BackButton'),
              ),
          verify: (bloc) {
            expect(
              (bloc.state as SignUpIdle).avatar.path,
              'assets/avatars/kitty.png',
            );
            expect(
              (bloc.state as SignUpIdle).avatar.id,
              1,
            );

            expect(
              (bloc.state as SignUpIdle).avatar.url,
              kittyAvatarUrl,
            );
          });
    });

    group('when [AuthEventcreateAccount] is added', () {
      blocTest<SignUpBloc, SignUpState>(
        'and the account is succesfull create with [StandardAvatar]',
        setUp: () async {
          registerFallbackValue(authUserMock);
          registerFallbackValue(const StandardAvatar(id: 1, path: '', url: ''));
          when(() => authRepositoryMock.createAccount(
                email: any(named: 'email'),
                password: any(named: 'password'),
              )).thenAnswer((_) async => authUserMock);
          when(() => avatarRepositoryMock.uploadAvatar(
                  authUser: any(named: 'authUser'),
                  avatarModel: any(named: 'avatarModel')))
              .thenAnswer((_) => Future.value(null));
          when(() =>
              avatarRepositoryMock.getUrlFromRemoteStorage(
                  authUser: any(named: 'authUser'),
                  avatarModel: any(named: 'avatarModel'))).thenAnswer(
              (_) async => const CustomAvatar(id: 1, path: 'path', url: 'url'));
          when(() => authRepositoryMock.updateAccountDetails(
                  newName: any(named: 'newName'), avatar: any(named: 'avatar')))
              .thenAnswer((_) async => authUserMock);
        },
        build: () => signUpBloc,
        seed: () =>
            SignUpIdle(avatar: avatarList.avatars[7]!, avatarList: avatarList),
        act: (bloc) => bloc.add(const SignUpCreateAccount(
            email: 'ash@pallet.com',
            password: 'Teste123!',
            displayName: 'Ash Ketchum')),
        expect: () => <SignUpState>[
          SignUpLoading(avatar: avatarList.avatars[7]!, avatarList: avatarList),
        ],
      );
      blocTest<SignUpBloc, SignUpState>(
        'and the account is succesfull create with [CustomAvatar]',
        setUp: () async {
          registerFallbackValue(authUserMock);
          registerFallbackValue(const CustomAvatar(id: 1, path: '', url: ''));
          when(() => avatarRepositoryMock.uploadAvatar(
                  authUser: any(named: 'authUser'),
                  avatarModel: any(named: 'avatarModel')))
              .thenAnswer((_) => Future.value(null));
          when(() => authRepositoryMock.createAccount(
                email: any(named: 'email'),
                password: any(named: 'password'),
              )).thenAnswer((_) async => authUserMock);
          when(() => authRepositoryMock.updateAccountDetails(
                  newName: any(named: 'newName'), avatar: any(named: 'avatar')))
              .thenAnswer((_) async => authUserMock);
          when(() => avatarRepositoryMock.getUrlFromRemoteStorage(
                  avatarModel: any(named: 'avatarModel'),
                  authUser: any(named: 'authUser')))
              .thenAnswer((invocation) async =>
                  const CustomAvatar(id: 9, path: 'path', url: 'url'));
        },
        build: () => signUpBloc,
        seed: () => SignUpIdle(
            avatar: const CustomAvatar(id: 9, path: 'path', url: 'url'),
            avatarList: avatarList),
        act: (bloc) => bloc.add(const SignUpCreateAccount(
            email: 'ash@pallet.com',
            password: 'Teste123!',
            displayName: 'Ash Ketchum')),
        expect: () => <SignUpState>[
          SignUpLoading(
              avatar: const CustomAvatar(id: 9, path: 'path', url: 'url'),
              avatarList: avatarList),
        ],
      );
      blocTest<SignUpBloc, SignUpState>(
        'and throw [FirebaseAuthException]',
        setUp: () {
          when(() => authRepositoryMock.createAccount(
                email: any(named: 'email'),
                password: any(named: 'password'),
              )).thenThrow(FirebaseAuthException(code: 'email-already-in-use'));
        },
        build: () => signUpBloc,
        seed: () =>
            SignUpIdle(avatar: avatarList.avatars[7]!, avatarList: avatarList),
        act: (bloc) => bloc.add(const SignUpCreateAccount(
            email: 'ash@pallet.com',
            password: 'Teste123!',
            displayName: 'Ash Ketchum')),
        expect: () => <SignUpState>[
          SignUpLoading(
            avatar: avatarList.avatars[7]!,
            avatarList: avatarList,
          ),
          SignUpError(
              avatar: avatarList.avatars[7]!,
              avatarList: avatarList,
              authError: AuthErrorEmailAlreadyExists())
        ],
      );
      blocTest<SignUpBloc, SignUpState>(
        'and throw [PlatformException]',
        setUp: () {
          when(() => authRepositoryMock.createAccount(
                email: any(named: 'email'),
                password: any(named: 'password'),
              )).thenThrow(PlatformException(code: 'too-many-requests'));
        },
        build: () => signUpBloc,
        seed: () =>
            SignUpIdle(avatar: avatarList.avatars[7]!, avatarList: avatarList),
        act: (bloc) => bloc.add(const SignUpCreateAccount(
            email: 'ash@pallet.com',
            password: 'Teste123!',
            displayName: 'Ash Ketchum')),
        expect: () => <SignUpState>[
          SignUpLoading(
            avatar: avatarList.avatars[7]!,
            avatarList: avatarList,
          ),
          SignUpError(
              avatar: avatarList.avatars[7]!,
              avatarList: avatarList,
              authError: AuthErrorTooManyRequests())
        ],
      );
    });

    group('[when SignUpUploadPhoto is added]', () {
      blocTest<SignUpBloc, SignUpState>(
        'and [index] is 4 and [avatarNavigation] is "BackButton" emits [SignUpIdle] with [index] 3 and [avatar] equal to "assets/avatars/man.png"',
        build: () => signUpBloc,
        seed: () =>
            SignUpIdle(avatar: avatarList.avatars[4]!, avatarList: avatarList),
        act: (bloc) => bloc.add(
          const SignUpUploadPhoto(imagePath: 'BackButton'),
        ),
        expect: () => <SignUpState>[
          SignUpIdle(avatar: avatarList.avatars[9]!, avatarList: avatarList)
        ],
      );
    });
  });
}
