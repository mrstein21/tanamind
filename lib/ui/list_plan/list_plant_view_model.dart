import 'package:flutter/material.dart';
import 'package:tanamind/ui/list_plan/list_plant.dart';

abstract class ListPlantViewModel extends State<ListPlant>{
  var list_plant=[
    {
      "name":"Pokcay",
      "image":"assets/pokcoy.jpg",
      "type":"Semai",
      "task_count":"3",
      "note":"Pindah tanam dalam 2 hari",
      "task_detail":[
        "Pemberian Nutrisi"
      ]
    },
    {
      "name":"Bayam hijau",
      "image":"assets/bayam.jpg",
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