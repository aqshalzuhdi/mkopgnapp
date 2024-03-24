import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pgnmko_flutter/models/model.dart';
import 'package:pgnmko_flutter/services/service.dart';

part 'task_documentation_state.dart';

class TaskDocumentationCubit extends Cubit<TaskDocumentationState> {
  TaskDocumentationCubit() : super(TaskDocumentationInitial());

  Future<void> Fetch(int taskId) async {
    emit(TaskDocumentationInitial());
    ApiReturnValue<List<TaskDocumentation>> result =
        await TaskDocumentationService.ListData(taskId);

    if (result.value != null) {
      emit(TaskDocumentationSuccess(result.value!));
    } else if (result.unauthorized == true) {
      emit(const TaskDocumentationUnauthorized(true));
    } else {
      emit(TaskDocumentationFailed(result.message!));
    }
  }
}
