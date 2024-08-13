import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tictactoe/core/constant/enum/storage_enum.dart';

class StorageManager {
  static final StorageManager _instance = StorageManager._init();
  static StorageManager get instance => _instance;

  FlutterSecureStorage? _preferences;
  StorageManager._init() {
    _preferences = const FlutterSecureStorage();
  }

  Future<void> clearValue(StorageEnum key) async {
    await _preferences?.delete(key: key.name);
  }

  Future<void> clearAll() async {
    await _preferences?.deleteAll();
  }

  Future<void> setStringValue(StorageEnum key, String value) async {
    await _preferences?.write(
      key: key.name,
      value: value,
      aOptions: const AndroidOptions(
        encryptedSharedPreferences: false,
      ),
    );
  }

  Future<String?> getStringValue(StorageEnum key) async =>
      await _preferences?.read(
        key: key.name,
        aOptions: const AndroidOptions(
          encryptedSharedPreferences: false,
        ),
      );

  Future<bool> checkStringValue(StorageEnum key) async => await _preferences?.containsKey(key: key.name) ?? false;
}