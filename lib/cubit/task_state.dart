part of 'task_cubit.dart';

sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

final class TaskInitial extends TaskState {}

class TaskUnauthorized extends TaskState {
  final bool unauthorized;

  const TaskUnauthorized(this.unauthorized);

  @override
  List<Object> get props => [unauthorized];
}

class TaskSuccess extends TaskState {
  final List<Task> task;

  const TaskSuccess(this.task);

  @override
  List<Object> get props => [task];
}

class TaskFailed extends TaskState {
  final String message;
  final Map<String, dynamic> exception;

  const TaskFailed(this.message, this.exception);

  @override
  List<Object> get props => [message, exception];
}
