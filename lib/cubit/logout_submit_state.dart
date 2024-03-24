part of 'logout_submit_cubit.dart';

sealed class LogoutSubmitState extends Equatable {
  const LogoutSubmitState();

  @override
  List<Object> get props => [];
}

final class LogoutSubmitInitial extends LogoutSubmitState {}

class LogoutSubmitSuccess extends LogoutSubmitState {
  final String message;

  LogoutSubmitSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class LogoutSubmitFailed extends LogoutSubmitState {
  final String message;
  final Map<String, dynamic> exception;

  LogoutSubmitFailed(this.message, this.exception);

  @override
  List<Object> get props => [message, exception];
}
