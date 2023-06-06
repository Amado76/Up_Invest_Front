import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/adapter/remote_storage/remote_storage_adapter.dart';
import 'package:up_invest_front/app/modules/auth/repository/avatar_model_repository.dart';

class AvatarRepositoryMock extends Mock implements AvatarRepository {
  @override
  final IRemoteStorageAdapter storageAdapter;

  AvatarRepositoryMock({required this.storageAdapter});
}
