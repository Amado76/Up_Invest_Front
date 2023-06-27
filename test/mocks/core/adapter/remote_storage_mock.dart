import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/adapter/remote_storage/remote_storage_adapter.dart';

class RemoteStorageAdapterMock extends Mock implements FirebaseStorageAdapter {
  @override
  Future<String> getUrl(
      {required String userId, required String reference}) async {
    return 'done';
  }
}
