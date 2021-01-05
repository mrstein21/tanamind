import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tanamind/repository/kelola/pot_repository.dart';
import 'package:tanamind/ui/kelola/add_pot/add_pot_screen.dart';

abstract class AddPotViewModel extends State<AddPotScreen> {
  List<File> listImage = new List();
  var xxx;

  TextEditingController title = new TextEditingController();
  TextEditingController label = new TextEditingController();
  TextEditingController desc = new TextEditingController();

  var randomImage = [
    'assets/tanaman/tanaman_4.jpg',
    'assets/tanaman/tanaman_2.jpg',
    'assets/tanaman/tanaman_1.jpg',
    'assets/tanaman/tanaman_5.jpg'
  ];

  onSubmitBtn() async {
    await PotRepository().addPot(title.text, desc.text, xxx).then((value){
      print(value);
    }).catchError((e){
      print(e.toString());
    });
  }
}
