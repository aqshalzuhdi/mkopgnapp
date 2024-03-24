part of 'model.dart';

class TaskCategory extends Equatable {
  final int? id;
  final String? name;
  final String? key;
  final String? createdAt;
  final String? updatedAt;

  const TaskCategory({
    this.id,
    this.name,
    this.key,
    this.createdAt,
    this.updatedAt,
  });

  factory TaskCategory.fromJson(Map<String, dynamic> data) => TaskCategory(
        id: data['id'],
        name: data['name'],
        key: data['key'],
        createdAt: data['created_at'],
        updatedAt: data['updated_at'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, key, createdAt, updatedAt];
}

// class TaskSubCategory extends Equatable {
//   final int? id;
//   final TaskCategory? taskCategory;
//   final String? name;
//   final String? createdAt;
//   final String? updatedAt;

//   const TaskSubCategory({
//     this.id,
//     this.taskCategory,
//     this.name,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory TaskSubCategory.fromJson(Map<String, dynamic> data) => TaskSubCategory(
//         id: data['id'],
//         taskCategory: data['task_category'],
//         name: data['name'],
//         createdAt: data['created_at'],
//         updatedAt: data['updated_at'],
//       );

//   @override
//   // TODO: implement props
//   List<Object?> get props => [
//         id,
//         taskCategory,
//         name,
//         createdAt,
//         updatedAt,
//       ];
// }
