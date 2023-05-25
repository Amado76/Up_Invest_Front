sealed class ILocalStorageAdapter {
  Future<void> saveStringToLocalStorage(String key, String data);
  Future<String?> readStringFromLocalStorage(String key);
}

class LocalStorageAdapter extends ILocalStorageAdapter {
  @override
  Future<String?> readStringFromLocalStorage(String key) {
    // TODO: implement readStringFromLocalStorage
    throw UnimplementedError();
  }

  @override
  Future<void> saveStringToLocalStorage(String key, String data) {
    // TODO: implement saveStringToLocalStorage
    throw UnimplementedError();
  }
}
