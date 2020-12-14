import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamind/cubit/auth/login/login_cubit.dart';
import 'package:tanamind/cubit/auth/login/login_state.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/shared_preferences.dart';
import 'package:tanamind/helper/style.dart';
import 'package:tanamind/ui/auth/login/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginViewScreen createState() => LoginViewScreen();
}

class LoginViewScreen extends LoginViewModel {
  Size size;
  var route;
  var routeID;

  Future fushbar() async {
    /* await Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      message: 'Registration Success...',
      backgroundColor: mainGreen,
      duration: Duration(seconds: 4),
    )
      ..show(context);
    await Future.delayed(new Duration(seconds: 5))
        .then((value) => routeID = null);*/
  }

  @override
  Widget build(BuildContext context) {
    route = ModalRoute.of(context).settings.arguments as Map<String, String>;
    if (route != null) {
      routeID = route['register'];
    }
    size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is IsLoadingState) {
            loadingDialog(context);
          } else if (state is IsLoginState) {
            print("print isLogin state : ${state.message}");

            Navigator.of(context).pushNamedAndRemoveUntil(
                '/home', (Route<dynamic> route) => false);
          } else if (state is IsLoginErroState) {
            print('print error state : ${state.message}');
            Navigator.pop(context, false);
            final snackBar = SnackBar(content: Text(state.message));
            scaffoldKey.currentState.showSnackBar(snackBar);
          }
        },
        child: Stack(
          children: [
            _buildBackground(size.height * 0.45, size.width),
            _buildCircleTop(),
            _buildCircleBottom(),
            _buildTitle(size.height * 0.15),
            _buildFormCard(
                size.height * 0.31, size.width * 0.9, size.height * 0.3),
            _buildButtonLogin(size.height * 0.58),
            _buildRowFbAndGoogle(size.height * 0.18),
            _buildRegister(),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground(double height, double width) {
    return Positioned(
        child: Column(
      children: [
        Stack(
          children: [
            Container(
              height: height,
              width: width,
              child: CustomPaint(
                painter: CurvePainter(),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              color: Colors.black45.withOpacity(0),
            )
          ],
        ),
        Expanded(
          child: Container(
            color: Colors.white,
          ),
        ),
      ],
    ));
  }

  Widget _buildTitle(double height) {
    return Positioned(
      top: height,
      right: 0,
      left: 0,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          'Tanamind',
          style: GoogleFonts.courgette(
              fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildFormCard(double height, double width, var position) {
    return Positioned(
      top: position,
      left: 25,
      right: 25,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                new BoxShadow(
                  color: Colors.black45.withOpacity(0.1),
                  spreadRadius: 2.0,
                  blurRadius: 2.0,
                  offset: Offset(0, 2),
                ),
              ]),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: email,
                    /*validator: (value) => nickNameValidator(value),*/
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      isDense: true,
                      errorStyle: TextStyle(fontSize: 0),
                      hintStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500, fontSize: 14),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: mainGreen, width: 1)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: mainGreen, width: 2),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: password,
                    /*validator: (value) => passwordValidator(value),*/
                    style: TextStyle(fontSize: 14),
                    inputFormatters: [
                      WhitelistingTextInputFormatter(RegExp(r"[a-zA-Z]+|[0-9]"))
                    ],
                    decoration: InputDecoration(
                        hintText: 'Password',
                        isDense: true,
                        errorStyle: TextStyle(fontSize: 0),
                        hintStyle: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500, fontSize: 14),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: mainGreen, width: 1)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: mainGreen, width: 2),
                        ),
                        suffixIcon: Icon(Icons.remove_red_eye)),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget _buildButtonLogin(var position) {
    return Positioned(
      top: position,
      right: 100,
      left: 100,
      child: InkWell(
        onTap: onTapButtonLogin,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 16.0),
          decoration: BoxDecoration(
              color: mainGreen, borderRadius: BorderRadius.circular(8)),
          child: Text(
            'LOGIN',
            style: fontRoboto(14.0, FontWeight.w500, Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildRowFbAndGoogle(var position) {
    return Positioned(
        bottom: position,
        right: 100,
        left: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'or login with',
                style: fontRoboto(15.0, FontWeight.w500, Colors.black87),
              ),
            ),
            Divider(
              color: Colors.black26,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.black45.withOpacity(0.1),
                            spreadRadius: 2.0,
                            blurRadius: 2.0,
                            offset: Offset(0, 2),
                          ),
                        ]),
                    child: Image.asset('assets/explore_2.png'),
                  ),
                  SizedBox(
                    width: 22.0,
                  ),
                  Container(
                      height: 55,
                      width: 55,
                      padding: const EdgeInsets.all(9.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.black45.withOpacity(0.1),
                              spreadRadius: 2.0,
                              blurRadius: 2.0,
                              offset: Offset(0, 2),
                            ),
                          ]),
                      child: Image.asset('assets/explore.png')),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildRegister() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text(
                        'Do you have an account?',
                        style:
                            fontRoboto(15.0, FontWeight.w600, Colors.black54),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, '/register'),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            'Register',
                            style: GoogleFonts.montserrat(
                                fontSize: 14.0,
                                color: mainGreen,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleTop() {
    return Positioned(
      top: 50,
      right: -40,
      child: Hero(
        tag: 'header_top',
        child: Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }

  Widget _buildCircleBottom() {
    return Positioned(
      bottom: -40,
      left: -40,
      child: Hero(
        tag: 'bottom_circle',
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              color: mainGreen, borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = mainGreen;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.89);
    path.quadraticBezierTo(
        size.width * 0.5, size.height, size.width, size.height * 0.89);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
