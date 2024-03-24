import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pgnmko_flutter/models/model.dart';
import 'package:pgnmko_flutter/services/service.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  Future<void> Fetch({int? page, int? limit}) async {
    emit(TaskInitial());
    ApiReturnValue<List<Task>> result =
        await TaskService.ListData(page: page, limit: limit);

    if (result.value != null) {
      emit(TaskSuccess(result.value!));
    } else if (result.unauthorized == true) {
      emit(const TaskUnauthorized(true));
    } else {
      emit(TaskFailed(result.message!, result.exception!));
    }
  }
}

// class TaskDetailCubit extends Cubit<TaskDetailState> {
//   TaskDetailCubit() : super(TaskDetailInitial());

//   Future<void> ListDataById(int id) async {
//     emit(TaskDetailInitial());
//     ApiReturnValue<Task> result = await TaskService.ListDataById(id);

//     if (result.value != null) {
//       emit(TaskDetailSuccess(result.value!));
//     } else if (result.unauthorized == true) {
//       // emit(TaskUnauthorized(true));
//     } else {
//       // emit(TaskFailed(result.message!));
//     }
//   }
// }
