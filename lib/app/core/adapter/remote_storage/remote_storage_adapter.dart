import 'dart:io' show File;

import 'package:firebase_storage/firebase_storage.dart';

sealed class IRemoteStorageAdapter {
  Future<void> uploadImage({
    required File file,
    required String userId,
    required String fileName,
  });

  Future<String> getUrl({required String userId, required String reference});
}

class FirebaseStorageAdapter extends IRemoteStorageAdapter {
  final FirebaseStorage storage;

  FirebaseStorageAdapter({required this.storage});

  @override
  Future<void> uploadImage({
    required File file,
    required String userId,
    required String fileName,
  }) async {
    await storage.ref(userId).child(fileName).putFile(file);
  }

  @override
  Future<String> getUrl(
      {required String userId, required String reference}) async {
    return storage.ref(userId).child(reference).getDownloadURL();
  }
}
