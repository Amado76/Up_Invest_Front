import 'dart:async';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/adapter/remote_storage/remote_storage_adapter.dart';

import '../../../../mocks/file_mock.dart';

class FirebaseStorageMock extends Mock implements FirebaseStorage {}

class UploadTaskMock extends Mock implements UploadTask {
  @override
  Future<S> then<S>(FutureOr<S> Function(TaskSnapshot p1) onValue,
      {Function? onError}) async {
    return Future.delayed(const Duration(milliseconds: 100), () {
      return onValue(TaskSnapshotMock()) as S;
    });
  }
}

class ReferenceMock extends Mock implements Reference {}

class TaskSnapshotMock extends Mock implements TaskSnapshot {}

void main() async {
  final firebaseStorageMock = FirebaseStorageMock();
  final remoteStorageAdapter =
      FirebaseStorageAdapter(storage: firebaseStorageMock);

  group('[uploadImage]', () {
    test('should call [putFile]', () async {
      final file = FileMock();
      const userId = 'userId';
      const fileName = 'fileName';
      final referenceMock = ReferenceMock();
      final uploadTaskMock = UploadTaskMock();
      when(() => firebaseStorageMock.ref(userId))
          .thenAnswer((_) => referenceMock);
      when(() => referenceMock.child(fileName))
          .thenAnswer((_) => referenceMock);
      when(() => referenceMock.putFile(file)).thenAnswer((_) => uploadTaskMock);

      await remoteStorageAdapter.uploadImage(
          file: file, userId: userId, fileName: fileName);
      verify(() => referenceMock.putFile(file));
    });
  });

  group('[getUrl]', () {
    test('should call [getDownloadURL]', () async {
      const userId = 'userId';
      const reference = 'reference';
      final referenceMock = ReferenceMock();
      when(() => firebaseStorageMock.ref(userId))
          .thenAnswer((_) => referenceMock);
      when(() => referenceMock.child(reference))
          .thenAnswer((_) => referenceMock);
      when(() => referenceMock.getDownloadURL())
          .thenAnswer((_) => Future.value('url'));

      await remoteStorageAdapter.getUrl(userId: userId, reference: reference);
      verify(() => referenceMock.getDownloadURL());
    });
  });

  group('deleteAllData', () {
    test('should call [delete]', () async {
      const userId = 'userId';
      final referenceMock = ReferenceMock();
      when(() => firebaseStorageMock.ref(userId))
          .thenAnswer((_) => referenceMock);
      when(() => referenceMock.delete()).thenAnswer((_) => Future.value());

      await remoteStorageAdapter.deleteAllData(userId: userId);
      verify(() => referenceMock.delete());
    });
  });
}
