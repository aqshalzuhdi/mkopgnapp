import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pgnmko_flutter/models/model.dart';
import 'package:pgnmko_flutter/services/service.dart';

part 'task_category_sub_state.dart';

class TaskCategorySubCubit extends Cubit<TaskCategorySubState> {
  TaskCategorySubCubit() : super(TaskCategorySubInitial());

  Future<void> Fetch(int categoryId) async {
    emit(TaskCategorySubInitial());
    ApiReturnValue<List<TaskCategorySub>> result =
        await TaskCategorySubService.ListData(categoryId);

    if (result.value != null) {
      emit(TaskCategorySubSuccess(result.value!));
    } else if (result.unauthorized == true) {
      emit(const TaskCategorySubUnauthorized(true));
    } else {
      emit(TaskCategorySubFailed(result.message!));
    }
  }
}
