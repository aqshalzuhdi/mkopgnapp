import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pgnmko_flutter/models/model.dart';
import 'package:pgnmko_flutter/services/service.dart';

part 'task_documentation_submit_state.dart';

class TaskDocumentationSubmitCubit extends Cubit<TaskDocumentationSubmitState> {
  TaskDocumentationSubmitCubit() : super(TaskDocumentationSubmitInitial());

  Future<void> InsertData({
    required String taskId,
    required String base64,
    required String title,
  }) async {
    emit(TaskDocumentationSubmitInitial());
    ApiReturnValue<String> result = await TaskDocumentationService.InsertData(
      taskId: taskId,
      base64: base64,
      title: title,
    );

    if (result.value != null) {
      emit(TaskDocumentationSubmitSuccess(result.value!));
    } else if (result.unauthorized == true) {
      emit(TaskDocumentationSubmitUnauthorized(true));
    } else {
      emit(TaskDocumentationSubmitFailed(result.message!));
    }
  }

  Future<void> UpdateData({
    required String id,
    required String taskId,
    required String base64,
    String? value,
  }) async {
    emit(TaskDocumentationSubmitInitial());
    ApiReturnValue<String> result = await TaskDocumentationService.UpdateData(
      taskId: taskId,
      id: id,
      base64: base64,
      value: value,
    );

    if (result.value != null) {
      emit(TaskDocumentationSubmitSuccess(result.value!));
    } else if (result.unauthorized == true) {
      emit(TaskDocumentationSubmitUnauthorized(true));
    } else {
      emit(TaskDocumentationSubmitFailed(result.message!));
    }
  }
}
