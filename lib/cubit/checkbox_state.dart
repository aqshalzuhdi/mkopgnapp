part of 'checkbox_cubit.dart';

class CheckboxState {
  bool ischecked = false;

  CheckboxState({required this.ischecked}) {
    if (ischecked) {
      ischecked = true;
    } else {
      ischecked = false;
    }
  }

  CheckboxState copyWith({required bool changeState}) {
    return CheckboxState(ischecked: changeState);
  }
}
