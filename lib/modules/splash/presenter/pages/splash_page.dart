import 'package:insurance_company/app_imports.dart';

class SplashPage extends StatelessWidget {
  static const String name = "/";
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            ServiceLocator.locator<SplashCubit>()..initialize(),
        child: BlocConsumer<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is SplashLoaded) {
              context.go(LoginPage.name);
            } else if (state is UserLoggedIn) {
              context.go(HomePage.name);
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Center(
                child: Vector(Vectors.tokiomarine, color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}
