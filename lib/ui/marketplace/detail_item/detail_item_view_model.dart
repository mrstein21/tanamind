import 'package:flutter/material.dart';
import 'package:tanamind/ui/marketplace/detail_item/detail_item.dart';

abstract class DetailItemViewModel extends State<DetailItem>{
  var item={
    "name":"Pompa Air Hiroponik",
    "price":"Rp. 100.000",
    "description":"Short Description here...",
    "image":"assets/dummy/pompa_air.jpg"
  };
  var list_items=[
    {
      "name":"Bibit Kangkung",
      "price":"Rp. 2.500",
      "description":"Short Description here...",
      "image":"assets/dummy/bibit_kangkung.jpg"
    },{
      "name":"Bibit Kantang",
      "price":"Rp. 10.000",
      "description":"Short and Long Description here...",
      "image":"assets/dummy/bibit_kentang.jpg"
    },{
      "name":"Pot Hidroponik",
      "price":"Rp. 325.000",
      "description":"Short Description here...",
      "image":"assets/dummy/hidroponik.jpg"

    },{
      "name":"Pompa Air Hiroponik",
      "price":"Rp. 100.000",
      "description":"Short Description here...",
      "image":"assets/dummy/pompa_air.jpg"

    },{
      "name":"Pot Bunga",
      "price":"Rp. 30.000",
      "description":"Short Description here...",
      "image":"assets/dummy/pot_bunga.jpg"

    }
  ];

  var list_comment=[
    {
      "name":"Betram Gillfoyle",
      "image":"assets/dummy/gillfoyle.jpg",
      "rate":4.0,
      "comment":"Good items, fellas !"
    },{
      "name":"Betram Gillfoyle",
      "image":"assets/dummy/gillfoyle.jpg",
      "rate":4.0,
      "comment":"Good items, fellas !"

    },{
      "name":"Betram Gillfoyle",
      "image":"assets/dummy/gillfoyle.jpg",
      "rate":4.0,
      "comment":"Good items, fellas !"
    }
  ];
}