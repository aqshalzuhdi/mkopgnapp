import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pgnmko_flutter/models/model.dart';
import 'package:pgnmko_flutter/services/service.dart';

part 'task_documentation_category_state.dart';

class TaskDocumentationCategoryCubit
    extends Cubit<TaskDocumentationCategoryState> {
  TaskDocumentationCategoryCubit() : super(TaskDocumentationCategoryInitial());

  Future<void> Fetch() async {
    emit(TaskDocumentationCategoryInitial());
    ApiReturnValue<List<TaskDocumentationCategory>> result =
        await TaskDocumentationCategoryService.ListData();

    if (result.value != null) {
      emit(TaskDocumentationCategorySuccess(result.value!));
    } else if (result.unauthorized == true) {
      emit(const TaskDocumentationCategoryUnauthorized(true));
    } else {
      emit(TaskDocumentationCategoryFailed(result.message!));
    }
  }
}
