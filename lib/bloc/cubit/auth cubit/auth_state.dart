part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

enum AuthMode {
  registration,
  login
}

class AuthInitial extends AuthState {}

class AuthSuccessful extends AuthState {
  String imagePath;
  AuthMode mode;

  AuthSuccessful({required this.imagePath, required this.mode});
}

class AuthError extends AuthState {
  String imagePath;
  AuthMode mode;

  AuthError({required this.imagePath, required this.mode});
}
