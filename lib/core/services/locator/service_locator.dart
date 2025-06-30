import 'package:insurance_company/app_imports.dart';

class ServiceLocator {
  ServiceLocator._();

  static GetIt get locator => GetIt.instance;
  static Future<void> setupServiceLocator() async {
    await _registerBaseServices();
    await _registerInfra();
    await _registerExternal();
    await _registerPresenter();
  }

  static Future<void> _registerBaseServices() async {
    final prefs = await SharedPreferences.getInstance();

    GetIt.I.registerLazySingleton(() => prefs);
    GetIt.I.registerLazySingleton<AppStorage>(
      () => SharedPreferencesStorage(prefs),
    );
    GetIt.I.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
    GetIt.I.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    );
  }

  static Future<void> _registerInfra() async {
    GetIt.I.registerLazySingleton<ILoginRepository>(
      () => LoginRepositoryImp(locator()),
    );
  }

  static Future<void> _registerExternal() async {
    GetIt.I.registerLazySingleton<ILoginDatasource>(
      () => LoginExternalDatasourceImp(locator(), locator()),
    );
  }

  static Future<void> _registerPresenter() async {
    GetIt.I.registerFactory<SplashCubit>(
      () => SplashCubit(locator(), locator()),
    );
    GetIt.I.registerLazySingleton<AuthCubit>(
      () => AuthCubit(locator(), locator()),
    );
    GetIt.I.registerFactory(() => LoginCubit(locator(), locator(), locator()));
  }

  static Future<void> resetAllInstances() async {
    await locator.reset();
    await setupServiceLocator();
  }
}
