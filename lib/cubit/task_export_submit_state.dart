part of 'task_export_submit_cubit.dart';

sealed class TaskExportSubmitState extends Equatable {
  const TaskExportSubmitState();

  @override
  List<Object> get props => [];
}

final class TaskExportSubmitInitial extends TaskExportSubmitState {}

class TaskExportSubmitUnauthorized extends TaskExportSubmitState {
  final bool unauthorized;

  const TaskExportSubmitUnauthorized(this.unauthorized);

  @override
  List<Object> get props => [unauthorized];
}

class TaskExportSubmitSuccess extends TaskExportSubmitState {
  final String message;

  const TaskExportSubmitSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class TaskExportSubmitFailed extends TaskExportSubmitState {
  final String message;

  const TaskExportSubmitFailed(this.message);

  @override
  List<Object> get props => [message];
}
