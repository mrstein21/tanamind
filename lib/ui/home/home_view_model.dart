import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
}
