import 'dart:convert';

import 'package:insurance_company/app_imports.dart';

class LoginRepositoryImp implements ILoginRepository {
  final ILoginDatasource _datasource;

  LoginRepositoryImp(this._datasource);
  @override
  Future<UserEntity> login({
    required String cpf,
    required String password,
  }) async {
    try {
      final response = await _datasource.login({
        'cpf': cpf,
        'password': password,
      });
      final user = UserMapper.fromMap(jsonDecode(response));

      return user;
    } catch (e) {
      if (e is IDefaultException) {
        throw LoginException(e, e.message, StackTrace.current);
      } else if (e is Exception) {
        throw LoginException(e, e.toString(), StackTrace.current);
      }
      throw LoginException(e, 'Error while logging in', StackTrace.current);
    }
  }

  @override
  Future<UserEntity> getUser(String id) async {
    try {
      final response = await _datasource.getUser(id);
      final user = UserMapper.fromMap(jsonDecode(response));
      return user;
    } catch (e) {
      if (e is IDefaultException) {
        throw LoginException(e, e.message, StackTrace.current);
      } else if (e is Exception) {
        throw LoginException(e, e.toString(), StackTrace.current);
      }
      throw LoginException(e, 'Error while fetching user', StackTrace.current);
    }
  }
}
