import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tanamind/ui/marketplace/category/lain_lain/etc_screen.dart';

abstract class EtcViewModel extends State<EtcScreen>{
  var listCategories = [
    {'name': 'Bestseller'},
    {'name': 'Favourites'},
    {'name': 'The best'},
    {'name': 'The most recents'},
    {'name': 'Low prices'},
  ];

  var listEtc = [
    {
      'title': 'Lorem ipsum dolor sit amet',
      'rate': 3.0,
      'price': 'Rp. 80.000',
      'rating': '400',
      'image': 'assets/pot/pot_1.jpg'
    },
    {
      'title': 'consectetur adipiscing elit. Vivamus finibus in elit at iaculis',
      'rate': 2.5,
      'price': 'Rp. 120.000',
      'rating': '275',
      'image': 'assets/tanah/tanah_2.jpg'
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
      'image': 'assets/pupuk/pupuk_4.jpg'
    },
    {
      'title': 'Maecenas posuere nisl tellus, sed pulvinar nisl commodo in',
      'rate': 4.0,
      'price': 'Rp. 225.000',
      'rating': '395',
      'image': 'assets/tanaman/tanaman_5.jpg'
    },
    {
      'title': 'rutrum consectetur nulla Quisque sodales nisl quam, ac ornare nisl interdum vel',
      'rate': 3.0,
      'price': 'Rp. 36.000',
      'rating': '1025',
      'image': 'assets/alat/alat_6.jpg'
    },
  ];
}