part of 'task_documentation_submit_cubit.dart';

sealed class TaskDocumentationSubmitState extends Equatable {
  const TaskDocumentationSubmitState();

  @override
  List<Object> get props => [];
}

final class TaskDocumentationSubmitInitial
    extends TaskDocumentationSubmitState {}

class TaskDocumentationSubmitUnauthorized extends TaskDocumentationSubmitState {
  final bool unauthorized;

  const TaskDocumentationSubmitUnauthorized(this.unauthorized);

  @override
  List<Object> get props => [unauthorized];
}

class TaskDocumentationSubmitSuccess extends TaskDocumentationSubmitState {
  final String message;

  const TaskDocumentationSubmitSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class TaskDocumentationSubmitFailed extends TaskDocumentationSubmitState {
  final String message;

  const TaskDocumentationSubmitFailed(this.message);

  @override
  List<Object> get props => [message];
}
