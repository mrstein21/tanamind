import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanamind/cubit/auth/login/login_cubit.dart';
import 'package:tanamind/ui/auth/login/login_screen.dart';

abstract class LoginViewModel extends State<LoginScreen>{

  LoginCubit cubit;
  bool visible = true;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  void initState() {
    cubit = BlocProvider.of<LoginCubit>(context);
    super.initState();
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

  void onTapButtonLogin() async{
    var phoneNumber;
    cubit.login('indra@codehouse.id', 'drow');
   /* if(!formKey.currentState.validate()){
      final snackBar = SnackBar(content: Text('Must not empty...'));
      scaffoldKey.currentState.showSnackBar(snackBar);
    }else{
      if(email.text.contains('08')){
        phoneNumber = email.text.replaceFirst('0', '62');
      }else{
        phoneNumber = email.text;
      }
      cubit.login(phoneNumber, password.text);
    }*/
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