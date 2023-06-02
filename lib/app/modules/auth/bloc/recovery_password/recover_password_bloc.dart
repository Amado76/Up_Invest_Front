// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_error.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_sucess.dart';

part 'recover_password_event.dart';
part 'recover_password_state.dart';

class RecoverPasswordBloc
    extends Bloc<RecoverPasswordEvent, RecoverPasswordState> {
  final IAuthRepository authRepository;
  RecoverPasswordBloc({required this.authRepository})
      : super(RecoverPasswordIdle()) {
    on<RecoverPasswordSendEmail>((event, emit) {
      _onSendEmail(event.email);
    });
  }

  void _onSendEmail(String email) async {
    emit(RecoverPasswordLoading());
    try {
      await authRepository.sendPasswordResetEmail(email);
      emit(RecoverPasswordSuccess(
          authSuccess: AuthSuccess.from('reset-password')));
      Modular.to.navigate('/auth/');
    } on Exception catch (e) {
      emit(RecoverPasswordError(authError: AuthError.from(e)));
    }
  }
}
