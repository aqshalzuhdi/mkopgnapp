part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final User user;

  ProfileSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class ProfileFailed extends ProfileState {
  final String message;

  ProfileFailed(this.message);

  @override
  List<Object> get props => [message];
}

class ProfileUnauthorized extends ProfileState {
  final bool unauthorized;

  ProfileUnauthorized(this.unauthorized);

  @override
  List<Object> get props => [unauthorized];
}
