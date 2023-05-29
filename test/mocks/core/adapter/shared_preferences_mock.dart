import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:up_invest_front/app/core/adapter/local_storage_adapter/local_storage_adapter_interface.dart';

class LocalStorageAdapterMock extends Mock
    implements SharedPreferencesAdapter {}

class SharedPreferencesMock extends Mock implements SharedPreferences {}
