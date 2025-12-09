import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'secure_storage_manager.dart';

class SecureStorageManagerImplementation implements SecureStorageManager {
  final FlutterSecureStorage _flutterSecureStorage;

  SecureStorageManagerImplementation(this._flutterSecureStorage);

  @override
  Future clear() async {
    await _flutterSecureStorage.deleteAll();
  }

  @override
  Future removeValue({required String key}) async {
    await _flutterSecureStorage.delete(key: key);
  }

  @override
  Future<int?> getInt({required String key}) async {
    String? value = await _flutterSecureStorage.read(key: key);
    int? returnValue;
    try {
      if (value != null) returnValue = int.parse(value);
    } catch (error) {
      returnValue = null;
    }
    return returnValue;
  }

  @override
  Future saveInt({required String key, required int value}) async {
    await _flutterSecureStorage.write(key: key, value: value.toString());
  }

  @override
  Future<String?> getString({required String key}) async {
    String? value = await _flutterSecureStorage.read(key: key);
    return value;
  }

  @override
  Future saveString({required String key, required String value}) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }

  @override
  Future<bool?> getBool({required String key}) async {
    String? value = await _flutterSecureStorage.read(key: key);
    return value == '1';
  }

  @override
  Future<void> saveBool({required String key, required bool value}) async {
    await _flutterSecureStorage.write(key: key, value: value ? '1' : '0');
  }
}
