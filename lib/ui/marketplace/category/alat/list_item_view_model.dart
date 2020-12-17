import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanamind/cubit/favourite/add_delete_cubit.dart';
import 'package:tanamind/ui/marketplace/category/alat/list_item.dart';

abstract class ListItemViewModel extends State<ListItem> {
  FavoriteActionCubit fav;
  bool onTapped;

  Future onTapButtonFav(final id) async {
      fav.addItem('$id');
  }

  var dummyImage = [
    {'image': 'assets/alat/alat_1.jpg'},
    {'image': 'assets/alat/alat_2.jpg'},
    {'image': 'assets/alat/alat_3.jpg'},
    {'image': 'assets/alat/alat_4.jpg'},
    {'image': 'assets/alat/alat_5.jpg'},
    {'image': 'assets/alat/alat_6.jpg'},
    {'image': 'assets/alat/alat_1.jpg'},
    {'image': 'assets/alat/alat_2.jpg'},
    {'image': 'assets/alat/alat_3.jpg'},
    {'image': 'assets/alat/alat_4.jpg'},
    {'image': 'assets/alat/alat_5.jpg'},
    {'image': 'assets/alat/alat_6.jpg'},
    {'image': 'assets/alat/alat_1.jpg'},
    {'image': 'assets/alat/alat_2.jpg'},
    {'image': 'assets/alat/alat_3.jpg'},
    {'image': 'assets/alat/alat_4.jpg'},
    {'image': 'assets/alat/alat_5.jpg'},
    {'image': 'assets/alat/alat_6.jpg'},
    {'image': 'assets/alat/alat_1.jpg'},
    {'image': 'assets/alat/alat_2.jpg'},
    {'image': 'assets/alat/alat_3.jpg'},
    {'image': 'assets/alat/alat_4.jpg'},
    {'image': 'assets/alat/alat_5.jpg'},
    {'image': 'assets/alat/alat_6.jpg'},
    {'image': 'assets/alat/alat_1.jpg'},
    {'image': 'assets/alat/alat_2.jpg'},
    {'image': 'assets/alat/alat_3.jpg'},
    {'image': 'assets/alat/alat_4.jpg'},
    {'image': 'assets/alat/alat_5.jpg'},
    {'image': 'assets/alat/alat_6.jpg'},
  ];
}
