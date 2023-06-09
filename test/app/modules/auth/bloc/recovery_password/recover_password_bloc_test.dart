import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;
import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/modules/auth/bloc/recovery_password/recover_password_bloc.dart';

import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_error.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_sucess.dart';

import '../../../../../mocks/auth/adapter/auth_adapter_mock.dart';
import '../../../../../mocks/auth/repository/auth_repository_mock.dart';

void main() async {
  await IntlStrings.load(const Locale.fromSubtags(languageCode: 'pt'));
  late IAuthRepository authRepositoryMock;
  late RecoverPasswordBloc recoverPasswordBloc;

  setUp(() {
    authRepositoryMock = AuthRepositoryMock(authAdapter: AuthAdapterMock());
    recoverPasswordBloc =
        RecoverPasswordBloc(authRepository: authRepositoryMock);
  });

  test('initial state is [AuthStateIdle]', () {
    expect(recoverPasswordBloc.state, RecoverPasswordIdle());
  });

  group('when [RecoverPasswordSendEmail] is added', () {
    blocTest<RecoverPasswordBloc, RecoverPasswordState>(
      'and the email is sent successfully',
      setUp: () {
        when(() => authRepositoryMock.sendPasswordResetEmail(any()))
            .thenAnswer((_) => Future.value());
      },
      build: () => recoverPasswordBloc,
      act: (bloc) =>
          bloc.add(const RecoverPasswordSendEmail(email: 'whatever')),
      expect: () => <RecoverPasswordState>[
        RecoverPasswordLoading(),
        RecoverPasswordSuccess(authSuccess: AuthSuccessResetPassword())
      ],
    );
    blocTest<RecoverPasswordBloc, RecoverPasswordState>(
      'and FireBase throws some error, emits [RecoverPasswordError]',
      setUp: () {
        when(() => authRepositoryMock.sendPasswordResetEmail(any()))
            .thenThrow(FirebaseAuthException(code: 'invalid-email'));
      },
      build: () => recoverPasswordBloc,
      act: (bloc) =>
          bloc.add(const RecoverPasswordSendEmail(email: 'whatever')),
      expect: () => <RecoverPasswordState>[
        RecoverPasswordLoading(),
        RecoverPasswordError(authError: AuthErrorInvalidEmail())
      ],
    );
  });
}
