import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanamind/cubit/kelola/plant_category_cubit.dart';
import 'package:tanamind/cubit/kelola/plant_category_state.dart';
import 'package:tanamind/model/kelola_model/plant_model.dart';
import 'package:tanamind/ui/kelola/kelola/kelola_screen.dart';

abstract class KelolaViewModel extends State<KelolaScreen>{
  var listTanaman = [
    {'title':'Cengek', 'panen':0.5,'image':'assets/tanaman/tanaman_5.jpg'},
    {'title':'FakCoy', 'panen':0.1,'image':'assets/tanaman/tanaman_3.jpg'},
    {'title':'Bayam', 'panen':0.2,'image':'assets/tanaman/tanaman_1.jpg'},
    {'title':'Toge', 'panen':0.3,'image':'assets/tanaman/tanaman_2.jpg'},
    {'title':'Lidah Buaya', 'panen':0.2,'image':'assets/tanaman/tanaman_4.jpg'},
  ];

}