part of 'total_cubit.dart';

sealed class TotalState extends Equatable {
  const TotalState();

  @override
  List<Object> get props => [];
}

final class TotalInitial extends TotalState {}

class TotalSuccess extends TotalState {
  final Total total;

  TotalSuccess(this.total);

  @override
  List<Object> get props => [total];
}

class TotalFailed extends TotalState {
  final String message;

  TotalFailed(this.message);

  @override
  List<Object> get props => [message];
}

class TotalUnauthorized extends TotalState {
  final bool unauthorized;

  TotalUnauthorized(this.unauthorized);

  @override
  List<Object> get props => [unauthorized];
}
