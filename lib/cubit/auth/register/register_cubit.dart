import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanamind/cubit/auth/register/register_state.dart';
import 'package:tanamind/global.dart';
import 'package:tanamind/helper/shared_preferences.dart';
import 'package:tanamind/model/auth_model/user_model.dart';
import 'package:tanamind/repository/auth/register.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(state) : super(IsLoadingState());

  void register(String firstName, String lastName, String email,
      String password, var phone) async {
    try {
      emit(IsLoadingState());
      await Future.delayed(new Duration(seconds: 3));
      var response = await RegisterRepository()
          .sentData(firstName, lastName, email, password, phone);
      var json = jsonDecode(response);
      if (json['status'] == 200) {
        var data = json['data'];
        var username = data['user']['firstname'] + data['user']['lastname'];
        UserPreferences.setUserToken(data['token']['access_token']);
        UserPreferences.setUserEmail(data['user']['email']);
        UserPreferences.setUserName(username);
        UserPreferences.setUserPhone(data['user']['phone']);
        tokenGlobal = data['token']['access_token'];
        emit(IsLoadedState(json['status']));
      } else if (json['status'] == 400) {
        var data = json['error'];
        var message;
        if (data['email'] != null && data['phone'] != null) {
          message = 'Email and Phone number has already been taken.';
        } else if (data['email'] != null) {
          message = 'Email has already been taken.';
        } else if (data['phone'] != null) {
          message = 'Phone number has already been taken.';
        }
        emit(IsErrorState('$message'));
      }
    } catch (e) {
      print("print error : $e");
      emit(IsErrorState('Connection error...'));
    }
  }
}
