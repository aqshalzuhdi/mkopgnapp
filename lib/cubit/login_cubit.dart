import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pgnmko_flutter/models/model.dart';
import 'package:pgnmko_flutter/services/service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> Fetch(String username, String password) async {
    ApiReturnValue<Auth> result = await AuthService.Login(username, password);

    if (result.value != null) {
      emit(LoginSuccess(result.value!));
    } else {
      emit(LoginFailed(result.message!, result.exception!));
    }
  }
}
