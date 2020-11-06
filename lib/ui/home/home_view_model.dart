import 'package:tanamind/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tanamind/ui/list_plan/list_plant_screen.dart';
import 'package:tanamind/ui/marketplace/home_marketplace/marketplace_screen.dart';

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
      "page": ListPlantScreen(),
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

  var xxx = [];

  var list_question=[
    {
      "name":"Richard Hendrick",
      "image":"assets/dummy/richard.jpg",
      "replies":"3",
      "question":"Bagaimana pemasaran sayuran hidroponik ?",
      "date":"3 days ago"
    },{
      "name":"Dinesh Chugtai",
      "image":"assets/dummy/dinesh.jpg",
      "replies":"4",
      "question":"Kalau tidak mempunyai alat ukur,Bagaimana cara mengukur kepekaan nutrisi hidroponik?",
      "date":"5 days ago"
    },{
      "name":"Jared Dunn",
      "image":"assets/dummy/jared.jpg",
      "replies":"10",
      "question":"Sayur apa yang mudah ditanam ?",
      "date":"4 days ago"
    }
  ];
}
