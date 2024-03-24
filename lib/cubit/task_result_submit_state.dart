part of 'task_result_submit_cubit.dart';

sealed class TaskResultSubmitState extends Equatable {
  const TaskResultSubmitState();

  @override
  List<Object> get props => [];
}

final class TaskResultSubmitInitial extends TaskResultSubmitState {}

class TaskResultSubmitUnauthorized extends TaskResultSubmitState {
  final bool unauthorized;

  TaskResultSubmitUnauthorized(this.unauthorized);

  @override
  List<Object> get props => [unauthorized];
}

class TaskResultSubmitSuccess extends TaskResultSubmitState {
  final String message;

  const TaskResultSubmitSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class TaskResultSubmitFailed extends TaskResultSubmitState {
  final String message;

  TaskResultSubmitFailed(this.message);

  @override
  List<Object> get props => [message];
}
