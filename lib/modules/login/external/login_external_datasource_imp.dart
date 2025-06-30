import 'dart:convert';

import 'package:insurance_company/app_imports.dart';

class LoginExternalDatasourceImp implements ILoginDatasource {
  final FirebaseFirestore firestore;
  final FirebaseAuth _auth;

  LoginExternalDatasourceImp(this.firestore, this._auth);
  @override
  Future<String> login(Map<String, dynamic> data) async {
    final String cpf = data['cpf'];
    final String password = data['password'] ?? '';

    if (cpf.isEmpty || password.isEmpty) {
      throw Exception('CPF e senha são obrigatórios');
    }

    try {
      final query = await firestore
          .collection('users')
          .where('cpf', isEqualTo: cpf)
          .limit(1)
          .get();

      if (query.docs.isEmpty) {
        throw LoginException(Exception(), 'CPF não encontrado');
      }

      final doc = query.docs.first;
      final String email = doc.data()['email'] ?? '';

      await _auth.signInWithEmailAndPassword(email: email, password: password);

      return jsonEncode(doc.data());
    } on FirebaseAuthException catch (e) {
      throw LoginException(e.message);
    } catch (e) {
      debugPrint('Erro no login: $e');
      rethrow;
    }
  }

  @override
  Future<String> getUser(String id) async {
    try {
      final doc = await firestore.collection('users').doc(id).get();
      if (!doc.exists) {
        throw LoginException(Exception(), 'Usuário não encontrado');
      }
      return jsonEncode(doc.data());
    } catch (e) {
      debugPrint('Erro ao buscar usuário: $e');
      throw LoginException(e, 'Erro ao buscar usuário');
    }
  }
}
