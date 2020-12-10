import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanamind/cubit/auth/register/register_state.dart';
import 'package:tanamind/helper/shared_preferences.dart';
import 'package:tanamind/model/auth_model/user_model.dart';
import 'package:tanamind/repository/auth/register.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(state) : super(IsLoadingState());

  void register(String firstName, String lastName, String email,
      String password, var phone) async {
    try {
      emit(IsLoadingState());
      var response = await RegisterRepository()
          .sentData(firstName, lastName, email, password, phone);
      var json = jsonDecode(response);
      if(json['status'] == 201){
        var data = json['data'];
        UserModel.fromJson(data);
        UserPreferences.setUserToken(data['token']);
        UserPreferences.setUserEmail(data['user']['email']);
        UserPreferences.setUserName(data['user']['firstname'], data['user']['lastname']);
        UserPreferences.setUserPhone(data['user']['phone']);
        emit(IsLoadedState(json['status']));
      }else {
        emit(IsErrorState(json));
      }
    } catch (e) {
      print("print error : $e");
      emit(IsErrorState(e.toString()));
    }
  }
}
