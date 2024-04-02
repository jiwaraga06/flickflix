part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthStatus extends AuthState {
  final bool? isLogedin;

  AuthStatus({required this.isLogedin});
}

final class AuthLoginLoading extends AuthState {}

final class AuthLoginLoaded extends AuthState {
  final User? user;

  AuthLoginLoaded({required this.user});
}

final class AuthRegisterLoading extends AuthState {}

final class AuthRegisterLoaded extends AuthState {
  final User? user;

  AuthRegisterLoaded({required this.user});
}
