import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'file:///C:/Users/Drow/AndroidStudioProjects/CODEHOUSE_Tanamind/lib/ui/kelola/kelola/kelola_screen.dart';

abstract class KelolaViewModel extends State<KelolaScreen>{
  var listTanaman = [
    {'title':'Cengek Jeletot', 'panen':'5','image':'assets/cengek.jpg'},
    {'title':'FakCoy', 'panen':'1','image':'assets/pokcoy.jpg'},
    {'title':'Bayam', 'panen':'3','image':'assets/bayam.jpg'},
    {'title':'Toge', 'panen':'3','image':'assets/toge.jpg'},
    {'title':'Lidah Buaya', 'panen':'2','image':'assets/lidahbuaya.jpg'},
  ];

  var listFilter = [
    'Benih',
    'Tungas',
    'Bibit',
    'Panen',
  ];
}