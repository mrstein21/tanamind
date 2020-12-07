import 'package:flutter/material.dart';
import 'package:tanamind/ui/list_plan/list_plant_screen.dart';

abstract class ListPlantViewModel extends State<ListPlantScreen>{
  var list_plant=[
    {
      "name":"Pokcay",
      "image":"assets/tanaman/tanaman_3.jpg",
      "type":"Semai",
      "task_count":"3",
      "note":"Pindah tanam dalam 2 hari",
      "task_detail":[
        "Pemberian Nutrisi"
      ]
    },
    {
      "name":"Bayam hijau",
      "image":"assets/tanaman/tanaman_1.jpg",
      "type":"Semai",
      "task_count":"2",
      "note":"Panen dalam dalam 12 hari",
      "task_detail":[
        "Pemberian Nutrisi",
        "Pemberian Nutrisi"
      ]
    },
  ];
}