part of 'task_detail_cubit.dart';

sealed class TaskDetailState extends Equatable {
  const TaskDetailState();

  @override
  List<Object> get props => [];
}

final class TaskDetailInitial extends TaskDetailState {}

class TaskDetailSuccess extends TaskDetailState {
  final Task task;

  TaskDetailSuccess(this.task);

  @override
  List<Object> get props => [task];
}

class TaskDetailFailed extends TaskDetailState {
  final String message;

  TaskDetailFailed(this.message);

  @override
  List<Object> get props => [message];
}

class TaskDetailUnauthorized extends TaskDetailState {
  final bool unauthorized;

  TaskDetailUnauthorized(this.unauthorized);

  @override
  List<Object> get props => [unauthorized];
}
