import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'build_list_category.dart';

abstract class CategoryViewModel extends State<ListCategory> {
  var categoryIcon = [
    {"name": "Alat", "icon": Icons.settings},
    {"name": "Pot", "icon": Icons.shopping_basket},
    {"name": "Bibit", "icon": Icons.shop},
    {"name": "Tanaman", "icon": Icons.wb_cloudy},
    {"name": "Tanah", "icon": Icons.camera},
    {"name": "Pupuk", "icon": Icons.scanner},
    {"name": "Lain-lain", "icon": Icons.dashboard}
  ];

  void navigationCategory(String name) {
    if (name == 'Alat') {
      Navigator.pushNamed(context, '/alat_screen');
    } else if (name == 'Pot') {
      Navigator.pushNamed(context, '/pot_screen');
    } else if (name == 'Bibit') {
      Navigator.pushNamed(context, '/bibit_screen');
    } else if (name == 'Tanaman') {
      Navigator.pushNamed(context, '/tanaman_screen');
    } else if (name == 'Tanah') {
      Navigator.pushNamed(context, '/tanah_screen');
    } else if (name == 'Pupuk') {
      Navigator.pushNamed(context, '/pupuk_screen');
    } else if (name == 'Lain-lain') {
      Navigator.pushNamed(context, '/etc_screen');
    }
  }
}
