part of 'task_result_cubit.dart';

sealed class TaskResultState extends Equatable {
  const TaskResultState();

  @override
  List<Object> get props => [];
}

final class TaskResultInitial extends TaskResultState {}

class TaskResultUnauthorized extends TaskResultState {
  final bool unauthorized;

  TaskResultUnauthorized(this.unauthorized);

  @override
  List<Object> get props => [unauthorized];
}

class TaskResultSuccess extends TaskResultState {
  final List<TaskResult> taskResult;

  TaskResultSuccess(this.taskResult);

  @override
  List<Object> get props => [taskResult];
}

class TaskResultFailed extends TaskResultState {
  final String message;

  TaskResultFailed(this.message);

  @override
  List<Object> get props => [message];
}
