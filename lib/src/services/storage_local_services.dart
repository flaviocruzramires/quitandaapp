import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quitandaapp/src/constants/storage_keys.dart';

class StorageLocalServices {
  final storage = const FlutterSecureStorage();

  Future<void> saveLocalData({
    required String key,
    required String value,
  }) async {
    await storage.write(key: StorageKeys.token, value: value);
  }

  Future<String?> getLocalData({
    required String key,
  }) async {
    return await storage.read(key: key);
  }

  Future<void> removeLocalData({
    required String key,
  }) async {
    await storage.delete(key: key);
  }
}
