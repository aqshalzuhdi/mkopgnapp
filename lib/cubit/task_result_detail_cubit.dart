import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pgnmko_flutter/models/model.dart';
import 'package:pgnmko_flutter/services/service.dart';

part 'task_result_detail_state.dart';

class TaskResultDetailCubit extends Cubit<TaskResultDetailState> {
  TaskResultDetailCubit() : super(TaskResultDetailInitial());

  Future<void> FetchById(int id) async {
    emit(TaskResultDetailInitial());
    ApiReturnValue<TaskResult> result =
        await TaskResultService.ListDataById(id);

    if (result.value != null) {
      emit(TaskResultDetailSuccess(result.value!));
    } else if (result.unauthorized == true) {
      emit(TaskResultDetailUnauthorized(true));
    } else {
      emit(TaskResultDetailFailed(result.message!));
    }
  }
}
