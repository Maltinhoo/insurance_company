import 'package:insurance_company/app_imports.dart';

class LoginException extends IDefaultException {
  LoginException([Object? exception, String? message, StackTrace? stackTrace])
    : super(
        message ?? 'An unknown error occurred, please try again later!',
        exception ?? Exception(),
        stackTrace,
      );
}
