part of 'refresh_token_cubit.dart';

sealed class RefreshTokenState extends Equatable {
  const RefreshTokenState();

  @override
  List<Object> get props => [];
}

final class RefreshTokenInitial extends RefreshTokenState {}

class RefreshTokenSuccess extends RefreshTokenState {
  final Auth auth;

  RefreshTokenSuccess(this.auth);

  @override
  List<Object> get props => [auth];
}

class RefreshTokenFailed extends RefreshTokenState {
  final String message;

  RefreshTokenFailed(this.message);

  @override
  List<Object> get props => [message];
}

class RefreshTokenUnauthorized extends RefreshTokenState {
  final bool unauthorized;

  RefreshTokenUnauthorized(this.unauthorized);

  @override
  List<Object> get props => [unauthorized];
}
