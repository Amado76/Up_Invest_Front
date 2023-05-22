import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/auth/auth_error.dart';

import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_event.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_state.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository_interface.dart';

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

    test('initical state is [AuthStateIdle]', () {
      expect(authBloc.state, const AuthStateIdle(isLoading: false));
    });

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

    group('when [AuthEventDeleteAccount] is added', () {
      blocTest<AuthBloc, AuthState>(
        'and it is successfull emits [AuthStateLoggedOut].',
        setUp: () {},
        build: () => authBloc,
        seed: () =>
            AuthStateLoggedIn(authUser: AuthUserModelMock(), isLoading: false),
        act: (bloc) => bloc
            .add(const AuthEventDeleteAccount(email: 'any', password: 'any')),
        expect: () => <AuthState>[
          AuthStateLoggedIn(authUser: authUserModelmMock, isLoading: true),
          const AuthStateLoggedOut(isLoading: false)
        ],
      );
    });

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
  });
}
