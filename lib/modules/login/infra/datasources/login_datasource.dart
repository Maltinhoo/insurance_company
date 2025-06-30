abstract class ILoginDatasource {
  Future<String> login(Map<String, dynamic> data);

  Future<String> getUser(String id);
}
