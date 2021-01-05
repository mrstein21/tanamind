import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanamind/cubit/favourite/add_fav_cubit.dart';
import 'package:tanamind/global.dart';
import 'package:tanamind/ui/marketplace/category/list_item.dart';
import 'package:tanamind/ui/widget/widget_helper.dart';

abstract class ListItemViewModel extends State<ListItem> {
  AddFavCubit fav;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future onTapButtonFav(final id) async {
    if(tokenGlobal != null){
      fav.addItem('$id');
    }else{
      flushBar(context, 'Anda harus login terlebih dahulu');
    }
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
