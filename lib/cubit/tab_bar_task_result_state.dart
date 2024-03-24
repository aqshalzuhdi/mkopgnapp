part of 'tab_bar_task_result_cubit.dart';

sealed class TabBarTaskResultState extends Equatable {
  const TabBarTaskResultState();

  @override
  List<Object> get props => [];
}

final class TabBarTaskResultInitial extends TabBarTaskResultState {}

class TabBarTaskResult extends TabBarTaskResultState {
  final int index;

  const TabBarTaskResult(this.index);

  @override
  List<Object> get props => [index];
}

// class TabBarTaskResultState {
//   int index = 0;

//   TabBarTaskResultState({required this.index}) {
//     index = index;
//   }

//   TabBarTaskResultState copyWith({required int stateIndex}) {
//     return TabBarTaskResultState(index: stateIndex);
//   }
// }

// class TabBarTaskResultState {
//   int stateIndex;

//   TabBarTaskResultState({required this.stateIndex});

//   // TabBarTaskResultState copyWith({required int index}) {
//   //   return TabBarTaskResultState(stateIndex: index);
//   // }
//   @override
//   List<Object> get props => [stateIndex];
// }
