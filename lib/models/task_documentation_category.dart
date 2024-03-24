part of 'model.dart';

class TaskDocumentationCategory extends Equatable {
  final int? id;
  final String? title;
  final String? key;
  final String? createdAt;
  final String? updatedAt;

  const TaskDocumentationCategory({
    this.id,
    this.title,
    this.key,
    this.createdAt,
    this.updatedAt,
  });

  factory TaskDocumentationCategory.fromJson(Map<String, dynamic> data) =>
      TaskDocumentationCategory(
        id: data['id'],
        title: data['title'],
        key: data['key'],
        createdAt: data['created_at'],
        updatedAt: data['updated_at'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        key,
        createdAt,
        updatedAt,
      ];
}
