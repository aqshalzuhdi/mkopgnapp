part of 'task_documentation_cubit.dart';

sealed class TaskDocumentationState extends Equatable {
  const TaskDocumentationState();

  @override
  List<Object> get props => [];
}

final class TaskDocumentationInitial extends TaskDocumentationState {}

class TaskDocumentationUnauthorized extends TaskDocumentationState {
  final bool unauthorized;

  const TaskDocumentationUnauthorized(this.unauthorized);

  @override
  List<Object> get props => [unauthorized];
}

class TaskDocumentationSuccess extends TaskDocumentationState {
  final List<TaskDocumentation> taskDocumentation;

  const TaskDocumentationSuccess(this.taskDocumentation);

  @override
  List<Object> get props => [taskDocumentation];
}

class TaskDocumentationFailed extends TaskDocumentationState {
  final String message;

  const TaskDocumentationFailed(this.message);

  @override
  List<Object> get props => [message];
}
