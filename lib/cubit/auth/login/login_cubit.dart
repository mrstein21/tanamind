import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanamind/cubit/auth/login/login_state.dart';
import 'package:tanamind/helper/shared_preferences.dart';
import 'package:tanamind/model/auth_model/user_model.dart';
import 'package:tanamind/repository/auth/login.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repository) : super(IsLoadingState());

  LoginRepository repository;

  void login(String params, String password) async {
    try {
      emit(IsLoadingState());
      await Future.delayed(new Duration(seconds: 3));
      var response = await repository.userLogin(params, password);
      var json = jsonDecode(response);
      if (json['status'] == 200) {
        var data = json['data'];
        var user = data['user'];
        var token = data['token'];

        var username = '${user['firstname']} ${user['lastname']}';
        UserPreferences.setUserToken(token['access_token']);
        UserPreferences.setUserId(user['id']);
        UserPreferences.setUserName(username);
        UserPreferences.setUserEmail(user['email']);
        UserPreferences.setUserPhone(user['phone']);
        emit(IsLoginState(json['status']));
      } else if (json['status'] == 400) {
        var message;
        print(params);
        if (params.contains('62'))
          message = 'Invalid phone number or password';
        else
          message = 'Invalid email or password';

        print("print error 400 : $message");
        emit(IsLoginErroState(message));
      }
    } catch (e) {
      emit(IsLoginErroState(e.toString()));
    }
  }
}
