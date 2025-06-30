part of 'splash_cubit.dart';

abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashLoaded extends SplashState {}

class UserLoggedIn extends SplashState {
  UserLoggedIn();
}

class SplashError extends SplashState {
  final String error;

  SplashError(this.error);
}
