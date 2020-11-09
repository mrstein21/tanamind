import 'package:flutter/material.dart';
import 'package:tanamind/ui/marketplace/cart/cart_screen.dart';

abstract class CartViewModel extends State<CartScreen> {
  var list_carts = [
    {
      "name": "Bibit Kangkung",
      "price": "Rp. 2.500",
      "qty": "1",
      "total": "Rp. 2.500",
      "description": "Short Description here...",
      "image": "assets/dummy/bibit_kangkung.jpg"
    },
    {
      "name": "Bibit Kantang",
      "price": "Rp. 10.000",
      "qty": "3",
      "total": "Rp. 30.000",
      "description": "Short and Long Description here...",
      "image": "assets/dummy/bibit_kentang.jpg"
    },
    {
      "name": "Pot Hidroponik",
      "price": "Rp. 325.000",
      "qty": "1",
      "total": "Rp. 325.000",
      "description": "Short Description here...",
      "image": "assets/dummy/hidroponik.jpg"
    },
    {
      "name": "Pompa Air Hiroponik",
      "price": "Rp. 100.000",
      "qty": "4",
      "total": "Rp. 400.000",
      "description": "Short Description here...",
      "image": "assets/dummy/pompa_air.jpg"
    },
    {
      "name": "Pot Bunga",
      "price": "Rp. 30.000",
      "qty": "3",
      "total": "Rp. 90.000",
      "description": "Short Description here...",
      "image": "assets/dummy/pot_bunga.jpg"
    }
  ];
}
