import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_error.dart';

import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';

import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_sucess.dart';
import 'package:up_invest_front/app/modules/user/avatar_model.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';

import '../../../../mocks/auth/gateway/auth_gateway_mock.dart';
import '../../../../mocks/auth/model/auth_user_model_mock.dart';
import '../../../../mocks/auth/repository/auth_repository_mock.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'es'));
  group('AuthBloc', () {
    late AuthBloc authBloc;
    late IAuthRepository authRepositoryMock;
    late AuthUserModel authUserMock;

    setUp(() {
      authRepositoryMock = AuthRepositoryMock(authGateway: AuthGatewayMock());
      authBloc = AuthBloc(authRepository: authRepositoryMock);
      authUserMock = AuthUserModelMock();
    });

    //Initial state test
    test('initial state is [AuthStateIdle]', () {
      expect(authBloc.state, const AuthStateIdle(isLoading: false));
    });

    // AuthEventIsLoggedIn test
    group('when [AuthEventIsLoggedIn] is added', () {
      blocTest<AuthBloc, AuthState>(
        'and the user is logged-out emits [AuthStateLoggedOut].',
        setUp: () {
          when(() => authRepositoryMock.isUserSignedIn())
              .thenAnswer((invocation) async => false);
        },
        build: () => authBloc,
        act: (bloc) => bloc.add(const AuthEventIsLoggedIn()),
        expect: () => const <AuthState>[AuthStateLoggedOut(isLoading: false)],
      );
      blocTest<AuthBloc, AuthState>(
        'and the user is logged-in emits [AuthStateLoggedIn].',
        setUp: () {
          when(() => authRepositoryMock.isUserSignedIn())
              .thenAnswer((invocation) async => true);
          when(() => authRepositoryMock.getLoggedUser())
              .thenAnswer((invocation) async => authUserMock);
        },
        build: () => authBloc,
        act: (bloc) => bloc.add(const AuthEventIsLoggedIn()),
        expect: () => <AuthState>[
          AuthStateLoggedIn(isLoading: false, authUser: authUserMock)
        ],
      );
    });
    // AuthEventCreateNewUser test
    group('when [AuthEventcreateAccount] is added', () {
      blocTest<AuthBloc, AuthState>(
        'and the account is succesfull create',
        setUp: () {
          when(() => authRepositoryMock.createAccount(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                  displayName: any(named: 'displayName'),
                  avatar: any(named: 'avatar')))
              .thenAnswer((invocation) async => authUserMock);
        },
        build: () => authBloc,
        seed: () => const AuthStateSigningUp(
            index: 7, avatar: 'assets/avatars/fox.png', isLoading: false),
        act: (bloc) => bloc.add(const AuthEventCreateAccount(
            email: 'ash@pallet.com',
            password: 'Teste123!',
            displayName: 'Ash Ketchum')),
        expect: () => <AuthState>[
          const AuthStateSigningUp(
              avatar: 'assets/avatars/fox.png', index: 7, isLoading: true),
          AuthStateLoggedIn(authUser: authUserMock, isLoading: false)
        ],
      );
      blocTest<AuthBloc, AuthState>(
        'and throw error',
        setUp: () {
          when(() => authRepositoryMock.createAccount(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                  displayName: any(named: 'displayName'),
                  avatar: any(named: 'avatar')))
              .thenThrow(FirebaseAuthException(code: 'email-already-in-use'));
        },
        build: () => authBloc,
        seed: () => const AuthStateSigningUp(
            index: 7, avatar: 'assets/avatars/fox.png', isLoading: false),
        act: (bloc) => bloc.add(const AuthEventCreateAccount(
            email: 'ash@pallet.com',
            password: 'Teste123!',
            displayName: 'Ash Ketchum')),
        expect: () => <AuthState>[
          const AuthStateSigningUp(
              avatar: 'assets/avatars/fox.png', index: 7, isLoading: true),
          AuthStateSigningUp(
              avatar: 'assets/avatars/fox.png',
              index: 7,
              isLoading: false,
              authError: AuthErrorEmailAlreadyExists()),
        ],
      );
      blocTest<AuthBloc, AuthState>(
        'and throw error',
        setUp: () {
          when(() => authRepositoryMock.createAccount(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                  displayName: any(named: 'displayName'),
                  avatar: any(named: 'avatar')))
              .thenThrow(PlatformException(code: 'too-many-requests'));
        },
        build: () => authBloc,
        seed: () => const AuthStateSigningUp(
            index: 7, avatar: 'assets/avatars/fox.png', isLoading: false),
        act: (bloc) => bloc.add(const AuthEventCreateAccount(
            email: 'ash@pallet.com',
            password: 'Teste123!',
            displayName: 'Ash Ketchum')),
        expect: () => <AuthState>[
          const AuthStateSigningUp(
              avatar: 'assets/avatars/fox.png', index: 7, isLoading: true),
          AuthStateSigningUp(
              avatar: 'assets/avatars/fox.png',
              index: 7,
              isLoading: false,
              authError: AuthErrorTooManyRequests()),
        ],
      );
    });
    // AuthEventSignInWithEmailAndPassword test
    group('when [AuthEventSignInWithEmailAndPassword] is added', () {
      blocTest<AuthBloc, AuthState>(
        'and authentication is successful emits [AuthStateLoggedIn].',
        setUp: () {
          when(() =>
                  authRepositoryMock.signInWithEmailAndPassword(any(), any()))
              .thenAnswer((invocation) async => authUserMock);
        },
        build: () => authBloc,
        act: (bloc) => bloc.add(const AuthEventSignInWithEmailAndPassword(
            email: 'any', password: 'any')),
        expect: () => <AuthState>[
          const AuthStateLoggedOut(isLoading: true),
          AuthStateLoggedIn(isLoading: false, authUser: authUserMock)
        ],
      );
      blocTest<AuthBloc, AuthState>(
        'and authentication fails emits [AuthStateLoggedOut, with specific autherror].',
        setUp: () {
          when(() =>
                  authRepositoryMock.signInWithEmailAndPassword(any(), any()))
              .thenThrow(FirebaseAuthException(code: 'wrong-password'));
        },
        build: () => authBloc,
        act: (bloc) => bloc.add(const AuthEventSignInWithEmailAndPassword(
            email: 'any', password: 'any')),
        expect: () => <AuthState>[
          const AuthStateLoggedOut(isLoading: true),
          AuthStateLoggedOut(
              isLoading: false, authError: AuthErrorWrongPassword())
        ],
      );
      blocTest<AuthBloc, AuthState>(
        'and authentication fails emits [AuthStateLoggedOut, with specific autherror].',
        setUp: () {
          when(() =>
                  authRepositoryMock.signInWithEmailAndPassword(any(), any()))
              .thenThrow(PlatformException(code: 'network_error'));
        },
        build: () => authBloc,
        act: (bloc) => bloc.add(const AuthEventSignInWithEmailAndPassword(
            email: 'any', password: 'any')),
        expect: () => <AuthState>[
          const AuthStateLoggedOut(isLoading: true),
          AuthStateLoggedOut(
              isLoading: false, authError: AuthErrorNetworkError())
        ],
      );
    });
    // AuthEventSignInWithSocialNetwork
    group('whe [AuthEventSignInWithSocialNetwork', () {
      blocTest<AuthBloc, AuthState>(
          'and it is successfull emits [AuthStateLoggedIn]',
          setUp: () {
            when(() => authRepositoryMock.signInWithSocialNetwork('google'))
                .thenAnswer((_) async => authUserMock);
          },
          build: () => authBloc,
          act: (bloc) => bloc.add(
              const AuthEventSignInWithSocialNetwork(socialNetwork: 'google')),
          expect: () => <AuthState>[
                const AuthStateLoggedOut(isLoading: true),
                AuthStateLoggedIn(authUser: authUserMock, isLoading: false)
              ]);
      blocTest<AuthBloc, AuthState>('and it fails emits [AuthStateLoggedOut]',
          setUp: () {
            when(() => authRepositoryMock.signInWithSocialNetwork('google'))
                .thenThrow(FirebaseAuthException(code: 'email-already-exists'));
          },
          build: () => authBloc,
          act: (bloc) => bloc.add(
              const AuthEventSignInWithSocialNetwork(socialNetwork: 'google')),
          expect: () => <AuthState>[
                const AuthStateLoggedOut(isLoading: true),
                AuthStateLoggedOut(
                    authError: AuthErrorEmailAlreadyExists(), isLoading: false)
              ]);
      blocTest<AuthBloc, AuthState>('and it fails emits [AuthStateLoggedOut] ',
          setUp: () {
            when(() => authRepositoryMock.signInWithSocialNetwork(''))
                .thenThrow(Exception('invalid-social-network'));
          },
          build: () => authBloc,
          act: (bloc) => bloc
              .add(const AuthEventSignInWithSocialNetwork(socialNetwork: '')),
          expect: () => <AuthState>[
                const AuthStateLoggedOut(isLoading: true),
                AuthStateLoggedOut(
                    authError: AuthErrorOperationNotAllowed(), isLoading: false)
              ]);
    });
    // AuthEventDeleteAccount test
    group('when [AuthEventDeleteAccount] is added', () {
      blocTest<AuthBloc, AuthState>(
        'and it is successfull emits [AuthStateLoggedOut].',
        setUp: () {
          when(() => authRepositoryMock.deleteUser())
              .thenAnswer((_) => Future.value());
          when(() => authRepositoryMock.reauthenticateAUser(any(), any()))
              .thenAnswer((_) => Future.value());
        },
        build: () => authBloc,
        seed: () =>
            AuthStateLoggedIn(authUser: AuthUserModelMock(), isLoading: false),
        act: (bloc) => bloc
            .add(const AuthEventDeleteAccount(email: 'any', password: 'any')),
        expect: () => <AuthState>[
          AuthStateLoggedIn(authUser: authUserMock, isLoading: true),
          const AuthStateLoggedOut(isLoading: false)
        ],
      );
      blocTest<AuthBloc, AuthState>(
        'and it throw FirebaseAuthException.',
        setUp: () {
          when(() => authRepositoryMock.deleteUser())
              .thenThrow(FirebaseAuthException(code: 'user-mismatch'));
          when(() => authRepositoryMock.reauthenticateAUser(any(), any()))
              .thenAnswer((_) => Future.value());
        },
        build: () => authBloc,
        seed: () =>
            AuthStateLoggedIn(authUser: AuthUserModelMock(), isLoading: false),
        act: (bloc) => bloc
            .add(const AuthEventDeleteAccount(email: 'any', password: 'any')),
        expect: () => <AuthState>[
          AuthStateLoggedIn(authUser: authUserMock, isLoading: true),
          AuthStateLoggedIn(
              authUser: authUserMock,
              isLoading: false,
              authError: AuthErrorUserMismatch())
        ],
      );
      blocTest<AuthBloc, AuthState>(
        'and it throw Exception.',
        setUp: () {
          when(() => authRepositoryMock.deleteUser())
              .thenThrow(PlatformException(code: 'weak-password'));
          when(() => authRepositoryMock.reauthenticateAUser(any(), any()))
              .thenAnswer((_) => Future.value());
        },
        build: () => authBloc,
        seed: () =>
            AuthStateLoggedIn(authUser: AuthUserModelMock(), isLoading: false),
        act: (bloc) => bloc
            .add(const AuthEventDeleteAccount(email: 'any', password: 'any')),
        expect: () => <AuthState>[
          AuthStateLoggedIn(authUser: authUserMock, isLoading: true),
          AuthStateLoggedIn(
              authUser: authUserMock,
              isLoading: false,
              authError: AuthErrorWeakPassword())
        ],
      );
    });
    // AuthEventUpdatePassword test
    group('when [AuthEventUpdatePassword] is added', () {
      blocTest<AuthBloc, AuthState>(
          'and it is successfull updated emits [AuthStateLoggedIn]',
          setUp: () {
            when(() => authRepositoryMock.reauthenticateAUser(any(), any()))
                .thenAnswer((_) => Future.value());
            when(() => authRepositoryMock.updatePassword(
                    newPassword: any(named: 'newPassword')))
                .thenAnswer((_) => Future.value());
          },
          build: () => authBloc,
          seed: () =>
              AuthStateLoggedIn(authUser: authUserMock, isLoading: false),
          act: (bloc) => bloc.add(const AuthEventUpdatePassword(
              oldPassword: 'oldPassword', newPassword: 'newPassword')),
          expect: () => <AuthState>[
                AuthStateLoggedIn(authUser: authUserMock, isLoading: true),
                AuthStateLoggedIn(
                    authUser: authUserMock,
                    isLoading: false,
                    authSuccess: AuthSuccessSetNewPassword()),
              ]);
      blocTest<AuthBloc, AuthState>(
          'and it fails emits [AuthStateLoggedIn] with error',
          setUp: () {
            when(() => authRepositoryMock.reauthenticateAUser(any(), any()))
                .thenAnswer((_) => Future.value());
            when(() => authRepositoryMock.updatePassword(
                    newPassword: any(named: 'newPassword')))
                .thenThrow(
                    FirebaseAuthException(code: 'requires-recent-login'));
          },
          build: () => authBloc,
          seed: () =>
              AuthStateLoggedIn(authUser: authUserMock, isLoading: false),
          act: (bloc) => bloc.add(const AuthEventUpdatePassword(
              oldPassword: 'oldPassword', newPassword: 'newPassword')),
          expect: () => <AuthState>[
                AuthStateLoggedIn(authUser: authUserMock, isLoading: true),
                AuthStateLoggedIn(
                    authUser: authUserMock,
                    isLoading: false,
                    authError: AuthErrorRequiresRecentLogin()),
              ]);
      blocTest<AuthBloc, AuthState>(
          'and it fails emits [AuthStateLoggedIn] with error',
          setUp: () {
            when(() => authRepositoryMock.reauthenticateAUser(any(), any()))
                .thenAnswer((_) => Future.value());
            when(() => authRepositoryMock.updatePassword(
                    newPassword: any(named: 'newPassword')))
                .thenThrow(PlatformException(code: 'user-not-found'));
          },
          build: () => authBloc,
          seed: () =>
              AuthStateLoggedIn(authUser: authUserMock, isLoading: false),
          act: (bloc) => bloc.add(const AuthEventUpdatePassword(
              oldPassword: 'oldPassword', newPassword: 'newPassword')),
          expect: () => <AuthState>[
                AuthStateLoggedIn(authUser: authUserMock, isLoading: true),
                AuthStateLoggedIn(
                    authUser: authUserMock,
                    isLoading: false,
                    authError: AuthErrorUserNotFound()),
              ]);
    });
    // AuthEventLogOut test
    group('when [AuthEventLogOut] is added', () {
      blocTest<AuthBloc, AuthState>(
        setUp: () {
          when(() => authRepositoryMock.signOut())
              .thenAnswer((_) => Future.value());
        },
        'and the user is successfully logged out emits [AuthStateLoggedOut].',
        build: () => authBloc,
        act: (bloc) => bloc.add(
          const AuthEventLogOut(),
        ),
        expect: () => <AuthState>[
          const AuthStateLoggedOut(isLoading: false),
        ],
      );
    });
    // AuthEventChangeAvatar test
    group('when [AuthEventChangeAvatar] is added', () {
      blocTest<AuthBloc, AuthState>(
        'and [index] is 1 and [avatarNavigation] is "FowardButton" emits [AuthStateSigningUp] with [index] 2 and [avatar] equal to "assets/avatars/dog.png"',
        build: () => authBloc,
        seed: () => const AuthStateSigningUp(
            avatar: 'assets/avatars/kitty.png', isLoading: false, index: 1),
        act: (bloc) => bloc.add(
          const AuthEventChangeAvatar(avatarNavigation: 'FowardButton'),
        ),
        expect: () => <AuthState>[
          const AuthStateSigningUp(
              avatar: 'assets/avatars/dog.png', index: 2, isLoading: false)
        ],
      );
      blocTest<AuthBloc, AuthState>(
          'and [index] is 8 and [avatarNavigation] is "FowardButton" emits [AuthStateSigningUp] with [index] 8 and [avatar] equal to "assets/avatars/kid.png"',
          build: () => authBloc,
          seed: () => const AuthStateSigningUp(
              avatar: 'assets/avatars/kid.png', isLoading: false, index: 8),
          act: (bloc) => bloc.add(
                const AuthEventChangeAvatar(avatarNavigation: 'FowardButton'),
              ),
          verify: (bloc) {
            expect(
              (bloc.state as AuthStateSigningUp).avatar,
              'assets/avatars/kid.png',
            );
            expect(
              (bloc.state as AuthStateSigningUp).index,
              8,
            );
            expect(
              (bloc.state as AuthStateSigningUp).isLoading,
              false,
            );
          });
      blocTest<AuthBloc, AuthState>(
        'and [index] is 4 and [avatarNavigation] is "BackButton" emits [AuthStateSigningUp] with [index] 3 and [avatar] equal to "assets/avatars/man.png"',
        build: () => authBloc,
        seed: () => const AuthStateSigningUp(
            avatar: 'assets/avatars/unicorn.png', isLoading: false, index: 4),
        act: (bloc) => bloc.add(
          const AuthEventChangeAvatar(avatarNavigation: 'BackButton'),
        ),
        expect: () => <AuthState>[
          const AuthStateSigningUp(
              avatar: 'assets/avatars/man.png', index: 3, isLoading: false)
        ],
      );
      blocTest<AuthBloc, AuthState>(
          'and [index] is 1 and [avatarNavigation] is "BackButton" emits [AuthStateSigningUp] with [index] 1 and [avatar] equal to "assets/avatars/kitty.png"',
          build: () => authBloc,
          seed: () => const AuthStateSigningUp(
              avatar: 'assets/avatars/kitty.png', isLoading: false, index: 1),
          act: (bloc) => bloc.add(
                const AuthEventChangeAvatar(avatarNavigation: 'BackButton'),
              ),
          verify: (bloc) {
            expect(
              (bloc.state as AuthStateSigningUp).avatar,
              'assets/avatars/kitty.png',
            );
            expect(
              (bloc.state as AuthStateSigningUp).index,
              1,
            );
            expect(
              (bloc.state as AuthStateSigningUp).isLoading,
              false,
            );
          });
    });
    //AuthEventSendPasswordResetEmail test
    group('when [AuthEventSendPasswordResetEmail] is added', () {
      blocTest<AuthBloc, AuthState>(
        'and the email was sent successfully, emits [AuthStateLogOut]',
        setUp: () {
          when(() => authRepositoryMock.sendPasswordResetEmail(any()))
              .thenAnswer((_) => Future.value());
        },
        build: () => authBloc,
        seed: () => const AuthStateRecoverPassword(isLoading: false),
        act: (bloc) =>
            bloc.add(const AuthEventSendPasswordResetEmail(email: 'whatever')),
        expect: () => <AuthState>[
          const AuthStateRecoverPassword(isLoading: true),
          AuthStateRecoverPassword(
              isLoading: false,
              authSuccess: AuthSuccess.from('reset-password')),
          const AuthStateLoggedOut(
            isLoading: false,
          )
        ],
      );
      blocTest<AuthBloc, AuthState>(
        'and FireBase throws some error, emits [AuthStateRecoverPassword]',
        setUp: () {
          when(
            () => authRepositoryMock.sendPasswordResetEmail(any()),
          ).thenThrow(FirebaseAuthException(code: 'invalid-email'));
        },
        build: () => authBloc,
        seed: () => const AuthStateRecoverPassword(isLoading: false),
        act: (bloc) =>
            bloc.add(const AuthEventSendPasswordResetEmail(email: 'whatever')),
        expect: () => <AuthState>[
          const AuthStateRecoverPassword(isLoading: true),
          AuthStateRecoverPassword(
              isLoading: false, authError: AuthErrorInvalidEmail())
        ],
      );
    });
    // AuthEventGoToSignUpPage test
    group('when [AuthEventGoToSignUpPage] is added', () {
      late AvatarModel avatarModel;
      late String avatarImage;
      setUp(() => {
            avatarModel = AvatarModel(),
            avatarImage = avatarModel.avatarList[1]!,
          });
      blocTest<AuthBloc, AuthState>(
        'emits [AuthStateSigningUp]',
        build: () => authBloc,
        act: (bloc) => bloc.add(
          const AuthEventGoToSignUpPage(),
        ),
        expect: () => <AuthState>[
          AuthStateSigningUp(avatar: avatarImage, isLoading: false, index: 1)
        ],
      );
    });
    // AuthEventGoToSignInPage test
    group('when [AuthEventGoToSignInPage] is added', () {
      blocTest<AuthBloc, AuthState>(
        'emits [AuthStateLoggedOut]',
        build: () => authBloc,
        seed: () =>
            const AuthStateSigningUp(avatar: '', isLoading: false, index: 1),
        act: (bloc) => bloc.add(
          const AuthEventGoToSignInPage(),
        ),
        expect: () => <AuthState>[const AuthStateLoggedOut(isLoading: false)],
      );
    });
    // AuthEventGoRecoverPasswordPage test
    group('when [AuthEventGoToRecoverPasswordPage] is added', () {
      blocTest<AuthBloc, AuthState>(
        'emits [AuthStateRecoverPasswordPage]',
        build: () => authBloc,
        act: (bloc) => bloc.add(
          const AuthEventGoToRecoverPasswordPage(),
        ),
        expect: () =>
            <AuthState>[const AuthStateRecoverPassword(isLoading: false)],
      );
    });
  });
}
