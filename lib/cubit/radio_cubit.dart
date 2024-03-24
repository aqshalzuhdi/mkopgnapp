import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'radio_state.dart';

enum RadioButtonOption {
  NotSelectedOption,
  FirstOption,
  SecondOption,
  ThirdOption,
  FourthOption,
  FifthOption,
}

RadioButtonOption radioButtonOption(int r) {
  RadioButtonOption e = RadioButtonOption.NotSelectedOption;
  switch (r) {
    case 1:
      e = RadioButtonOption.FirstOption;
      break;
    case 2:
      e = RadioButtonOption.SecondOption;
      break;
    case 3:
      e = RadioButtonOption.ThirdOption;
      break;
    case 4:
      e = RadioButtonOption.FifthOption;
      break;
  }

  return e;
}

class RadioCubit extends Cubit<RadioButtonOption> {
  RadioCubit(RadioButtonOption initialOption) : super(initialOption);

  void changeOption(RadioButtonOption newOption) {
    emit(newOption);
  }
}
