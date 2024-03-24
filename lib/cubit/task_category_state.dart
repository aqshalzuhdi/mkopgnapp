part of 'task_category_cubit.dart';

sealed class TaskCategoryState extends Equatable {
  const TaskCategoryState();

  @override
  List<Object> get props => [];
}

final class TaskCategoryInitial extends TaskCategoryState {}

class TaskCategoryUnauthorized extends TaskCategoryState {
  final bool unauthorized;

  const TaskCategoryUnauthorized(this.unauthorized);

  @override
  List<Object> get props => [unauthorized];
}

class TaskCategorySuccess extends TaskCategoryState {
  final List<TaskCategory> taskCategory;

  const TaskCategorySuccess(this.taskCategory);

  @override
  List<Object> get props => [taskCategory];
}

class TaskCategoryFailed extends TaskCategoryState {
  final String message;

  const TaskCategoryFailed(this.message);

  @override
  List<Object> get props => [message];
}
