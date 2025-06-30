import 'package:insurance_company/app_imports.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AppStorage appStorage;
  final AuthCubit _authCubit;
  SplashCubit(this.appStorage, this._authCubit) : super(SplashInitial());

  Future<void> initialize() async {
    try {
      emit(SplashLoading());

      await Future.delayed(const Duration(seconds: 3));
      final isLogged = appStorage.getIsLogged();
      if (isLogged) {
        final userId = await appStorage.getUserId();

        await _authCubit.initUser(userId);
        emit(UserLoggedIn());
        return;
      }

      emit(SplashLoaded());
    } catch (e) {
      emit(SplashError(e.toString()));
    }
  }
}
