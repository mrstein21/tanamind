import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tanamind/cubit/favourite/add_fav_cubit.dart';
import 'package:tanamind/ui/marketplace/similar_item/similar_screen.dart';
import 'package:tanamind/ui/widget/widget_helper.dart';

import '../../../global.dart';

abstract class SimilarViewModel extends State<SimilarScreen> {

  AddFavCubit fav;

  var listImage = [
    {'image': 'assets/alat/alat_1.jpg'},
    {'image': 'assets/alat/alat_2.jpg'},
    {'image': 'assets/alat/alat_3.jpg'},
    {'image': 'assets/alat/alat_4.jpg'},
    {'image': 'assets/alat/alat_5.jpg'},
    {'image': 'assets/alat/alat_6.jpg'},
  ];

  Future onTapButtonFav(final id) async {
    if(tokenGlobal != null){
      fav.addItem('$id');
    }else{
      flushBar(context, 'Anda harus login terlebih dahulu');
    }
  }
}
