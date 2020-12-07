import 'package:flutter/material.dart';
import 'package:tanamind/ui/marketplace/marketplace/build_list_recomendation.dart';
import 'package:tanamind/ui/marketplace/marketplace/build_list_promotion.dart';
import 'marketplace_screen.dart';

abstract class MarketPlaceViewModel extends State<MarketPlaceScreen> {
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

  var category = [
    {"name": "Alat", "icon": Icons.settings},
    {"name": "Pot", "icon": Icons.shopping_basket},
    {"name": "Bibit", "icon": Icons.shop},
    {"name": "Tanaman", "icon": Icons.wb_cloudy},
    {"name": "Tanah", "icon": Icons.camera},
    {"name": "Pupuk", "icon": Icons.scanner},
    {"name": "Lain-lain", "icon": Icons.dashboard}
  ];

  void navigationCategory(int index) {
    if (category[index]['name'] == 'Alat') {
      Navigator.pushNamed(context, '/alat_screen');
    } else if (category[index]['name'] == 'Pot') {
      Navigator.pushNamed(context, '/pot_screen');
    } else if (category[index]['name'] == 'Bibit') {
      Navigator.pushNamed(context, '/bibit_screen');
    } else if (category[index]['name'] == 'Tanaman') {
      Navigator.pushNamed(context, '/tanaman_screen');
    } else if (category[index]['name'] == 'Tanah') {
      Navigator.pushNamed(context, '/tanah_screen');
    } else if (category[index]['name'] == 'Pupuk') {
      Navigator.pushNamed(context, '/pupuk_screen');
    } else if (category[index]['name'] == 'Lain-lain') {
      Navigator.pushNamed(context, '/etc_screen');
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
  var recommended = [
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
    }
  ];
}
