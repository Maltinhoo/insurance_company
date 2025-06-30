import 'package:insurance_company/app_imports.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tokyo Marine Seguradora',
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouterSystem.router,
      theme: AppColors.theme,
      builder: (context, child) {
        return MainPageInit(child: child ?? const SizedBox());
      },
    );
  }
}
