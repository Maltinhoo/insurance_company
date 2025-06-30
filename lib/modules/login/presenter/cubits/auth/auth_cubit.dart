import 'dart:developer';

import 'package:insurance_company/app_imports.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final ILoginRepository _iLoginRepository;
  final AppStorage _storage;
  AuthCubit(this._iLoginRepository, this._storage) : super(AuthInitial());

  UserEntity? user;

  Future<void> initUser(String userId) async {
    try {
      if (state is AuthSuccess) return;
      emit(AuthLoading());
      user = await _iLoginRepository.getUser(userId);
      emit(AuthSuccess(user!));
    } catch (e) {
      log(e.toString());
      emit(AuthError(e.toString()));
    }
  }

  Future<void> updateUser(UserEntity newUser) async {
    user = newUser;
    emit(AuthSuccess(user!));
  }

  Future<void> updateExternalUser() async {
    user = await _iLoginRepository.getUser(user!.id);
    emit(AuthSuccess(user!));
  }

  Future<void> signOut() async {
    try {
      await ServiceLocator.locator<AppStorage>().clear();
      await ServiceLocator.resetAllInstances();
      user = null;
      emit(SignedOutSuccess());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> restore() async {
    try {
      final userId = await _storage.getUserId();
      if (userId.isEmpty) {
        emit(AuthInitial());
        return;
      }
      await initUser(userId);
      if (user != null) {
        emit(AuthSuccess(user!));
      } else {
        emit(AuthInitial());
      }
    } catch (e) {
      log('Erro ao restaurar usuário: $e');
    }
  }
}
