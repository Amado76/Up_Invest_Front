// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_list.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';
import 'package:up_invest_front/app/modules/auth/repository/avatar_model_repository.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_error.dart';
import 'package:up_invest_front/app/modules/settings/util/settings_error.dart';
import 'package:up_invest_front/app/modules/settings/util/settings_success.dart';

part 'edit_details_event.dart';
part 'edit_details_state.dart';

class EditDetailsBloc extends Bloc<EditDetailsEvent, EditDetailsState> {
  final IAvatarRepository avatarRepository;
  final IAuthRepository authRepository;
  final AuthUserModel authUser;
  final AvatarModel avatar;

  EditDetailsBloc({
    required this.avatarRepository,
    required this.authRepository,
    required this.authUser,
    required this.avatar,
  }) : super(EditDetailsIdle(
            authUser: authUser, avatar: avatar, avatarList: AvatarList())) {
    on<EditDetailsChangeDisplayAvatar>((event, emit) {
      _onChangeAvatar(event.avatarNavigation);
    });
    on<EditDetailsAddAvatarFromGallery>((event, emit) {
      _onUploadPhoto(event.imagePath);
    });
    on<EditDetailsUpdateAvatar>((event, emit) {
      _onUpdateAvatar();
    });
    on<EditDetailsCleanAvatarList>((event, emit) {
      _onCleanAvatarList();
    });
    on<EditDetailsCancelAvatarEdit>((event, emit) {
      _onCancelAvatarEdit();
    });
    on<EditDetailsUpdateDisplayName>((event, emit) {
      _onUpdateDisplayName(event.newName);
    });
    on<EditDetailsUpdatePassword>((event, emit) {
      _onUpdatePassword(
          email: event.email,
          password: event.password,
          newPassword: event.newPassword);
    });
    on<EditDetailsUpdateEmail>((event, emit) {
      _onUpdateEmail(
          email: event.email,
          password: event.password,
          newEmail: event.newEmail);
    });
    on<EditDetailsDeleteAccount>((event, emit) {
      _onDeleteAccount(email: event.email, password: event.password);
    });
  }

  void _onDeleteAccount(
      {required String email, required String password}) async {
    emit(EditDetailsLoading(
        avatar: state.avatar,
        avatarList: state.avatarList,
        authUser: state.authUser));
    try {
      await authRepository.reauthenticateAUser(email, password);
      await authRepository.deleteAllData(authUser: authUser);
      await authRepository.deleteUser();
      await authRepository.signOut();
      authRepository.addAuthUserToStream(null);
    } on Exception catch (e) {
      emit(EditDetailsError(
          avatar: state.avatar,
          avatarList: state.avatarList,
          authUser: state.authUser,
          authError: AuthError.from(e)));
    }
  }

  void _onUpdateEmail(
      {required String email,
      required String password,
      required String newEmail}) async {
    emit(EditDetailsLoading(
        avatar: state.avatar,
        avatarList: state.avatarList,
        authUser: state.authUser));
    try {
      await authRepository.reauthenticateAUser(email, password);
      await authRepository.updateEmail(newEmail: newEmail);
      AuthUserModel updatedUser = await authRepository.getLoggedUser();
      authRepository.addAuthUserToStream(updatedUser);
      emit(EditDetailsSuccess(
          avatar: state.avatar,
          avatarList: state.avatarList,
          authUser: updatedUser,
          settingsSuccess: SettingsSuccess.from('update-email')));
    } on Exception catch (e) {
      emit(EditDetailsError(
          avatar: state.avatar,
          avatarList: state.avatarList,
          authUser: state.authUser,
          authError: AuthError.from(e)));
    }
  }

  void _onUpdatePassword(
      {required String newPassword,
      required String password,
      required String email}) async {
    emit(EditDetailsLoading(
        avatar: state.avatar,
        avatarList: state.avatarList,
        authUser: state.authUser));
    try {
      await authRepository.reauthenticateAUser(email, password);
      await authRepository.updatePassword(newPassword: newPassword);
      emit(EditDetailsSuccess(
          avatar: state.avatar,
          avatarList: state.avatarList,
          authUser: state.authUser,
          settingsSuccess: SettingsSuccess.from('password-changed')));
    } on Exception catch (e) {
      emit(EditDetailsError(
          avatar: state.avatar,
          avatarList: state.avatarList,
          authUser: state.authUser,
          authError: AuthError.from(e)));
    }
  }

  void _onUpdateDisplayName(String newName) async {
    emit(EditDetailsLoading(
        avatar: state.avatar,
        avatarList: state.avatarList,
        authUser: state.authUser));
    try {
      AuthUserModel updatedAuthUser =
          await authRepository.updateAccountDetails(newName: newName);
      authRepository.addAuthUserToStream(updatedAuthUser);
      emit(EditDetailsSuccess(
          authUser: updatedAuthUser,
          avatar: state.avatar,
          avatarList: state.avatarList,
          settingsSuccess: SettingsSuccess.from('name-updated')));
    } on Exception catch (e) {
      emit(EditDetailsError(
          avatar: state.avatar,
          avatarList: state.avatarList,
          authUser: state.authUser,
          authError: AuthError.from(e)));
    }
  }

  void _onUpdateAvatar() async {
    emit(EditDetailsLoading(
        avatar: state.avatar,
        avatarList: state.avatarList,
        authUser: state.authUser));
    try {
      if (state.avatar is NetworkAvatar) {
        emit(EditDetailsIdle(
            avatar: state.avatar,
            avatarList: state.avatarList,
            authUser: state.authUser));
        return;
      }
      await avatarRepository.uploadAvatar(
          avatarModel: state.avatar, authUser: state.authUser);
      AvatarModel newAvatar = await avatarRepository.getUrlFromRemoteStorage(
          avatarModel: state.avatar, authUser: state.authUser);
      AuthUserModel updatedAuthUser =
          await authRepository.updateAccountDetails(avatar: newAvatar.url);
      AvatarList newAvatarList = AvatarList();
      newAvatarList.addNetworkAvatar(newAvatar.url);

      authRepository.addAuthUserToStream(updatedAuthUser);

      emit(EditDetailsSuccess(
          authUser: authUser,
          avatar: newAvatar,
          avatarList: newAvatarList,
          settingsSuccess:
              SettingsSuccess.from('avatar-changed-successfully')));
    } on FirebaseAuthException catch (e) {
      emit(EditDetailsError(
          authUser: authUser,
          avatar: avatar,
          avatarList: state.avatarList,
          authError: AuthError.from(e)));
    } on Exception catch (e) {
      emit(EditDetailsError(
          authUser: authUser,
          avatar: avatar,
          avatarList: state.avatarList,
          settingsError: SettingsError.from(e)));
    }
  }

  void _onUploadPhoto(String imagePath) {
    AvatarList avatarList = state.avatarList;
    avatarList.addCustomAvatar(imagePath, imagePath);
    AvatarModel newAvatar = avatarList.avatars.values.last;
    emit(EditDetailsIdle(
        avatar: newAvatar, avatarList: avatarList, authUser: authUser));
  }

  void _onCleanAvatarList() {
    AvatarModel currentAvatar = state.avatar;
    AvatarList currentAvatarList = state.avatarList;
    currentAvatarList.avatars.clear();
    currentAvatarList = AvatarList();

    if (currentAvatar.id == null ||
        !currentAvatarList.avatars.containsValue(currentAvatar)) {
      currentAvatarList.addNetworkAvatar(currentAvatar.url);
      currentAvatar = currentAvatarList.avatars.values.last;
    }
    emit(EditDetailsIdle(
        avatar: currentAvatar,
        avatarList: currentAvatarList,
        authUser: authUser));
  }

  void _onCancelAvatarEdit() {
    AvatarModel previusAvatar = state.avatarList.avatars.values.last;
    emit(EditDetailsIdle(
        avatar: previusAvatar,
        avatarList: state.avatarList,
        authUser: authUser));
  }

  void _onChangeAvatar(String avatarNavigation) {
    AvatarModel currentAvatar = state.avatar;
    AvatarList currentAvatarList = state.avatarList;

    int currentId = currentAvatar.id ?? 9;
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
