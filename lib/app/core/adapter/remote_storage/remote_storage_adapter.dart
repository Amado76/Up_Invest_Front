import 'dart:io' show File;

import 'package:firebase_storage/firebase_storage.dart';

sealed class IRemoteStorageAdapter {
  Future<void> uploadImage({
    required File file,
    required String userId,
    required String fileName,
  }) async {}
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
}
