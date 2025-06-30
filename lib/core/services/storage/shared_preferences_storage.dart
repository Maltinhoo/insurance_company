import 'package:insurance_company/app_imports.dart';

class SharedPreferencesStorage implements AppStorage {
  final SharedPreferences _storage;

  SharedPreferencesStorage(this._storage);

  @override
  void delete(String key) async {
    _storage.remove(key);
  }

  @override
  void save(String key, String value) async {
    _storage.setString(key, value);
  }

  @override
  String? read(String key) {
    return _storage.getString(key);
  }

  @override
  Future<void> clear() async {
    await _storage.clear();
  }

  @override
  bool getIsLogged() {
    return _storage.getBool('isLogged') ?? false;
  }

  @override
  Future<void> setIsLogged() async {
    await _storage.setBool('isLogged', true);
  }

  @override
  Future<String> getUserId() async {
    return _storage.getString('userId') ?? '';
  }

  @override
  Future<void> removeUserId() async {
    await _storage.remove('userId');
  }

  @override
  Future<void> setUserId(String userId) async {
    await _storage.setString('userId', userId);
  }
}
