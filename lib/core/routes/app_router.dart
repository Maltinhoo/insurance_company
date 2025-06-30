import 'package:flutter/foundation.dart';
import 'package:insurance_company/app_imports.dart';

class GoRouterSystem {
  const GoRouterSystem._();

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');
  static final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  static BuildContext? get ctx =>
      router.routerDelegate.navigatorKey.currentContext;

  static const String initialRoutePath = SplashPage.name;

  static GoRouter router = GoRouter(
    initialLocation: initialRoutePath,
    debugLogDiagnostics: kDebugMode,
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: SplashPage.name,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: LoginPage.name,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: HomePage.name,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: WebViewPage.name,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>?;
          return WebViewPage(url: args?['url'] ?? '');
        },
      ),
    ],
    redirect: (context, state) {
      final authCubit = ServiceLocator.locator<AuthCubit>();
      final isLoggedIn = authCubit.user != null;

      final isSplash = state.fullPath == SplashPage.name;
      final isLogin = state.fullPath == LoginPage.name;

      if (!isLoggedIn && !isSplash && !isLogin) {
        return SplashPage.name;
      }

      if (isLoggedIn && (isSplash || isLogin)) {
        return HomePage.name;
      }

      return null;
    },
  );
}
