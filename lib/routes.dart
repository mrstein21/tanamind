
import 'package:flutter/material.dart';
import 'package:tanamind/main.dart';
import 'package:tanamind/ui/forum/detail_post/detail_post.dart';
import 'package:tanamind/ui/forum/forum_home/forum_home.dart';
import 'package:tanamind/ui/list_plan/list_plant.dart';
import 'package:tanamind/ui/marketplace/cart/cart.dart';
import 'package:tanamind/ui/marketplace/detail_item/detail_item.dart';
import 'package:tanamind/ui/marketplace/favourite/favourite.dart';
import 'package:tanamind/ui/marketplace/home_marketplace/home_marketplace.dart';
import 'package:tanamind/ui/marketplace/list_order/list_order.dart';

final Map<String, WidgetBuilder> routes = {
  '/home': (BuildContext context) => MyHomePage(title: "Tanamind",),
  '/cart': (BuildContext context) => Cart(),
  '/market': (BuildContext context) => MarketPlace(),
  '/list_plants': (BuildContext context) => ListPlant(),
  '/favourite': (BuildContext context) => Favourite(),
  '/forum': (BuildContext context) => ForumHome(),
  '/detail_post': (BuildContext context) => DetailPost(),
  '/detail_item': (BuildContext context) => DetailItem(),
  '/list_order': (BuildContext context) => ListOrder(),
  // '/MarketSelector': (BuildContext context) => MarketSelector(),
};