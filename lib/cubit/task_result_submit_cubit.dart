import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pgnmko_flutter/models/model.dart';
import 'package:pgnmko_flutter/services/service.dart';

part 'task_result_submit_state.dart';

class TaskResultSubmitCubit extends Cubit<TaskResultSubmitState> {
  TaskResultSubmitCubit() : super(TaskResultSubmitInitial());

  Future<void> Store({
    required String taskId,
    required String taskDetailId,
    required String value,
  }) async {
    emit(TaskResultSubmitInitial());
    ApiReturnValue<String> result = await TaskResultService.InsertData(
      taskId: taskId,
      taskDetailId: taskDetailId,
      value: value,
    );

    if (result.value != null) {
      emit(TaskResultSubmitSuccess(result.value!));
    } else if (result.unauthorized == true) {
      emit(TaskResultSubmitUnauthorized(true));
    } else {
      emit(TaskResultSubmitFailed(result.message!));
    }
  }

  // Future<void> Store({
  //   required String taskId,
  //   required String taskDetailId,
  //   required String value,
  // }) async {
  //   emit(TaskResultSubmitInitial());
  //   ApiReturnValue<List<TaskResultSubmit>> result =
  //       await TaskResultService.InsertData(
  //     taskId: taskId,
  //     taskDetailId: taskDetailId,
  //     Value: Value,
  //   );

  //   if (result.value != null) {
  //     emit(TaskResultSubmitSuccess(result.value!));
  //   } else if (result.unauthorized == true) {
  //     emit(TaskResultSubmitUnauthorized(true));
  //   } else {
  //     emit(TaskResultSubmitFailed(result.message!));
  //   }
  // }
}
