import 'package:tanamind/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'file:///C:/Users/Drow/AndroidStudioProjects/CODEHOUSE_Tanamind/lib/ui/kelola/kelola/kelola_screen.dart';
import 'package:tanamind/ui/list_plan/list_plant_screen.dart';
import 'package:tanamind/ui/marketplace/marketplace/marketplace_screen.dart';
import 'file:///C:/Users/Drow/AndroidStudioProjects/CODEHOUSE_Tanamind/lib/ui/kelola/my_plant/my_plant_screen.dart';


abstract class HomeViewModel extends State<HomeScreen> {
  var children = [
    {
      "name": "Reminder",
      "page": ListPlantScreen(),
      "unSelectedColor": Colors.grey,
      "selectedColor": Colors.green,
      "background": Colors.green
    },
    {
      "name": "Tanamanku",
      "page": KelolaScreen(),
      "unSelectedColor": Colors.grey,
      "selectedColor": Colors.green,
      "background": Colors.green
    },
    {
      "name": "Market",
      "page": MarketPlaceScreen(),
      "unSelectedColor": Colors.grey,
      "selectedColor": Colors.green,
      "background": Colors.green
    },
  ];
}
