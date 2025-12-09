abstract class SecureStorageManager {
  Future saveString({required String key, required String value});

  Future saveInt({required String key, required int value});

  Future saveBool({required String key, required bool value});

  Future<String?> getString({required String key});

  Future<bool?> getBool({required String key});

  Future<int?> getInt({required String key});

  Future removeValue({required String key});

  Future clear();
}
