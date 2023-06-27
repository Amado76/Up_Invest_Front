import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/adapter/remote_storage/remote_storage_adapter.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/avatar_model_repository.dart';
import 'package:up_invest_front/app/modules/auth/util/asset_to_file.dart';

import '../../../../mocks/auth/model/auth_user_model_mock.dart';
import '../../../../mocks/core/adapter/remote_storage_mock.dart';

class LocalFileHelperMock extends Mock implements LocalFileHelper {}

void main() {
  group('[AvatarRepository]', () {
    late AuthUserModel authUserModel;
    late IRemoteStorageAdapter remoteStorageAdapterMock;
    late AvatarModel avatarModel;
    late AvatarModel standardAvatarModel;
    late AvatarRepository avatarRepository;
    late LocalFileHelperMock localFileHelperMock;
    setUp(() {
      remoteStorageAdapterMock = RemoteStorageAdapterMock();
      localFileHelperMock = LocalFileHelperMock();

      authUserModel = AuthUserModelMock();
      avatarModel = const CustomAvatar(id: 9, path: 'path', url: 'url');
      standardAvatarModel =
          const StandardAvatar(id: 1, path: 'path', url: 'url');
      avatarRepository = AvatarRepository(
          storageAdapter: remoteStorageAdapterMock,
          localFileHelper: localFileHelperMock);
    });

    group('[uploadAvatar]', () {
      final File myFile = File('teste');
      test(
          'Upload the CustomAvatar to the remote storage',
          () async => {
                // Arrange

                // registerFallbackValue(File('file')),
                when(() => remoteStorageAdapterMock.uploadImage(
                        file: myFile,
                        userId: any(named: 'userId'),
                        fileName: any(named: 'fileName')))
                    .thenAnswer((_) => Future.value(null)),
                when(() => localFileHelperMock.getImageFileFromAssets(any()))
                    .thenAnswer((_) => Future.value(myFile)),
                // Act
                await avatarRepository.uploadAvatar(
                    avatarModel: standardAvatarModel, authUser: authUserModel),

                // Assert
                verify(() => remoteStorageAdapterMock.uploadImage(
                    file: myFile,
                    userId: any(named: 'userId'),
                    fileName: any(named: 'fileName'))).called(1)
              });
      test(
          'Upload the CustomAvatar to the remote storage',
          () async => {
                // Arrange
                registerFallbackValue(File('file')),
                when(() => remoteStorageAdapterMock.uploadImage(
                        file: any(named: 'file'),
                        userId: any(named: 'userId'),
                        fileName: any(named: 'fileName')))
                    .thenAnswer((_) => Future.value(null)),
                // Act
                await avatarRepository.uploadAvatar(
                    avatarModel: avatarModel, authUser: authUserModel),

                // Assert
                verify(() => remoteStorageAdapterMock.uploadImage(
                    file: any(named: 'file'),
                    userId: any(named: 'userId'),
                    fileName: any(named: 'fileName'))).called(1)
              });
    });
    group('[getUrlFromRemoteStorage]', () {
      test('Get the Customavatar from UrL', () async {
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
