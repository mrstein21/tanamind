import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tanamind/ui/marketplace/category/bibit_benih/bibit_screen.dart';

abstract class BibitViewModel extends State<BibitScreen>{
  var listCategories = [
    {'name': 'Bestseller'},
    {'name': 'Favourites'},
    {'name': 'The best'},
    {'name': 'The most recents'},
    {'name': 'Low prices'},
  ];

  var listBibit = [
    {
      'title': 'Lorem ipsum dolor sit amet',
      'rate': 3.0,
      'price': 'Rp. 80.000',
      'rating': '400',
      'image': 'assets/bibit/bibit_1.jpg'
    },
    {
      'title': 'consectetur adipiscing elit. Vivamus finibus in elit at iaculis',
      'rate': 2.5,
      'price': 'Rp. 120.000',
      'rating': '275',
      'image': 'assets/bibit/bibit_2.jpg'
    },
    {
      'title': 'Donec sapien justo, pulvinar at mi id',
      'rate': 2.0,
      'price': 'Rp. 45.000',
      'rating': '669',
      'image': 'assets/bibit/bibit_3.jpg'
    },
    {
      'title': 'Maecenas blandit leo eu diam rutrum, quis lacinia risus convallis. Nunc mattis a magna nec sagittis',
      'rate': 3.5,
      'price': 'Rp. 110.000',
      'rating': '129',
      'image': 'assets/bibit/bibit_4.jpg'
    },
    {
      'title': 'Maecenas posuere nisl tellus, sed pulvinar nisl commodo in',
      'rate': 4.0,
      'price': 'Rp. 225.000',
      'rating': '395',
      'image': 'assets/bibit/bibit_5.jpg'
    },
    {
      'title': 'rutrum consectetur nulla Quisque sodales nisl quam, ac ornare nisl interdum vel',
      'rate': 3.0,
      'price': 'Rp. 36.000',
      'rating': '1025',
      'image': 'assets/bibit/bibit_6.jpg'
    },
  ];
}