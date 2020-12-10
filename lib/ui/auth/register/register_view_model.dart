import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanamind/cubit/auth/register/register_cubit.dart';
import 'package:tanamind/ui/auth/register/register_screen.dart';

abstract class RegisterViewModel extends State<RegisterScreen> {
  RegisterCubit cubit;
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    cubit = BlocProvider.of<RegisterCubit>(context);
    super.initState();
  }

  void onButtonPressed(String firstName, String lastName, String email,
      String password, var phone) async {
    cubit.register(firstName, lastName, email, password, phone);
  }

  //loading widget
  void loadingDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Loading..."),
            content: CupertinoActivityIndicator(
              radius: 15,
            ),
          );
        });
  }
}
