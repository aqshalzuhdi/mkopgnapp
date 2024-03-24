part of 'model.dart';

class TaskExport extends Equatable {
  final int? id;
  final String? path;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  const TaskExport({
    this.id,
    this.path,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory TaskExport.fromJson(Map<String, dynamic> data) => TaskExport(
        id: data['id'],
        path: data['path'],
        status: data['status'],
        createdAt: data['created_at'],
        updatedAt: data['updated_at'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        path,
        status,
        createdAt,
        updatedAt,
      ];
}
