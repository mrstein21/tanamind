import 'package:flutter/material.dart';
import 'package:tanamind/ui/forum/detail_post/detail_post.dart';
import 'package:tanamind/ui/forum/forum_home/forum_screen.dart';
import 'package:tanamind/ui/home/home_screen.dart';
import 'package:tanamind/ui/kelola/detail/detail_screen.dart';
import 'package:tanamind/ui/kelola/my_plant/my_plant_screen.dart';
import 'package:tanamind/ui/list_plan/list_plant_screen.dart';
import 'package:tanamind/ui/marketplace/cart/cart_screen.dart';
import 'package:tanamind/ui/marketplace/detail_item/detail_item.dart';
import 'package:tanamind/ui/marketplace/favourite/favourite.dart';
import 'package:tanamind/ui/marketplace/list_order/list_order.dart';

import 'ui/marketplace/marketplace/marketplace_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/home': (BuildContext context) => HomeScreen(
        title: "Tanamind",
      ),
  '/cart': (BuildContext context) => CartScreen(),
  '/market': (BuildContext context) => MarketPlaceScreen(),
  '/list_plants': (BuildContext context) => ListPlantScreen(),
  '/favourite': (BuildContext context) => FavouriteScreen(),
  '/forum': (BuildContext context) => ForumScreen(),
  '/detail_post': (BuildContext context) => DetailPost(),
  '/detail_item': (BuildContext context) => DetailItem(),
  '/list_order': (BuildContext context) => ListOrderScreen(),
  '/list_tanamanku': (BuildContext context) => MyPlantScreen(),
  '/detail_list_tanamanku': (BuildContext context) => DetailTanamanKu(),
  // '/MarketSelector': (BuildContext context) => MarketSelector(),
};
