import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanamind/cubit/kelola/plant/plant_cubit.dart';
import 'package:tanamind/cubit/kelola/plant_category_cubit.dart';
import 'package:tanamind/cubit/kelola/plant_category_state.dart';
import 'package:tanamind/cubit/kelola/pot/pot_cubit.dart';
import 'package:tanamind/model/kelola_model/plant_category_model.dart';
import 'package:tanamind/ui/kelola/kelola/kelola_screen.dart';

abstract class KelolaViewModel extends State<KelolaScreen>{

  PlantCubit plant;
  PlantCategoryCubit category;
  PotCubit pot;
  double animatedWidth = 0;
  var selectedIndex;
  var selectedIndexRight;
  TextEditingController search = new TextEditingController();

  void onSearch(var key){
    if(search.text.isNotEmpty){
      plant.getSearch(key);
    }else{
      plant.getData();
    }
  }

  static String delete = 'Delete Pot';

  List<String> popButton = <String>[
    delete,
  ];

  var idPot;

  void choiceAction(String choice) {
    if (choice == delete) {
      print('$idPot');
      pot.deleteItem('$idPot');
    } else if (choice == delete) {
      print('Delete');
    }
  }


  var listTanaman = [
    {'title':'Cengek', 'panen':0.5,'image':'assets/tanaman/tanaman_5.jpg'},
    {'title':'FakCoy', 'panen':0.1,'image':'assets/tanaman/tanaman_3.jpg'},
    {'title':'Bayam', 'panen':0.2,'image':'assets/tanaman/tanaman_1.jpg'},
    {'title':'Toge', 'panen':0.3,'image':'assets/tanaman/tanaman_2.jpg'},
    {'title':'Lidah Buaya', 'panen':0.2,'image':'assets/tanaman/tanaman_4.jpg'},
  ];

}