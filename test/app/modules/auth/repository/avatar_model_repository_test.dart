import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/core/adapter/remote_storage/remote_storage_adapter.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/avatar_model_repository.dart';

import '../../../../mocks/auth/model/auth_user_model_mock.dart';
import '../../../../mocks/core/adapter/remote_storage_mock.dart';

void main() {
  group('[AvatarRepository]', () {
    late AuthUserModel authUserModel;
    late IRemoteStorageAdapter remoteStorageAdapterMock;
    late AvatarModel avatarModel;
    late AvatarRepository avatarRepository;
    setUp(() {
      remoteStorageAdapterMock = RemoteStorageAdapterMock();
      authUserModel = AuthUserModelMock();
      avatarModel = const CustomAvatar(id: 9, path: 'path', url: 'url');
      avatarRepository =
          AvatarRepository(storageAdapter: remoteStorageAdapterMock);
    });

    group('[uploadAvatar]', () {
      test(
          ']',
          () async => {
                //Act
                await avatarRepository.uploadAvatar(
                    avatarModel: avatarModel, authUser: authUserModel),
              });
    });
    group('[getUrlFromRemoteStorage]', () {
      test('teste', () async {
        // Arrange

        // Act
        final AvatarModel newAvatar =
            await avatarRepository.getUrlFromRemoteStorage(
          avatarModel: avatarModel,
          authUser: authUserModel,
        );

        // Assert
        expect(newAvatar, const CustomAvatar(id: 9, path: 'path', url: 'done'));
      });
    });
  });
}
