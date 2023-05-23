import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_error.dart';

import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_event.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_state.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository_interface.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_sucess.dart';
import 'package:up_invest_front/app/modules/user/avatar_model.dart';

import '../../../../mocks/gateway/auth_gateway_mock.dart';
import '../../../../mocks/model/auth_user_model_mock.dart';
import '../../../../mocks/repository/auth_repository_mock.dart';

void main() async {
  group('AuthBloc', () {
    late AuthBloc authBloc;
    late IAuthRepository authRepositoryMock;
    late AuthUserModel authUserModelmMock;

    setUp(() {
      authRepositoryMock = AuthRepositoryMock(authGateway: AuthGatewayMock());
      authBloc = AuthBloc(authRepository: authRepositoryMock);
      authUserModelmMock = AuthUserModelMock();
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
              .thenAnswer((invocation) async => authUserModelmMock);
        },
        build: () => authBloc,
        act: (bloc) => bloc.add(const AuthEventIsLoggedIn()),
        expect: () => <AuthState>[
          AuthStateLoggedIn(isLoading: false, authUser: authUserModelmMock)
        ],
      );
    });
    // AuthEventCreateNewUser test
    group('when [AuthEventcreateAccount] is added', () {
      blocTest<AuthBloc, AuthState>(
        'and the account is succesfull create',
        setUp: () {
          when(() =>
                  authRepositoryMock.createAccount(any(), any(), any(), any()))
              .thenAnswer((invocation) async => authUserModelmMock);
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
          AuthStateLoggedIn(authUser: authUserModelmMock, isLoading: false)
        ],
      );

      // AuthEventSignInWithEmailAndPassword test
      group('when [AuthEventSignInWithEmailAndPassword] is added', () {
        blocTest<AuthBloc, AuthState>(
          'and authentication is successful emits [AuthStateLoggedIn].',
          setUp: () {
            when(() =>
                    authRepositoryMock.signInWithEmailAndPassword(any(), any()))
                .thenAnswer((invocation) async => authUserModelmMock);
          },
          build: () => authBloc,
          act: (bloc) => bloc.add(const AuthEventSignInWithEmailAndPassword(
              email: 'any', password: 'any')),
          expect: () => <AuthState>[
            const AuthStateLoggedOut(isLoading: true),
            AuthStateLoggedIn(isLoading: false, authUser: authUserModelmMock)
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
            const AuthStateLoggedOut(
                isLoading: false, authError: AuthErrorWrongPassword())
          ],
        );
      });

      // AuthEventDeleteAccount test
      group('when [AuthEventDeleteAccount] is added', () {
        blocTest<AuthBloc, AuthState>(
          'and it is successfull emits [AuthStateLoggedOut].',
          build: () => authBloc,
          seed: () => AuthStateLoggedIn(
              authUser: AuthUserModelMock(), isLoading: false),
          act: (bloc) => bloc
              .add(const AuthEventDeleteAccount(email: 'any', password: 'any')),
          expect: () => <AuthState>[
            AuthStateLoggedIn(authUser: authUserModelmMock, isLoading: true),
            const AuthStateLoggedOut(isLoading: false)
          ],
        );
      });
      // AuthEventLogOut test
      group('when [AuthEventLogOut] is added', () {
        blocTest<AuthBloc, AuthState>(
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
          build: () => authBloc,
          seed: () => const AuthStateRecoverPassword(isLoading: false),
          act: (bloc) => bloc
              .add(const AuthEventSendPasswordResetEmail(email: 'whatever')),
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
            final authRepositoryMock2 =
                AuthRepositoryMock2(authGateway: AuthGatewayMock());
            authBloc = AuthBloc(authRepository: authRepositoryMock2);
            when(
              () => authRepositoryMock2.sendPasswordResetEmail(any()),
            ).thenThrow(FirebaseAuthException(code: 'invalid-email'));
          },
          build: () => authBloc,
          seed: () => const AuthStateRecoverPassword(isLoading: false),
          act: (bloc) => bloc
              .add(const AuthEventSendPasswordResetEmail(email: 'whatever')),
          expect: () => <AuthState>[
            const AuthStateRecoverPassword(isLoading: true),
            const AuthStateRecoverPassword(
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
  });
}
