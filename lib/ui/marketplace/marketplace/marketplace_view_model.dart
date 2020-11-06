import 'package:flutter/material.dart';
import 'marketplace_screen.dart';

abstract class MarketPlaceViewModel extends State<MarketPlaceScreen>{
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

  var promo=[
        "assets/dummy/promo1.jpg",
        "assets/dummy/promo2.jpg",
        "assets/dummy/promo3.jpg",
        "assets/dummy/promo4.jpg"
  ];

  var category=[
    {
      "name":"Alat",
      "icon": Icons.settings
    },{
      "name":"Pot",
      "icon":Icons.shopping_basket
    },
    {
      "name":"Bibit",
      "icon":Icons.shop
    },{
       "name":"Tanaman",
      "icon":Icons.wb_cloudy
    },{
       "name":"Tanah",
       "icon":Icons.camera
    },{
     "name":"Pupuk",
      "icon":Icons.scanner
     },
    {
      "name":"Lain-lain",
      "icon":Icons.dashboard
    }
  ];

  var recommended=[
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

    }
  ];

}