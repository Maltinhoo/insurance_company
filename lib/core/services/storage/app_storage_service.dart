abstract class AppStorage {
  String? read(String key);
  void save(String key, String value);
  void delete(String key);

  Future<void> setIsLogged();
  bool getIsLogged();

  Future<String> getUserId();
  Future<void> setUserId(String userId);

  Future<void> removeUserId();

  Future<void> clear();
}
