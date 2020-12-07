import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tanamind/ui/kelola/my_plant/my_plant_screen.dart';

abstract class MyPlantViewModel extends State<MyPlantScreen> {
  var listPlant = [
    {
      'title': 'Lidah Buaya',
      'label': 'Progress bulan pertama',
      'image': 'assets/tanaman/tanaman_2.jpg'
    },
    {
      'title': 'Lidah Buaya',
      'label': 'Progress bulan kedua',
      'image': 'assets/tanaman/tanaman_1.jpg'
    },
    {
      'title': 'Lidah Buaya',
      'label': 'Progress bulan ketiga',
      'image': 'assets/tanaman/tanaman_3.jpg'
    },
    {
      'title': 'Lidah Buaya',
      'label': 'Progress bulan keempat',
      'image': 'assets/tanaman/tanaman_5.jpg'
    },
    {
      'title': 'Lidah Buaya',
      'label': 'Progress bulan kelima',
      'image': 'assets/tanaman/tanaman_4.jpg'
    },
  ];

  var listFilter = [
    'Tanaman',
    'Pot',
    'Bibit',
  ];
}
