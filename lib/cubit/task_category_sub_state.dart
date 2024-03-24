part of 'task_category_sub_cubit.dart';

sealed class TaskCategorySubState extends Equatable {
  const TaskCategorySubState();

  @override
  List<Object> get props => [];
}

final class TaskCategorySubInitial extends TaskCategorySubState {}

class TaskCategorySubUnauthorized extends TaskCategorySubState {
  final bool unauthorized;

  const TaskCategorySubUnauthorized(this.unauthorized);

  @override
  List<Object> get props => [unauthorized];
}

class TaskCategorySubSuccess extends TaskCategorySubState {
  final List<TaskCategorySub> taskCategorySub;

  const TaskCategorySubSuccess(this.taskCategorySub);

  @override
  List<Object> get props => [taskCategorySub];
}

class TaskCategorySubFailed extends TaskCategorySubState {
  final String message;

  const TaskCategorySubFailed(this.message);

  @override
  List<Object> get props => [message];
}
