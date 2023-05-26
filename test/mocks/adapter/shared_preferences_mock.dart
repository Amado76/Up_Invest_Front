import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/adapter/local_storage_adapter/local_storage_adapter_interface.dart';

class LocalStorageAdapterMock extends Mock
    implements SharedPreferencesAdapter {}
