import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_bar_task_result_state.dart';

class TabBarTaskResultCubit extends Cubit<TabBarTaskResultState> {
  // int selectedIndex = 0;
  TabBarTaskResultCubit() : super(TabBarTaskResultInitial());

  void changeState(int index) {
    emit(TabBarTaskResult(index));
  }

  // Future<void> ListDataById(int id) async {
  //   emit(TaskResultDetailInitial());
  //   ApiReturnValue<TaskResult> result = await TaskResultService.ListDataById(id);

  //   if (result.value != null) {
  //     emit(TaskResultDetailSuccess(result.value!));
  //   } else if (result.unauthorized == true) {
  //     emit(TaskResultDetailUnauthorized(true));
  //   } else {
  //     emit(TaskResultDetailFailed(result.message!));
  //   }
  // }
}

// class TabBarTaskResultCubit extends Cubit<TabBarTaskResultState> {
//   TabBarTaskResultCubit() : super(TabBarTaskResultState(index: 0));

//   void changeState(int index) {
//     emit(state.copyWith(stateIndex: index));
//   }
// }

// class TabBarTaskResultCubit extends Cubit<TabBarTaskResultState> {
//   TabBarTaskResultCubit() : super(TabBarTaskResultState(stateIndex: 0));

//   void changeIndex(int index) {
//     emit(TabBarTaskResultState(stateIndex: index));
//   }
// }
