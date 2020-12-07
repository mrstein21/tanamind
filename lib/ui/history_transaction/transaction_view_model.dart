import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tanamind/ui/history_transaction/transaction_screen.dart';

abstract class TransactionViewModel extends State<TransactionScreen> {
  var listTransaction = [
    {
      'date': '9 Nov 2020',
      'status': 'Selesai',
      'title': 'Lorem Ipsum',
      'qty': '2',
      'price': 'Rp. 25.000',
      'image': 'assets/pot/pot_1.jpg'
    },
    {
      'date': '20 Nov 2020',
      'status': 'Pending',
      'title': 'Lorem Ipsum',
      'qty': '1',
      'price': 'Rp. 55.500',
      'image': 'assets/dummy/bibit_kangkung.jpg'
    },
    {
      'date': '11 Nov 2020',
      'status': 'Selesai',
      'title': 'Lorem Ipsum',
      'qty': '1',
      'price': 'Rp. 25.000',
      'image': 'assets/tanaman/tanaman_3.jpg'
    },
    {
      'date': '11 Nov 2020',
      'status': 'Selesai',
      'title': 'Lorem Ipsum',
      'qty': '5',
      'price': 'Rp. 108.000',
      'image': 'assets/pupuk/pupuk_2.jpg'
    },
    {
      'date': '1 Nov 2020',
      'status': 'Selesai',
      'title': 'Lorem Ipsum',
      'qty': '2',
      'price': 'Rp. 37.200',
      'image': 'assets/bibit/bibit_5.jpg'
    },
    {
      'date': '30 Okt 2020',
      'status': 'Selesai',
      'title': 'Lorem Ipsum',
      'qty': '1',
      'price': 'Rp. 80.000',
      'image': 'assets/tanaman/tanaman_3.jpg'
    },
  ];

  var listDate = ['7 Hari Terakhir', '30 Hari Terakhir', '90 Hari Terakhir'];
}
