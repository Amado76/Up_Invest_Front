// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_error.dart';
import 'package:up_invest_front/app/modules/user/avatar_model.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final IAuthRepository authRepository;
  SignUpBloc({required this.authRepository})
      : super(SignUpIdle(avatar: AvatarModel(id: 1))) {
    on<SignUpChangeAvatar>((event, emit) {
      _onChangeAvatar(event.avatarNavigation);
    });
    on<SignUpCreateAccount>((event, emit) {
      _onCreateAccount(
          password: event.password,
          email: event.email,
          displayName: event.displayName);
    });
  }

  void _onCreateAccount(
      {required String password,
      required String email,
      required String displayName}) async {
    AvatarModel currentAvatar = state.avatar;
    emit(SignUpLoading(avatar: currentAvatar));
    try {
      await authRepository.createAccount(
          displayName: displayName,
          email: email,
          password: password,
          avatar: currentAvatar.avatarGetUrl);
      Modular.to.navigate('/home/');
    } on Exception catch (e) {
      emit(SignUpError(avatar: currentAvatar, authError: AuthError.from(e)));
    }
  }

  void _onChangeAvatar(String avatarNavigation) {
    AvatarModel currentAvatar = state.avatar;
    int currentId = currentAvatar.id;
    int listLength = currentAvatar.avatarList.length;
    int newId = _selectAvatar(avatarNavigation, currentId, listLength);
    AvatarModel newAvatar = AvatarModel(id: newId);
    emit(SignUpIdle(avatar: newAvatar));
  }

  int _selectAvatar(String avatarNavigation, int? currentId, int listLength) {
    int newId;
    if (currentId == null) {
      return 1;
    }
    if (currentId < listLength && avatarNavigation == 'FowardButton') {
      currentId++;
      newId = currentId;
      return newId;
    }
    if (currentId > 1 && avatarNavigation == 'BackButton') {
      currentId--;
      newId = currentId;
      return newId;
    }
    return currentId;
  }
}
