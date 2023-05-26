import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/adapter/local_storage_adapter/local_storage_adapter_interface.dart';
import 'package:up_invest_front/app/modules/settings/repository/settings_repository.dart';

class SettingsRepositoryMock extends Mock implements SettingsRepository {
  final SharedPreferencesAdapter sharedPreferencesAdapterMock;
  SettingsRepositoryMock(this.sharedPreferencesAdapterMock);

  // @override
  // Future<void> saveSettingsToLocalStorage(SettingsModel settingsModel) async {}
}
