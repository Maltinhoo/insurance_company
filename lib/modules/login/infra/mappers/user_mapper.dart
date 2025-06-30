import 'package:insurance_company/app_imports.dart';

class UserMapper {
  static UserEntity fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'],
      cpf: map['cpf'],
      imageUrl: map['imageUrl'],
      name: map['name'],
    );
  }
}
