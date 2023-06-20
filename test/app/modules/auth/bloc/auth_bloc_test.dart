import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/adapter/cache_adapter/cache_adapter.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_error.dart';

import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';

import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';

import '../../../../mocks/auth/adapter/auth_adapter_mock.dart';
import '../../../../mocks/auth/model/auth_user_model_mock.dart';
import '../../../../mocks/auth/repository/auth_repository_mock.dart';
import '../../../../mocks/core/adapter/cache_adapter_mock.dart';
import '../../../../mocks/file_mock.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'es'));
  WidgetsFlutterBinding.ensureInitialized();
  group('AuthBloc', () {
    late AuthBloc authBloc;
    late AuthRepository authRepositoryMock;
    late AuthUserModel authUserMock;
    late ICacheAdapter cacheAdapterMock;
    late File fileMock;
    setUp(() {
      authRepositoryMock = AuthRepositoryMock(authAdapter: AuthAdapterMock());
      cacheAdapterMock = CacheAdapterMock();
      authBloc = AuthBloc(
          authRepository: authRepositoryMock, cacheAdapter: cacheAdapterMock);
      authUserMock = AuthUserModelMock();
      fileMock = FileMock();
    });

    // Initial state test

    test('initial state is [AuthLoggedOut]', () {
      expect(authBloc.state, AuthLoggedOut());
    });

    // AuthIsLoggedIn test
    group('when [AuthIsLoggedIn] is added', () {
      blocTest<AuthBloc, AuthState>(
        'and the user is logged-out emits [AuthLoggedOut].',
        setUp: () {
          when(() => authRepositoryMock.isUserSignedIn())
              .thenAnswer((invocation) async => false);
        },
        seed: () => AuthLoggedIn(authUser: authUserMock, avatar: fileMock),
        build: () => authBloc,
        act: (bloc) => bloc.add(const AuthIsLoggedIn()),
        expect: () => <AuthState>[AuthLoggedOut()],
      );
      blocTest<AuthBloc, AuthState>(
        'and the user is logged-in emits [AuthLoggedIn].',
        setUp: () {
          when(() => authRepositoryMock.isUserSignedIn())
              .thenAnswer((invocation) async => true);
          when(() => authRepositoryMock.getLoggedUser())
              .thenAnswer((invocation) async => authUserMock);
          when(() => cacheAdapterMock.getSingleFile(any()))
              .thenAnswer((invocation) async => fileMock);
        },
        seed: () => AuthLoggedOut(),
        build: () => authBloc,
        act: (bloc) => bloc.add(const AuthIsLoggedIn()),
        expect: () =>
            <AuthState>[AuthLoggedIn(authUser: authUserMock, avatar: fileMock)],
      );
    });

    // AuthSignInWithEmailAndPassword test
    group('when [AuthSignInWithEmailAndPassword] is added', () {
      blocTest<AuthBloc, AuthState>(
        'and authentication is successful emits [AuthLoggedIn].',
        setUp: () {
          when(() =>
                  authRepositoryMock.signInWithEmailAndPassword(any(), any()))
              .thenAnswer((invocation) async => authUserMock);
          when(() => cacheAdapterMock.getSingleFile(any()))
              .thenAnswer((invocation) async => fileMock);
        },
        build: () => authBloc,
        act: (bloc) => bloc.add(const AuthSignInWithEmailAndPassword(
            email: 'any', password: 'any')),
        expect: () => <AuthState>[
          AuthLoading(),
          AuthLoggedIn(authUser: authUserMock, avatar: fileMock),
        ],
      );
      blocTest<AuthBloc, AuthState>(
        'and tthrow [FirebaseAuthException] emits [AuthLoggedOut, with specific autherror].',
        setUp: () {
          when(() =>
                  authRepositoryMock.signInWithEmailAndPassword(any(), any()))
              .thenThrow(FirebaseAuthException(code: 'wrong-password'));
        },
        build: () => authBloc,
        act: (bloc) => bloc.add(const AuthSignInWithEmailAndPassword(
            email: 'any', password: 'any')),
        expect: () => <AuthState>[
          AuthLoading(),
          AuthErrorState(authError: AuthErrorWrongPassword())
        ],
      );
      blocTest<AuthBloc, AuthState>(
        'and throw [PlatformException] emits [AuthLoggedOut, with specific autherror].',
        setUp: () {
          when(() =>
                  authRepositoryMock.signInWithEmailAndPassword(any(), any()))
              .thenThrow(PlatformException(code: 'network_error'));
        },
        build: () => authBloc,
        act: (bloc) => bloc.add(const AuthSignInWithEmailAndPassword(
            email: 'any', password: 'any')),
        expect: () => <AuthState>[
          AuthLoading(),
          AuthErrorState(authError: AuthErrorNetworkError())
        ],
      );
    });
    // AuthSignInWithSocialNetwork
    group('when [AuthSignInWithSocialNetwork] is added', () {
      blocTest<AuthBloc, AuthState>(
          'and it is successfull emits [AuthLoggedIn]',
          setUp: () {
            when(() => authRepositoryMock.signInWithSocialNetwork('google'))
                .thenAnswer((_) async => authUserMock);
            when(() => cacheAdapterMock.getSingleFile(any()))
                .thenAnswer((invocation) async => fileMock);
          },
          build: () => authBloc,
          act: (bloc) => bloc
              .add(const AuthSignInWithSocialNetwork(socialNetwork: 'google')),
          expect: () => <AuthState>[
                AuthLoading(),
                AuthLoggedIn(authUser: authUserMock, avatar: fileMock),
              ]);
      blocTest<AuthBloc, AuthState>('and it fails emits [AuthLoggedOut]',
          setUp: () {
            when(() => authRepositoryMock.signInWithSocialNetwork('google'))
                .thenThrow(FirebaseAuthException(code: 'email-already-exists'));
          },
          build: () => authBloc,
          act: (bloc) => bloc
              .add(const AuthSignInWithSocialNetwork(socialNetwork: 'google')),
          expect: () => <AuthState>[
                AuthLoading(),
                AuthErrorState(authError: AuthErrorEmailAlreadyExists())
              ]);
      blocTest<AuthBloc, AuthState>('and it fails emits [AuthLoggedOut] ',
          setUp: () {
            when(() => authRepositoryMock.signInWithSocialNetwork(''))
                .thenThrow(Exception('invalid-social-network'));
          },
          build: () => authBloc,
          act: (bloc) =>
              bloc.add(const AuthSignInWithSocialNetwork(socialNetwork: '')),
          expect: () => <AuthState>[
                AuthLoading(),
                AuthErrorState(authError: AuthErrorOperationNotAllowed())
              ]);
    });
    // AuthDeleteAccount test
    group('when [AuthDeleteAccount] is added', () {
      blocTest<AuthBloc, AuthState>(
        'and it is successfull emits [AuthLoggedOut].',
        setUp: () {
          when(() => authRepositoryMock.deleteUser())
              .thenAnswer((_) => Future.value());
          when(() => authRepositoryMock.reauthenticateAUser(any(), any()))
              .thenAnswer((_) => Future.value());
        },
        build: () => authBloc,
        seed: () =>
            AuthLoggedIn(authUser: AuthUserModelMock(), avatar: fileMock),
        act: (bloc) =>
            bloc.add(const AuthDeleteAccount(email: 'any', password: 'any')),
        expect: () => <AuthState>[
          AuthLoading(),
          AuthLoggedOut(),
        ],
      );
      blocTest<AuthBloc, AuthState>(
        'and it throw FirebaseAuthException.',
        setUp: () {
          when(() => authRepositoryMock.deleteUser())
              .thenThrow(FirebaseAuthException(code: 'user-mismatch'));
          when(() => authRepositoryMock.reauthenticateAUser(any(), any()))
              .thenAnswer((_) => Future.value());
          when(() => cacheAdapterMock.getSingleFile(any()))
              .thenAnswer((invocation) async => fileMock);
        },
        build: () => authBloc,
        seed: () => AuthLoggedIn(authUser: authUserMock, avatar: fileMock),
        act: (bloc) =>
            bloc.add(const AuthDeleteAccount(email: 'any', password: 'any')),
        expect: () => <AuthState>[
          AuthLoading(),
          AuthErrorState(authError: AuthErrorUserMismatch()),
          AuthLoggedIn(authUser: authUserMock, avatar: fileMock)
        ],
      );
      blocTest<AuthBloc, AuthState>(
        'and it throw Exception.',
        setUp: () {
          when(() => authRepositoryMock.deleteUser())
              .thenThrow(PlatformException(code: 'weak-password'));
          when(() => authRepositoryMock.reauthenticateAUser(any(), any()))
              .thenAnswer((_) => Future.value());
          when(() => cacheAdapterMock.getSingleFile(any()))
              .thenAnswer((invocation) async => fileMock);
        },
        build: () => authBloc,
        seed: () => AuthLoggedIn(authUser: authUserMock, avatar: fileMock),
        act: (bloc) =>
            bloc.add(const AuthDeleteAccount(email: 'any', password: 'any')),
        expect: () => <AuthState>[
          AuthLoading(),
          AuthErrorState(authError: AuthErrorWeakPassword()),
          AuthLoggedIn(authUser: authUserMock, avatar: fileMock)
        ],
      );
    });

    // AuthLogOut test
    group('when [AuthLogOut] is added', () {
      blocTest<AuthBloc, AuthState>(
        'and the user is successfully logged out emits [AuthLoggedOut].',
        setUp: () {
          when(() => authRepositoryMock.signOut())
              .thenAnswer((_) => Future.value());
        },
        build: () => authBloc,
        seed: () => AuthLoggedIn(authUser: authUserMock, avatar: fileMock),
        act: (bloc) => bloc.add(
          const AuthLogOut(),
        ),
        expect: () => <AuthState>[
          AuthLoggedOut(),
        ],
      );
    });
  });
}
