import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pgnmko_flutter/models/model.dart';
import 'package:pgnmko_flutter/services/service.dart';

part 'refresh_token_state.dart';

class RefreshTokenCubit extends Cubit<RefreshTokenState> {
  RefreshTokenCubit() : super(RefreshTokenInitial());

  Future<void> Fetch() async {
    ApiReturnValue<Auth> result = await AuthService.RefreshToken();

    if (result.value != null) {
      emit(RefreshTokenSuccess(result.value!));
    } else if (result.unauthorized == true) {
      emit(RefreshTokenUnauthorized(true));
    } else {
      emit(RefreshTokenFailed(result.message!));
    }
  }
}
