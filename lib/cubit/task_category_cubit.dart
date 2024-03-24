import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pgnmko_flutter/models/model.dart';
import 'package:pgnmko_flutter/services/service.dart';

part 'task_category_state.dart';

class TaskCategoryCubit extends Cubit<TaskCategoryState> {
  TaskCategoryCubit() : super(TaskCategoryInitial());

  Future<void> Fetch() async {
    emit(TaskCategoryInitial());
    ApiReturnValue<List<TaskCategory>> result =
        await TaskCategoryService.ListData();

    if (result.value != null) {
      emit(TaskCategorySuccess(result.value!));
    } else if (result.unauthorized == true) {
      emit(const TaskCategoryUnauthorized(true));
    } else {
      emit(TaskCategoryFailed(result.message!));
    }
  }
}
