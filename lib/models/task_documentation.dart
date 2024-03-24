part of 'model.dart';

class TaskDocumentation extends Equatable {
  final int? id;
  final int? taskId;
  final TaskDocumentationCategory? taskDocumentationCategory;
  final String? value;
  final String? path;
  final String? createdAt;
  final String? updatedAt;

  const TaskDocumentation({
    this.id,
    this.taskId,
    this.taskDocumentationCategory,
    this.value,
    this.path,
    this.createdAt,
    this.updatedAt,
  });

  factory TaskDocumentation.fromJson(Map<String, dynamic> data) =>
      TaskDocumentation(
        id: data['id'],
        taskId: data['task_id'],
        taskDocumentationCategory: TaskDocumentationCategory.fromJson(
            data['task_documentation_category']),
        value: data['value'],
        path: data['path'],
        createdAt: data['created_at'],
        updatedAt: data['updated_at'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        taskId,
        taskDocumentationCategory,
        value,
        path,
        createdAt,
        updatedAt,
      ];
}
