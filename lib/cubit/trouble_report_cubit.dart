import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pgnmko_flutter/models/model.dart';
import 'package:pgnmko_flutter/services/service.dart';

part 'trouble_report_state.dart';

class TroubleReportCubit extends Cubit<TroubleReportState> {
  TroubleReportCubit() : super(TroubleReportInitial());

  Future<void> Fetch({int? page, int? limit}) async {
    emit(TroubleReportInitial());
    ApiReturnValue<List<TroubleReport>> result =
        await TroubleReportService.ListData(page: page, limit: limit);

    if (result.value != null) {
      emit(TroubleReportSuccess(result.value!));
    } else if (result.unauthorized == true) {
      emit(const TroubleReportUnauthorized(true));
    } else {
      emit(TroubleReportFailed(result.message!, result.exception!));
    }
  }
}
