import 'package:insurance_company/app_imports.dart';

class AppColors {
  AppColors._();

  static const primaryDark = Color(0xff1A1D27);
  static const primaryLight = Color(0xff242B34);

  static const secondary = Color(0xff14C1A8);

  static const white = Color.fromRGBO(255, 255, 255, 1.0);
  static const gray = Color.fromRGBO(197, 207, 221, 1);
  static const lightSilver = Color(0xffE0E0E0);

  static const black = Color.fromARGB(255, 0, 0, 0);

  static const inputBorder = Color(0xffCCCCCC);
  static const inputFill = Color(0xffF3F3F3);

  static const label = Color.fromARGB(255, 247, 245, 245);

  static const success = Color(0xFF62A81C);
  static const alert = Color(0xFFDDD03C);
  static const danger = Color(0xFFFF3535);

  static const transparent = Colors.transparent;

  static const bgGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFF009074), Color(0xFFcbd68e)],
  );

  static const buttonGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF009074), Color(0xFFcbd68e)],
  );

  static final theme = ThemeData(
    useMaterial3: true,
    fontFamily: FontFamily.roboto.family,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryDark,
      surface: AppColors.primaryDark,
      brightness: Brightness.dark,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: Colors.white, height: 1.2),
      displayMedium: TextStyle(color: Colors.white, height: 1.2),
      displaySmall: TextStyle(color: Colors.white, height: 1.2),
      headlineLarge: TextStyle(color: Colors.white, height: 1.2),
      headlineMedium: TextStyle(color: Colors.white, height: 1.2),
      headlineSmall: TextStyle(color: Colors.white, height: 1.2),
      titleLarge: TextStyle(color: Colors.white, height: 1.2),
      titleMedium: TextStyle(color: Colors.white, height: 1.2),
      titleSmall: TextStyle(color: Colors.white, height: 1.2),
      bodyLarge: TextStyle(color: Colors.white, height: 1.2),
      bodyMedium: TextStyle(color: Colors.white, height: 1.2),
      bodySmall: TextStyle(color: Colors.white, height: 1.2),
      labelLarge: TextStyle(color: Colors.white, height: 1.2),
      labelMedium: TextStyle(color: Colors.white, height: 1.2),
      labelSmall: TextStyle(color: Colors.white, height: 1.2),
    ),
  );
}
