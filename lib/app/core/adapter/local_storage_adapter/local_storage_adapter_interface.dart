import 'package:shared_preferences/shared_preferences.dart';

sealed class ILocalStorageAdapter {
  Future<void> saveStringToLocalStorage(String key, String value);
  Future<String?> readStringFromLocalStorage(String key);
}

class SharedPreferencesAdapter extends ILocalStorageAdapter {
  @override
  Future<String?> readStringFromLocalStorage(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? fetchedString = sharedPreferences.getString(key);
    return fetchedString;
  }

  @override
  Future<void> saveStringToLocalStorage(String key, String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool result = await sharedPreferences.setString(key, value);
    if (result == false) {
      throw Exception('error-on-save');
    }
  }
}
