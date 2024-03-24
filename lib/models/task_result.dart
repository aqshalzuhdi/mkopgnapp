part of 'model.dart';

class TaskResult extends Equatable {
  final int? id;
  final Task? task;
  final TaskCategorySub? taskDetail;
  final String? value;
  final String? valueText;
  final String? createdAt;
  final String? updatedAt;

  const TaskResult({
    this.id,
    this.task,
    this.taskDetail,
    this.value,
    this.valueText,
    this.createdAt,
    this.updatedAt,
  });

  factory TaskResult.fromJson(Map<String, dynamic> data) => TaskResult(
        id: data['id'],
        task: Task.fromJson(data['task']),
        taskDetail: TaskCategorySub.fromJson(data['task_detail']),
        value: data['value'],
        valueText: data['value_text'],
        createdAt: data['created_at'],
        updatedAt: data['updated_at'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        task,
        taskDetail,
        value,
        valueText,
        createdAt,
        updatedAt,
      ];
}

// "task_detail": {
//     "id": 2,
//     "task_category_id": 1,
//     "name": "Modul AMR 2",
//     "created_at": "2023-08-08T01:23:22.000000Z",
//     "updated_at": "2023-08-08T01:23:22.000000Z",
//     "task_category": {
//         "id": 1,
//         "name": "Pemeriksaan Kelengkapan AMR",
//         "created_at": "2023-08-07T13:46:12.000000Z",
//         "updated_at": "2023-08-07T13:46:12.000000Z"
//     }
// },

class TaskResultSubmit extends Equatable {
  // final bool? status;
  // final String? taskDetailId;
  final String? message;

  const TaskResultSubmit({
    // this.status,
    // this.taskDetailId,
    this.message,
  });

  factory TaskResultSubmit.fromJson(Map<String, dynamic> data) =>
      TaskResultSubmit(
        // status: data['status'],
        // taskDetailId: data['task_detail_id'],
        message: data['message'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        // status,
        // taskDetailId,
        message,
      ];
}
