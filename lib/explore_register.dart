import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamind/helper/constant.dart';

import 'helper/style.dart';
import 'helper/validator.dart';

class ExploreRegister extends StatefulWidget {
  @override
  _ExploreRegisterState createState() => _ExploreRegisterState();
}

class _ExploreRegisterState extends State<ExploreRegister> {
  var size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: [
          _buildBackground(size.height * 0.4, size.width),
          _buildTitle(size.height * 0.15),
          _buildFormCard(
              size.height * 0.4, size.width * 0.9, size.height * 0.25),
          _buildButtonLogin(size.height * 0.63),
          _buildRegister(),
          _buildRowFbAndGoogle(size.height * 0.15),
          _buildCircleTop(),
          _buildCircleBottom()
        ],
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: (value) => emailValidator(value),
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      hintText: 'Firstname',
                      hintStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500, fontSize: 14),
                      isDense: true,
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
                    validator: (value) => emailValidator(value),
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      hintText: 'Lastname',
                      hintStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500, fontSize: 14),
                      isDense: true,
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
                    validator: (value) => emailValidator(value),
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      hintStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500, fontSize: 14),
                      isDense: true,
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
                    validator: (value) => passwordValidator(value),
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500, fontSize: 14),
                        isDense: true,
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
        onTap: () => Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 16.0),
          decoration: BoxDecoration(
              color: mainGreen, borderRadius: BorderRadius.circular(8)),
          child: Text(
            'Register',
            style: fontRoboto(14.0, FontWeight.w500, Colors.white),
          ),
        ),
      ),
    );
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
                        'Already have an account?',
                        style:
                            fontRoboto(15.0, FontWeight.w600, Colors.black54),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, '/login'),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            'Login',
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

  Widget _buildCircleTop() {
    return Positioned(
      top: 50,
      left: -40,
      child: Hero(
        tag: 'header_top',
        child: GestureDetector(
          onTap: () => Navigator.pop(context, false),
          child: Container(
            height: 100,
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircleBottom() {
    return Positioned(
      bottom: -40,
      right: -40,
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

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // This is where we decide what part of our image is going to be visible.
    var path = Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = new Offset(size.width / 7, size.height - 30);
    var firstEndPoint = new Offset(size.width / 6, size.height / 1.5);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width / 5, size.height / 4);
    var secondEndPoint = Offset(size.width / 1.5, size.height / 5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint =
        Offset(size.width - (size.width / 9), size.height / 6);
    var thirdEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    ///move from bottom right to top
    path.lineTo(size.width, 0.0);

    ///finally close the path by reaching start point from top right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
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
