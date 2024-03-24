import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pgnmko_flutter/models/model.dart';
import 'package:pgnmko_flutter/services/service.dart';

part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit() : super(CompanyInitial());

  Future<void> FetchAvailable() async {
    emit(CompanyInitial());
    ApiReturnValue<List<Company>> result =
        await CompanyService.ListDataAvailable();

    if (result.value != null) {
      emit(CompanySuccess(result.value!));
    } else if (result.unauthorized == true) {
      emit(CompanyUnauthorized(true));
    } else {
      emit(CompanyFailed(result.message!));
    }
  }
}
