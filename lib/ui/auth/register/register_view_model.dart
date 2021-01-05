import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanamind/cubit/auth/register/register_cubit.dart';
import 'package:tanamind/ui/auth/register/register_screen.dart';

abstract class RegisterViewModel extends State<RegisterScreen> {
  RegisterCubit cubit;
  SharedPreferences sharedPreferences;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool visible = true;
  TextEditingController email = new TextEditingController();
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  void initState() {
    cubit = BlocProvider.of<RegisterCubit>(context);
    super.initState();
  }

  void onButtonPressed() async {
    var phoneNumber = phone.text.replaceFirst('0', '62');
    if (!formKey.currentState.validate()) {
      final snackBar = SnackBar(content: Text('Please enter correct data...'));
      scaffoldKey.currentState.showSnackBar(snackBar);
    } else if (lastName.text == firstName.text) {
      final snackBar =
          SnackBar(content: Text('Lastname cannot be same as Firstname'));
      scaffoldKey.currentState.showSnackBar(snackBar);
    } else {
      cubit.register(firstName.text, lastName.text, email.text, password.text,
          phoneNumber);
    }
  }

  onVisible() {
    setState(() {
      if(visible == false){
        visible = true;
      }else{
        visible = false;
      }
    });
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
        },);
  }
}
