import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pgnmko_flutter/models/model.dart';
import 'package:pgnmko_flutter/services/service.dart';

part 'task_detail_state.dart';

class TaskDetailCubit extends Cubit<TaskDetailState> {
  TaskDetailCubit() : super(TaskDetailInitial());

  Future<void> Fetch(int id) async {
    emit(TaskDetailInitial());
    ApiReturnValue<Task> result = await TaskService.ListDataById(id);

    if (result.value != null) {
      emit(TaskDetailSuccess(result.value!));
    } else if (result.unauthorized == true) {
      emit(TaskDetailUnauthorized(true));
    } else {
      emit(TaskDetailFailed(result.message!));
    }
  }
}
