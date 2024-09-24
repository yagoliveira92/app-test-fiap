abstract class SecureStorageService {
  Future<void> delete(String key);
  Future<String?> read(String key);
  Future<void> write(String key, String value);
  Future<bool> check(String key);
}
