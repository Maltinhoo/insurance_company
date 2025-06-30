import 'package:flutter/foundation.dart';
import 'package:insurance_company/app_imports.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WebViewPlatform.instance = WebWebViewPlatform();
  await ServiceLocator.setupServiceLocator();
  if (kIsWeb) await ServiceLocator.locator<AuthCubit>().restore();
  runApp(const MyApp());
}
