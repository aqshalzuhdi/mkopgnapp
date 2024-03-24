import 'package:bloc/bloc.dart';

part 'checkbox_state.dart';

class CheckboxCubit extends Cubit<CheckboxState> {
  CheckboxCubit() : super(CheckboxState(ischecked: false));
  // CheckboxCubit(dynamic initialOption) : super(initialOption);

  void changeValue(bool value) {
    emit(state.copyWith(changeState: value));
  }

  void changeOption(dynamic newOption) {
    emit(newOption);
  }
}
