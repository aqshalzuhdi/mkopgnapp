import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pgnmko_flutter/models/model.dart';
import 'package:pgnmko_flutter/services/service.dart';

part 'task_result_state.dart';

class TaskResultCubit extends Cubit<TaskResultState> {
  TaskResultCubit() : super(TaskResultInitial());

  Future<void> Fetch(int? taskId, int? taskCategoryId) async {
    emit(TaskResultInitial());
    ApiReturnValue<List<TaskResult>> result =
        await TaskResultService.ListData(taskId, taskCategoryId);

    if (result.value != null) {
      emit(TaskResultSuccess(result.value!));
    } else if (result.unauthorized == true) {
      emit(TaskResultUnauthorized(true));
    } else {
      emit(TaskResultFailed(result.message!));
    }
  }
}
