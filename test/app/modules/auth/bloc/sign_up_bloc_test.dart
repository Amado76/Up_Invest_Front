import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;
import 'package:flutter/material.dart' show Locale;
import 'package:flutter/services.dart' show PlatformException;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/modules/auth/bloc/sign_up_bloc.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_error.dart';
import 'package:up_invest_front/app/modules/user/avatar_model.dart';

import '../../../../mocks/auth/gateway/auth_gateway_mock.dart';
import '../../../../mocks/auth/model/auth_user_model_mock.dart';
import '../../../../mocks/auth/repository/auth_repository_mock.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'es'));
  group('SignUpBloc', () {
    String kittyAvatarUrl = 'https://i.ibb.co/m6NHwyd/kitty.png';
    String kidAvatarUrl = 'https://i.ibb.co/4S6cYZS/kid.png';
    late IAuthRepository authRepositoryMock;
    late SignUpBloc signUpBloc;
    late AuthUserModel authUserMock;
    late AvatarModel avatar;

    setUp(() {
      authRepositoryMock = AuthRepositoryMock(authGateway: AuthGatewayMock());
      authUserMock = AuthUserModelMock();

      signUpBloc = SignUpBloc(authRepository: authRepositoryMock);
    });

    group('when [SignUpChangeAvatar] is added', () {
      blocTest<SignUpBloc, SignUpState>(
        'and [index] is 1 and [avatarNavigation] is "FowardButton" emits [SignUpIdle] with [index] 2 and [avatar] equal to "assets/avatars/dog.png"',
        build: () => signUpBloc,
        seed: () => SignUpIdle(
          avatar: AvatarModel(id: 1),
        ),
        act: (bloc) => bloc.add(
          const SignUpChangeAvatar(avatarNavigation: 'FowardButton'),
        ),
        expect: () => <SignUpState>[SignUpIdle(avatar: AvatarModel(id: 2))],
      );
      blocTest<SignUpBloc, SignUpState>(
          'and [index] is 8 and [avatarNavigation] is "FowardButton" emits [SignUpIdle] with [index] 8 and [avatar] equal to "assets/avatars/kid.png"',
          build: () => signUpBloc,
          seed: () => SignUpIdle(avatar: AvatarModel(id: 8)),
          act: (bloc) => bloc.add(
                const SignUpChangeAvatar(avatarNavigation: 'FowardButton'),
              ),
          verify: (bloc) {
            expect(
              (bloc.state as SignUpIdle).avatar.avatarPath,
              'assets/avatars/kid.png',
            );
            expect(
              (bloc.state as SignUpIdle).avatar.id,
              8,
            );

            expect(
                (bloc.state as SignUpIdle).avatar.avatarGetUrl, kidAvatarUrl);
          });
      blocTest<SignUpBloc, SignUpState>(
        'and [index] is 4 and [avatarNavigation] is "BackButton" emits [SignUpIdle] with [index] 3 and [avatar] equal to "assets/avatars/man.png"',
        build: () => signUpBloc,
        seed: () => SignUpIdle(avatar: AvatarModel(id: 4)),
        act: (bloc) => bloc.add(
          const SignUpChangeAvatar(avatarNavigation: 'BackButton'),
        ),
        expect: () => <SignUpState>[SignUpIdle(avatar: AvatarModel(id: 3))],
      );
      blocTest<SignUpBloc, SignUpState>(
          'and [index] is 1 and [avatarNavigation] is "BackButton" emits [SignUpIdle] with [index] 1 and [avatar] equal to "assets/avatars/kitty.png"',
          build: () => signUpBloc,
          seed: () => SignUpIdle(avatar: AvatarModel(id: 1)),
          act: (bloc) => bloc.add(
                const SignUpChangeAvatar(avatarNavigation: 'BackButton'),
              ),
          verify: (bloc) {
            expect(
              (bloc.state as SignUpIdle).avatar.avatarPath,
              'assets/avatars/kitty.png',
            );
            expect(
              (bloc.state as SignUpIdle).avatar.id,
              1,
            );

            expect(
              (bloc.state as SignUpIdle).avatar.avatarGetUrl,
              kittyAvatarUrl,
            );
          });
    });

    group('when [AuthEventcreateAccount] is added', () {
      blocTest<SignUpBloc, SignUpState>(
        'and the account is succesfull create',
        setUp: () {
          when(() => authRepositoryMock.createAccount(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                  displayName: any(named: 'displayName'),
                  avatar: any(named: 'avatar')))
              .thenAnswer((invocation) async => authUserMock);
        },
        build: () => signUpBloc,
        seed: () => SignUpIdle(
          avatar: AvatarModel(id: 7),
        ),
        act: (bloc) => bloc.add(const SignUpCreateAccount(
            email: 'ash@pallet.com',
            password: 'Teste123!',
            displayName: 'Ash Ketchum')),
        expect: () => <SignUpState>[
          SignUpLoading(
            avatar: AvatarModel(id: 7),
          ),
        ],
      );
      blocTest<SignUpBloc, SignUpState>(
        'and throw [FirebaseAuthException]',
        setUp: () {
          when(() => authRepositoryMock.createAccount(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                  displayName: any(named: 'displayName'),
                  avatar: any(named: 'avatar')))
              .thenThrow(FirebaseAuthException(code: 'email-already-in-use'));
        },
        build: () => signUpBloc,
        seed: () => SignUpIdle(
          avatar: AvatarModel(id: 7),
        ),
        act: (bloc) => bloc.add(const SignUpCreateAccount(
            email: 'ash@pallet.com',
            password: 'Teste123!',
            displayName: 'Ash Ketchum')),
        expect: () => <SignUpState>[
          SignUpLoading(
            avatar: AvatarModel(id: 7),
          ),
          SignUpError(
              avatar: AvatarModel(id: 7),
              authError: AuthErrorEmailAlreadyExists())
        ],
      );
      blocTest<SignUpBloc, SignUpState>(
        'and throw [PlatformException]',
        setUp: () {
          avatar = AvatarModel(id: 7);

          when(() => authRepositoryMock.createAccount(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                  displayName: any(named: 'displayName'),
                  avatar: any(named: 'avatar')))
              .thenThrow(PlatformException(code: 'too-many-requests'));
        },
        build: () => signUpBloc,
        seed: () => SignUpIdle(
          avatar: avatar,
        ),
        act: (bloc) => bloc.add(const SignUpCreateAccount(
            email: 'ash@pallet.com',
            password: 'Teste123!',
            displayName: 'Ash Ketchum')),
        expect: () => <SignUpState>[
          SignUpLoading(
            avatar: AvatarModel(id: 7),
          ),
          SignUpError(
              avatar: AvatarModel(id: 7), authError: AuthErrorTooManyRequests())
        ],
      );
    });
  });
}
