import 'package:flutter/material.dart';
import 'package:tanamind/ui/auth/login/login_screen.dart';
import 'package:tanamind/ui/auth/register/register_screen.dart';
import 'package:tanamind/ui/forum/detail_post/detail_post.dart';
import 'package:tanamind/ui/forum/forum_home/forum_screen.dart';
import 'package:tanamind/ui/history_transaction/transaction_screen.dart';
import 'package:tanamind/ui/home/home_screen.dart';
import 'package:tanamind/ui/kelola/add_pot/add_pot_screen.dart';
import 'package:tanamind/ui/kelola/add_pot/preview_image_screen.dart';
import 'package:tanamind/ui/kelola/detail/detail_screen.dart';
import 'package:tanamind/ui/kelola/detail/detail_screen_2.dart';
import 'package:tanamind/ui/kelola/kelola/kelola_screen.dart';
import 'package:tanamind/ui/kelola/my_plant/my_plant_screen.dart';
import 'package:tanamind/ui/list_plan/list_plant_screen.dart';
import 'package:tanamind/ui/marketplace/cart/cart_screen.dart';
import 'package:tanamind/ui/marketplace/category/category_screen.dart';
import 'package:tanamind/ui/marketplace/detail_item/detail_item.dart';
import 'package:tanamind/ui/marketplace/favourite/favourite.dart';
import 'package:tanamind/ui/marketplace/list_order/list_order.dart';
import 'package:tanamind/ui/my_store/my_store_screen.dart';
import 'package:tanamind/ui/profile/edit_profile_screen.dart';
import 'package:tanamind/ui/profile/profile_screen.dart';

import 'ui/marketplace/marketplace/marketplace_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/home': (BuildContext context) => HomeScreen(
        title: "Tanamind",
      ),

  /*auth route*/
  '/login': (BuildContext context) => LoginScreen(),
  '/register': (BuildContext context) => RegisterScreen(),
  '/kelola_screen': (BuildContext context) => KelolaScreen(),
  '/profile_screen': (BuildContext context) => ProfileScreen(),

  /*market route*/
  '/market': (BuildContext context) => MarketPlaceScreen(),
  '/list_order': (BuildContext context) => ListOrderScreen(),
  '/detail_item': (BuildContext context) => DetailItem(),
  '/detail_post': (BuildContext context) => DetailPost(),

  /*market category*/
  '/alat_screen': (BuildContext context) => CategoryScreen(),

  /*navigation drawer route*/
  '/favourite': (BuildContext context) => FavouriteScreen(),
  '/forum': (BuildContext context) => ForumScreen(),
  '/cart': (BuildContext context) => CartScreen(),
  '/setting': (BuildContext context) => null,
  '/order': (BuildContext context) => null,

  /*list plan and reminder*/
  '/list_plants': (BuildContext context) => ListPlantScreen(),

  /*my plant route*/
  '/add_pot': (BuildContext context) => AddPotScreen(),
  '/list_tanamanku': (BuildContext context) => MyPlantScreen(),
  '/detail_list_tanamanku': (BuildContext context) => DetailTanamanKu(),
  '/detail_tanaman': (BuildContext context) => DetailTanaman(),
  '/preview_image': (BuildContext context) => PreviewImage(),

  /*account route*/
  '/edit_profile': (BuildContext context) => EditProfileScreen(),
  '/my_store': (BuildContext context) => MyStoreScreen(),
  '/history_transaksi': (BuildContext context) => TransactionScreen(),
  // '/MarketSelector': (BuildContext context) => MarketSelector(),
};

/*NAVIGATION ROUTES WITH ANIMATION TRANSITION*/

/*PageRouteBuilder pageRouteBuilder(var routes) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      if(routes == '/history_transaksi'){
        return TransactionScreen();
      }else{
        return null;
      }
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
       */ /*return SlideTransition(
         position: animation.drive(
           Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero),
         ),
         child: SlideTransition(
           position: Tween<Offset>(
             begin: Offset.zero,
             end: Offset(0.0, 1.0),
           ).animate(secondaryAnimation),
           child: child,
         ),
       );*/ /*
       */ /*return ScaleTransition(
         scale: animation.drive(
           Tween<double>(begin: 0.0, end: 1.0).chain(
             CurveTween(
               curve: Interval(0.0, 0.5, curve: Curves.decelerate),
             ),
           ),
         ),
         child: ScaleTransition(
           scale: Tween<double>(begin: 1.5, end: 1.0).animate(
             CurvedAnimation(
               parent: animation,
               curve: Interval(0.5, 1.0, curve: Curves.decelerate),
             ),
           ),
           child: child,
         ),
       );*/ /*
      return ScaleTransition(
        scale: CurvedAnimation(parent: animation, curve: Curves.easeOutSine),
        child: child,
      );
    },
    transitionDuration: const Duration(seconds: 1),
  );
}*/
