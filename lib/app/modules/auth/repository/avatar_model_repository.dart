import 'dart:io' show File;

import 'package:up_invest_front/app/core/adapter/remote_storage/remote_storage_adapter.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_model.dart';
import 'package:up_invest_front/app/modules/auth/util/asset_to_file.dart';

sealed class IAvatarRepository {
  final IRemoteStorageAdapter storageAdapter;
  final LocalFileHelper localFileHelper;
  Future<void> uploadAvatar(
      {required AvatarModel avatarModel, required AuthUserModel authUser});

  Future<AvatarModel> getUrlFromRemoteStorage(
      {required AvatarModel avatarModel, required AuthUserModel authUser});

  IAvatarRepository(
      {required this.storageAdapter, required this.localFileHelper});
}

class AvatarRepository extends IAvatarRepository {
  AvatarRepository(
      {required super.storageAdapter, required super.localFileHelper});

  @override
  Future<void> uploadAvatar(
      {required AvatarModel avatarModel,
      required AuthUserModel authUser}) async {
    late File file;
    if (avatarModel is StandardAvatar) {
      file = await localFileHelper.getImageFileFromAssets(avatarModel.path);
    }
    if (avatarModel is CustomAvatar) {
      file = File(avatarModel.path);
    }
    String userId = authUser.userId;
    String fileName = 'avatar.jpg';

    await storageAdapter.uploadImage(
        file: file, userId: userId, fileName: fileName);
  }

  @override
  Future<AvatarModel> getUrlFromRemoteStorage(
      {required AvatarModel avatarModel,
      required AuthUserModel authUser}) async {
    String url = await storageAdapter.getUrl(
        userId: authUser.userId, reference: 'avatar.jpg');
    AvatarModel newAvatarModel =
        CustomAvatar(id: avatarModel.id, path: avatarModel.path, url: url);

    return newAvatarModel;
  }
}
