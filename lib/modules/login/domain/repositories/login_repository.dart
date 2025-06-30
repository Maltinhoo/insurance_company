import 'package:insurance_company/app_imports.dart';

abstract class ILoginRepository {
  Future<UserEntity> login({required String cpf, required String password});

  Future<UserEntity> getUser(String id);
}
