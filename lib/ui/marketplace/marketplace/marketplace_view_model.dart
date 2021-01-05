import 'package:flutter/material.dart';
import 'package:tanamind/cubit/favourite/add_fav_cubit.dart';
import 'package:tanamind/cubit/marketplace/cart/add_cart_cubit.dart';
import 'package:tanamind/cubit/marketplace/similar_item/similar_item_cubit.dart';
import 'package:tanamind/global.dart';
import 'package:tanamind/ui/marketplace/marketplace/build_list_promotion.dart';
import 'package:tanamind/ui/marketplace/marketplace/build_list_recomendation.dart';
import 'package:tanamind/ui/widget/widget_helper.dart';

import 'marketplace_screen.dart';

abstract class MarketPlaceViewModel extends State<MarketPlaceScreen> {
  SimilarCubit cubit;
  AddFavCubit fav;
  AddCartCubit cart;

  var list_items = [
    {"image": "assets/dummy/bibit_kangkung.jpg"},
    {"image": "assets/dummy/bibit_kentang.jpg"},
    {"image": "assets/dummy/hidroponik.jpg"},
    {"image": "assets/dummy/pompa_air.jpg"},
    {"image": "assets/dummy/pot_bunga.jpg"},
    {"image": "assets/dummy/bibit_kangkung.jpg"},
    {"image": "assets/dummy/bibit_kentang.jpg"},
    {"image": "assets/dummy/hidroponik.jpg"},
    {"image": "assets/dummy/pompa_air.jpg"},
    {"image": "assets/dummy/pot_bunga.jpg"},
    {"image": "assets/dummy/bibit_kangkung.jpg"},
    {"image": "assets/dummy/bibit_kentang.jpg"},
    {"image": "assets/dummy/hidroponik.jpg"},
    {"image": "assets/dummy/pompa_air.jpg"},
    {"image": "assets/dummy/pot_bunga.jpg"},
    {"image": "assets/dummy/bibit_kangkung.jpg"},
    {"image": "assets/dummy/bibit_kentang.jpg"},
    {"image": "assets/dummy/hidroponik.jpg"},
    {"image": "assets/dummy/pompa_air.jpg"},
  ];

  Future onAddCart(var id) async {
    print(tokenGlobal);
    if (tokenGlobal != null) {
      cart.addItem('$id');
    } else {
      flushBar(context, 'Anda harus login terlebih dahulu');
    }
  }

  Future onTapButtonFav(final id) async {
    if(tokenGlobal != null){
      fav.addItem('$id');
    }else{
      flushBar(context, 'Anda harus login terlebih dahulu');
    }
  }
}

abstract class ListPromotionModel extends State<ListPromotion> {
  var promo = [
    "assets/dummy/promo1.jpg",
    "assets/dummy/promo2.jpg",
    "assets/dummy/promo3.jpg",
    "assets/dummy/promo4.jpg"
  ];
}

abstract class ListRecommendationModel extends State<ListRecommendation> {
  AddFavCubit fav;
  SimilarCubit cubit;
  AddCartCubit cart;

  var recommended = [
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
    {"image": "assets/dummy/hidroponik.jpg"}
  ];

  Future onTapAddFav(var id) async {
    if (tokenGlobal != null) {
      fav.addItem('$id');
    } else {
      flushBar(context, 'Anda harus login terlebih dahulu');
    }
  }

  Future onAddCart(var id) async {
    print(tokenGlobal);
    if (tokenGlobal != null) {
      cart.addItem('$id');
    } else {
      flushBar(context, 'Anda harus login terlebih dahulu');
    }
  }
}
