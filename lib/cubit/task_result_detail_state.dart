part of 'task_result_detail_cubit.dart';

sealed class TaskResultDetailState extends Equatable {
  const TaskResultDetailState();

  @override
  List<Object> get props => [];
}

final class TaskResultDetailInitial extends TaskResultDetailState {}

class TaskResultDetailUnauthorized extends TaskResultDetailState {
  final bool unauthorized;

  TaskResultDetailUnauthorized(this.unauthorized);

  @override
  List<Object> get props => [unauthorized];
}

class TaskResultDetailSuccess extends TaskResultDetailState {
  final TaskResult taskResult;

  TaskResultDetailSuccess(this.taskResult);

  @override
  List<Object> get props => [taskResult];
}

class TaskResultDetailFailed extends TaskResultDetailState {
  final String message;

  TaskResultDetailFailed(this.message);

  @override
  List<Object> get props => [message];
}
