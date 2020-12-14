import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/shared_preferences.dart';
import 'package:tanamind/repository/auth/logout.dart';
import 'package:tanamind/ui/home/home_screen.dart';
import 'package:tanamind/ui/kelola/kelola/kelola_screen.dart';
import 'package:tanamind/ui/list_plan/list_plant_screen.dart';
import 'package:tanamind/ui/marketplace/marketplace/marketplace_screen.dart';
import 'package:tanamind/ui/profile/profile_screen.dart';

abstract class HomeViewModel extends State<HomeScreen> {
  var children = [
    {
      "name": "Reminder",
      "page": ListPlantScreen(),
      "unSelectedColor": Colors.grey,
      "selectedColor": mainGreen,
      "background": mainGreen
    },
    {
      "name": "Tanamanku",
      "page": KelolaScreen(),
      "unSelectedColor": Colors.grey,
      "selectedColor": mainGreen,
      "background": mainGreen
    },
    {
      "name": "Market",
      "page": MarketPlaceScreen(),
      "unSelectedColor": Colors.grey,
      "selectedColor": mainGreen,
      "background": mainGreen
    },
    {
      "name": "Akun",
      "page": ProfileScreen(),
      "unSelectedColor": Colors.grey,
      "selectedColor": mainGreen,
      "background": mainGreen
    },
  ];

  var userName;
  var userInitial;
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  getUserPreferencess() async {
    userName = await UserPreferences.getUserName();
    userInitial = await userName
        .toString()
        .replaceFirst(userName[0], userName[0].toString().toUpperCase());
    print('username : ${await UserPreferences.getUserName()}');
  }

  logOut() async {
    var token = await UserPreferences.getUserToken();
    LogoutRepository().logout(token).then((value) {
      var json = jsonDecode(value);
      print('value $value');
        if (json['status'] == 200) {
          print('success');
          UserPreferences.clearUserPreferences();
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
        } else {
          print('error : $value');
          final snackBar = SnackBar(content: Text('Something went wrong...'));
          scaffoldKey.currentState.showSnackBar(snackBar);
        }
    });
  }
}
