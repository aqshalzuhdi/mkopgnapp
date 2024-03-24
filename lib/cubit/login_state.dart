part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final Auth auth;

  LoginSuccess(this.auth);

  @override
  List<Object> get props => [auth];
}

class LoginFailed extends LoginState {
  final String message;
  final Map<String, dynamic> exception;

  LoginFailed(this.message, this.exception);

  @override
  List<Object> get props => [message, exception];
}
