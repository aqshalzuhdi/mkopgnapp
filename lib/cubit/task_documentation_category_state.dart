part of 'task_documentation_category_cubit.dart';

sealed class TaskDocumentationCategoryState extends Equatable {
  const TaskDocumentationCategoryState();

  @override
  List<Object> get props => [];
}

final class TaskDocumentationCategoryInitial
    extends TaskDocumentationCategoryState {}

class TaskDocumentationCategoryUnauthorized
    extends TaskDocumentationCategoryState {
  final bool unauthorized;

  const TaskDocumentationCategoryUnauthorized(this.unauthorized);

  @override
  List<Object> get props => [unauthorized];
}

class TaskDocumentationCategorySuccess extends TaskDocumentationCategoryState {
  final List<TaskDocumentationCategory> taskDocumentationCategory;

  const TaskDocumentationCategorySuccess(this.taskDocumentationCategory);

  @override
  List<Object> get props => [taskDocumentationCategory];
}

class TaskDocumentationCategoryFailed extends TaskDocumentationCategoryState {
  final String message;

  const TaskDocumentationCategoryFailed(this.message);

  @override
  List<Object> get props => [message];
}
