import 'package:shared_preferences/shared_preferences.dart';

sealed class ILocalStorageAdapter {
  Future<void> saveStringToLocalStorage(String key, String value);
  Future<String?> readStringFromLocalStorage(String key);
}

class SharedPreferencesAdapter extends ILocalStorageAdapter {
  late SharedPreferences sharedPreferences;

  @override
  Future<String?> readStringFromLocalStorage(String key) async {
    sharedPreferences = await SharedPreferences.getInstance();
    String? fetchedString = sharedPreferences.getString(key);
    return fetchedString;
  }

  @override
  Future<void> saveStringToLocalStorage(String key, String value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(key, value);
  }
}
