part of 'model.dart';

class TaskCategorySub extends Equatable {
  final int? id;
  final TaskCategory? taskCategory;
  final String? name;
  final List<dynamic>? element;
  final String? createdAt;
  final String? updatedAt;

  const TaskCategorySub({
    this.id,
    this.taskCategory,
    this.name,
    this.element,
    this.createdAt,
    this.updatedAt,
  });

  factory TaskCategorySub.fromJson(Map<String, dynamic> data) =>
      TaskCategorySub(
        id: data['id'],
        taskCategory: TaskCategory.fromJson(data['task_category']),
        element: data['element'],
        name: data['name'],
        createdAt: data['created_at'],
        updatedAt: data['updated_at'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        taskCategory,
        element,
        name,
        createdAt,
        updatedAt,
      ];
}

class TaskCategorySubElement extends Equatable {
  final dynamic data;

  const TaskCategorySubElement({this.data});

  factory TaskCategorySubElement.fromJson(Map<dynamic, dynamic> data) =>
      TaskCategorySubElement(
        data: data,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [data];
}
