import 'package:flutter/widgets.dart';
import 'package:tanamind/ui/marketplace/list_order/list_order.dart';

abstract class ListOrderViewModel extends State<ListOrderScreen> {
  var list_order = [
    {
      "name": "Bibit Kangkung",
      "price": "Rp. 2.500",
      "qty": "1",
      "date": "3 Desember 2020",
      "order_id": "ID2021",
      "total": "Rp. 2.500",
      "description": "Short Description here...",
      "image": "assets/dummy/bibit_kangkung.jpg"
    },
    {
      "name": "Bibit Kantang",
      "price": "Rp. 10.000",
      "qty": "3",
      "date": "3 Desember 2020",
      "order_id": "ID2022",
      "total": "Rp. 30.000",
      "description": "Short and Long Description here...",
      "image": "assets/dummy/bibit_kentang.jpg"
    },
    {
      "name": "Pot Hidroponik",
      "price": "Rp. 325.000",
      "qty": "1",
      "date": "3 Desember 2020",
      "order_id": "ID2021",
      "total": "Rp. 325.000",
      "description": "Short Description here...",
      "image": "assets/dummy/hidroponik.jpg"
    },
  ];
}
