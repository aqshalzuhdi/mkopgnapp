import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pgnmko_flutter/models/model.dart';
import 'package:pgnmko_flutter/services/service.dart';

part 'total_state.dart';

class TotalCubit extends Cubit<TotalState> {
  TotalCubit() : super(TotalInitial());

  Future<void> Fetch() async {
    emit(TotalInitial());
    ApiReturnValue<Total> result = await TotalService.ListData();

    if (result.value != null) {
      emit(TotalSuccess(result.value!));
    } else if (result.unauthorized == true) {
      emit(TotalUnauthorized(true));
    } else {
      emit(TotalFailed(result.message!));
    }
  }
}
