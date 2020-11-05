import 'package:flutter/material.dart';
import 'package:tanamind/ui/marketplace/favourite/favourite.dart';

abstract class FavouriteViewModel extends State<Favourite>{
  var list_favourite=[
    {
      "name":"Bibit Kangkung",
      "price":"Rp. 2.500",
      "description":"Short Description here...",
      "image":"assets/dummy/bibit_kangkung.jpg"
    },{
      "name":"Bibit Kentang",
      "price":"Rp. 10.000",
      "description":"Short and Long Description here...",
      "image":"assets/dummy/bibit_kentang.jpg"
    },{
      "name":"Pot Hidroponik",
      "price":"Rp. 325.000",
      "description":"Short Description here...",
      "image":"assets/dummy/hidroponik.jpg"

    },
  ];
}