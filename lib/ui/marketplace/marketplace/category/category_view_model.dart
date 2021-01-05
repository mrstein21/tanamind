import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tanamind/ui/marketplace/category/category_screen.dart';

import 'build_list_category.dart';

abstract class CategoryViewModel extends State<ListCategory> {
  var categoryIcon = [
    {"name": "Alat", "icon": Icons.category},
    {"name": "Pot", "icon": Icons.shopping_basket},
    {"name": "Bibit", "icon": Icons.scatter_plot},
    {"name": "Tanaman", "icon": Icons.find_replace},
    {"name": "Tanah", "icon": Icons.camera},
    {"name": "Pupuk", "icon": Icons.bubble_chart},
    {"name": "Lain-lain", "icon": Icons.layers}
  ];

  void navigationCategory(String name, var id) {
    /*Navigator.pushNamed(context, '/alat_screen', arguments: {'id': '$id'});*/
    print(id);
    Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryScreen(idCategory: id,)));
  }
}
