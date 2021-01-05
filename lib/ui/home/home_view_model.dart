import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanamind/cubit/marketplace/cart/add_cart_cubit.dart';
import 'package:tanamind/global.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/shared_preferences.dart';
import 'package:tanamind/repository/auth/logout.dart';
import 'package:tanamind/ui/home/home_screen.dart';
import 'package:tanamind/ui/kelola/kelola/kelola_screen.dart';
import 'package:tanamind/ui/list_plan/list_plant_screen.dart';
import 'package:tanamind/ui/marketplace/marketplace/marketplace_screen.dart';
import 'package:tanamind/ui/profile/profile_screen.dart';

abstract class HomeViewModel extends State<HomeScreen> {
  var userName;
  var userInitial;
  final token = null;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  AddCartCubit cart;

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

  getUserPreferencess() async {
    tokenGlobal = await UserPreferences.getUserToken();
    cartLength = await UserPreferences.getUserCart();
    favLength = await UserPreferences.getUserFav();
    if(tokenGlobal != null){
      userName = await UserPreferences.getUserName();
      userInitial = await userName
          .toString()
          .replaceFirst(userName[0], userName[0].toString().toUpperCase());
      print('username : ${await UserPreferences.getUserName()}');
    }
  }

  logOut() async {
    var token = await UserPreferences.getUserToken();
    print("token : $token");
    if (token == null || token == '') {
      Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()))
          .then((value) {
        UserPreferences.clearUserPreferences();
        tokenGlobal = null;
      });
      /*await UserPreferences.clearUserPreferences();
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);*/
    } else {
      LogoutRepository().logout(token).then((value) {
        var json = jsonDecode(value);
        print('value $value');
        if (json['status'] == 200) {
          print('success');
          UserPreferences.clearUserPreferences();
          tokenGlobal = null;
          cartLength = 0;
          favLength = 0;
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
          /*UserPreferences.clearUserPreferences();
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/login', (Route<dynamic> route) => false);*/
        } else {
          print('error : $value');
          final snackBar = SnackBar(content: Text('Something went wrong...'));
          scaffoldKey.currentState.showSnackBar(snackBar);
        }
      });
    }
  }

  Future<void> getCart() async {
    cartLength = await UserPreferences.getUserCart();
    print('$cartLength : ${await UserPreferences.getUserCart()}');
  }
}
