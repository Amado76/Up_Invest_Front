// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:math' show Random;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';
import 'package:up_invest_front/app/modules/auth/repository/avatar_model_repository.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_error.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_model.dart';

import '../../model/avatar_list.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final IAuthRepository authRepository;
  final IAvatarRepository avatarRepository;

  SignUpBloc({required this.authRepository, required this.avatarRepository})
      : super(SignUpIdle(
            avatarList: AvatarList(),
            avatar: AvatarList().avatars[Random().nextInt(7) + 1]!)) {
    on<SignUpChangeAvatar>((event, emit) {
      _onChangeAvatar(event.avatarNavigation);
    });
    on<SignUpCreateAccount>((event, emit) {
      _onCreateAccount(
          password: event.password,
          email: event.email,
          displayName: event.displayName);
    });

    on<SignUpUploadPhoto>((event, emit) {
      _onUploadPhoto(event.imagePath);
    });
  }

  void _onCreateAccount(
      {required String password,
      required String email,
      required String displayName}) async {
    AvatarModel avatar = state.avatar;
    AvatarList currentAvatarList = state.avatarList;

    emit(SignUpLoading(avatar: avatar, avatarList: currentAvatarList));

    try {
      AuthUserModel authUser =
          await authRepository.createAccount(email: email, password: password);
      await avatarRepository.uploadAvatar(
          avatarModel: avatar, authUser: authUser);
      AvatarModel updatedAvatar = await avatarRepository
          .getUrlFromRemoteStorage(avatarModel: avatar, authUser: authUser);
      authUser = await authRepository.updateAccountDetails(
          avatar: updatedAvatar.url, newName: displayName);

      authRepository.addAuthUserToStream(authUser);
    } on Exception catch (e) {
      emit(SignUpError(
          avatarList: currentAvatarList,
          avatar: avatar,
          authError: AuthError.from(e)));
    }
  }

  void _onUploadPhoto(String imagePath) {
    AvatarList avatarList = state.avatarList;
    avatarList.addCustomAvatar(imagePath, imagePath);
    AvatarModel newAvatar = avatarList.avatars.values.last;
    emit(SignUpIdle(avatar: newAvatar, avatarList: avatarList));
  }

  void _onChangeAvatar(String avatarNavigation) {
    AvatarModel currentAvatar = state.avatar;
    AvatarList currentAvatarList = state.avatarList;
    int currentId = currentAvatar.id!;
    int listLength = currentAvatarList.avatars.length;
    int newId = _selectAvatar(avatarNavigation, currentId, listLength);
    AvatarModel newAvatar = currentAvatarList.avatars[newId]!;

    emit(SignUpIdle(avatar: newAvatar, avatarList: currentAvatarList));
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
