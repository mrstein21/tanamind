import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tanamind/ui/kelola/add_pot/add_pot_screen.dart';

abstract class AddPotViewModel extends State<AddPotScreen> {
  List<File> listImage = new List();

  var randomImage = [
    'assets/tanaman/tanaman_4.jpg',
    'assets/tanaman/tanaman_2.jpg',
    'assets/tanaman/tanaman_1.jpg',
    'assets/tanaman/tanaman_5.jpg'
  ];
}
