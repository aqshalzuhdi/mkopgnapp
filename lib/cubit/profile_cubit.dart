import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pgnmko_flutter/services/service.dart';

import '../models/model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> Fetch() async {
    emit(ProfileInitial());
    ApiReturnValue<User> result = await AuthService.Profile();

    if (result.value != null) {
      emit(ProfileSuccess(result.value!));
    } else if (result.unauthorized == true) {
      emit(ProfileUnauthorized(true));
    } else {
      emit(ProfileFailed(result.message!));
    }
  }

  // Future<bool> submitUser(User user) async {
  //   ApiReturnValue<User> result = await UserService.Login(username, password);

  //   if (result.value != null) {
  //     emit(UserLoaded((state as UserLoaded).transactions + [result.value]));
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
