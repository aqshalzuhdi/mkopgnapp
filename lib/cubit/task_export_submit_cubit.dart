import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pgnmko_flutter/models/model.dart';
import 'package:pgnmko_flutter/services/service.dart';

part 'task_export_submit_state.dart';

class TaskExportSubmitCubit extends Cubit<TaskExportSubmitState> {
  TaskExportSubmitCubit() : super(TaskExportSubmitInitial());

  Future<void> Store({required String taskId}) async {
    emit(TaskExportSubmitInitial());
    ApiReturnValue<String> result = await TaskExportService.InsertData(
      taskId: taskId,
    );

    if (result.value != null) {
      emit(TaskExportSubmitSuccess(result.value!));
    } else if (result.unauthorized == true) {
      emit(TaskExportSubmitUnauthorized(true));
    } else {
      emit(TaskExportSubmitFailed(result.message!));
    }
  }
}
