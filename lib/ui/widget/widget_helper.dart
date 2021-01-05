import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/style.dart';

flushBar(BuildContext context, String message) {
  return Flushbar(
    flushbarPosition: FlushbarPosition.BOTTOM,
    message: '${message.replaceFirst(message[0], message[0].toUpperCase())}',
    /*backgroundColor: Color(0xff009688),*/
    backgroundColor: mainGreen.withOpacity(0.8),
    duration: Duration(seconds: 3),
  ).show(context);
}

Widget buildEmpty(final message) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/icon/ic_empty_plant.png',
          width: 100,
          height: 100,
        ),
        SizedBox(
          height: 16.0,
        ),
        Text(
          message,
          style: fontRoboto(16.0, FontWeight.w500, Colors.black54),
        )
      ],
    ),
  );
}

Widget buildError(final message) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/icon/ic_plant_error.png',
          width: 100,
          height: 100,
        ),
        SizedBox(
          height: 16.0,
        ),
        Text(
          message,
          style: fontRoboto(16.0, FontWeight.w500, Colors.black54),
        )
      ],
    ),
  );
}
