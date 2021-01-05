import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tanamind/cubit/favourite/add_fav_cubit.dart';
import 'package:tanamind/global.dart';
import 'package:tanamind/repository/marketplace/cart_repository.dart';
import 'package:tanamind/ui/marketplace/detail_item/detail_item.dart';
import 'package:tanamind/ui/widget/widget_helper.dart';

abstract class DetailItemViewModel extends State<DetailItem> {
  AddFavCubit fav;

  var item = {
    "name": "Pompa Air Hiroponik",
    "price": "Rp. 100.000",
    "description": "Short Description here...",
    "image": "assets/dummy/pompa_air.jpg"
  };
  var list_items = [
    {
      "name": "Bibit Kangkung",
      "price": "Rp. 2.500",
      "description": "Short Description here...",
      "image": "assets/dummy/bibit_kangkung.jpg"
    },
    {
      "name": "Bibit Kantang",
      "price": "Rp. 10.000",
      "description": "Short and Long Description here...",
      "image": "assets/dummy/bibit_kentang.jpg"
    },
    {
      "name": "Pot Hidroponik",
      "price": "Rp. 325.000",
      "description": "Short Description here...",
      "image": "assets/dummy/hidroponik.jpg"
    },
    {
      "name": "Pompa Air Hiroponik",
      "price": "Rp. 100.000",
      "description": "Short Description here...",
      "image": "assets/dummy/pompa_air.jpg"
    },
    {
      "name": "Pot Bunga",
      "price": "Rp. 30.000",
      "description": "Short Description here...",
      "image": "assets/dummy/pot_bunga.jpg"
    }
  ];

  var list_comment = [
    {
      "name": "Betram Gillfoyle",
      "image": "assets/dummy/gillfoyle.jpg",
      "rate": 4.0,
      "comment": "Good items, fellas !"
    },
    {
      "name": "Betram Gillfoyle",
      "image": "assets/dummy/gillfoyle.jpg",
      "rate": 4.0,
      "comment": "Good items, fellas !"
    },
    {
      "name": "Betram Gillfoyle",
      "image": "assets/dummy/gillfoyle.jpg",
      "rate": 4.0,
      "comment": "Good items, fellas !"
    }
  ];

  Future onAddCart(var id) async {
    print(tokenGlobal);
    if (tokenGlobal != null) {
      await CartRepository().addData('$id').then((value) {
        print(value);
        var json = jsonDecode(value);
        if (json['status'] == 200) {
          var message = json['message'];
          flushBar(context, message);
        } else {
          flushBar(context, 'Gagal menambahkan item');
        }
      }).catchError((e) {
        flushBar(context, 'Internal Server Error...');
      });
    } else {
      flushBar(context, 'Anda harus login terlebih dahulu');
    }
  }

  Future onAddFav(var id) async {
    if (tokenGlobal != null) {
      fav.addItem('$id');
    } else {
      flushBar(context, 'Anda harus login terlebih dahulu');
    }
  }
}
