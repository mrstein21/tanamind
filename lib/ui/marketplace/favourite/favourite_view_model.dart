import 'package:flutter/material.dart';
import 'package:tanamind/cubit/favourite/favourite_cubit.dart';
import 'package:tanamind/cubit/marketplace/cart/add_cart_cubit.dart';
import 'package:tanamind/ui/marketplace/favourite/favourite.dart';

abstract class FavouriteViewModel extends State<FavouriteScreen> {

  FavouriteCubit cubit;
  AddCartCubit cart;
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  var list_favourite = [
    {"image": "assets/dummy/bibit_kangkung.jpg"},
    {"image": "assets/dummy/bibit_kentang.jpg"},
    {"image": "assets/dummy/hidroponik.jpg"},
    {"image": "assets/dummy/bibit_kangkung.jpg"},
    {"image": "assets/dummy/bibit_kentang.jpg"},
    {"image": "assets/dummy/hidroponik.jpg"},
    {"image": "assets/dummy/bibit_kangkung.jpg"},
    {"image": "assets/dummy/bibit_kentang.jpg"},
    {"image": "assets/dummy/hidroponik.jpg"},
    {"image": "assets/dummy/bibit_kangkung.jpg"},
    {"image": "assets/dummy/bibit_kentang.jpg"},
    {"image": "assets/dummy/hidroponik.jpg"},
    {"image": "assets/dummy/bibit_kangkung.jpg"},
    {"image": "assets/dummy/bibit_kentang.jpg"},
    {"image": "assets/dummy/hidroponik.jpg"},
  ];
}
