// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show immutable;
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_list.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_error.dart';

part 'edit_details_event.dart';
part 'edit_details_state.dart';

class EditDetailsBloc extends Bloc<EditDetailsEvent, EditDetailsState> {
  final IAuthRepository authRepository;
  final AuthUserModel authUser;
  final AvatarModel avatar;

  EditDetailsBloc({
    required this.authRepository,
    required this.authUser,
    required this.avatar,
  }) : super(EditDetailsIdle(
            authUser: authUser, avatar: avatar, avatarList: AvatarList())) {
    on<EditDetailsAddToAvatarList>((event, emit) {
      _addToAvatarList(event.imagePath);
    });
    on<EditDetailsChangeAvatar>((event, emit) {
      _onChangeAvatar(event.avatarNavigation);
    });
    on<EditDetailsUploadPhoto>((event, emit) {
      _onUploadPhoto(event.imagePath);
    });
  }
  void _addToAvatarList(String imagePath) {
    AvatarList avatarList = AvatarList();
    avatarList.addNetworkAvatar(imagePath);
    AvatarModel newAvatar = avatarList.avatars.values.last;
    emit(EditDetailsIdle(
        avatar: newAvatar, avatarList: avatarList, authUser: authUser));
  }

  void _onUploadPhoto(String imagePath) {
    AvatarList avatarList = state.avatarList;
    avatarList.addCustomAvatar(imagePath, imagePath);
    AvatarModel newAvatar = avatarList.avatars.values.last;
    emit(EditDetailsIdle(
        avatar: newAvatar, avatarList: avatarList, authUser: authUser));
  }

  void _onChangeAvatar(String avatarNavigation) {
    AvatarModel currentAvatar = state.avatar;
    AvatarList currentAvatarList = state.avatarList;
    int currentId = currentAvatar.id!;
    int listLength = currentAvatarList.avatars.length;
    int newId = _selectAvatar(avatarNavigation, currentId, listLength);
    AvatarModel newAvatar = currentAvatarList.avatars[newId]!;

    emit(EditDetailsIdle(
        avatar: newAvatar, avatarList: currentAvatarList, authUser: authUser));
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
