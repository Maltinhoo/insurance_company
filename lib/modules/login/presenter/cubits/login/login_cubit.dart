import 'package:insurance_company/app_imports.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ILoginRepository _loginRepository;
  final AuthCubit _authCubit;
  final AppStorage _appStorage;
  LoginCubit(this._loginRepository, this._authCubit, this._appStorage)
    : super(LoginInitial());

  Future<void> login({
    required String cpf,
    password,
    required bool keepLogged,
  }) async {
    emit(LoginLoading());
    try {
      final user = await _loginRepository.login(cpf: cpf, password: password);
      if (keepLogged) {
        await _appStorage.setIsLogged();
        await _appStorage.setUserId(user.id);
      } else {
        await _appStorage.clear();
      }
      await _authCubit.initUser(user.id);

      emit(LoginSuccess(user));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
