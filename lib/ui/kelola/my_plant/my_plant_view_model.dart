import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tanamind/ui/kelola/my_plant/my_plant_screen.dart';

abstract class MyPlantViewModel extends State<MyPlantScreen> {
  var listPlant = [
    {'title': 'Toge', 'label': 'toge-togean', 'image': 'assets/toge.jpg'},
    {'title': 'Bayam', 'label': 'Spinach', 'image': 'assets/bayam.jpg'},
    {'title': 'Pokcoy', 'label': 'FakCoy', 'image': 'assets/pokcoy.jpg'},
    {'title': 'Cengek', 'label': 'Cengek', 'image': 'assets/cengek.jpg'},
    {
      'title': 'Lidah Buaya Darat',
      'label': 'Tanaman?',
      'image': 'assets/lidahbuaya.jpg'
    },
  ];

  var listFilter = [
    'FilterBy',
    'FilterBy',
    'FilterBy',
  ];
}
