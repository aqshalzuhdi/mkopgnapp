import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pgnmko_flutter/models/model.dart';
import 'package:pgnmko_flutter/services/service.dart';

part 'logout_submit_state.dart';

class LogoutSubmitCubit extends Cubit<LogoutSubmitState> {
  LogoutSubmitCubit() : super(LogoutSubmitInitial());

  Future<void> Fetch() async {
    ApiReturnValue<String> result = await AuthService.Logout();

    if (result.value != null) {
      emit(LogoutSubmitSuccess(result.value!));
    } else {
      emit(LogoutSubmitFailed(result.message!, result.exception!));
    }
  }
}
