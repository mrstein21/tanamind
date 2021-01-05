import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'helper/base_url.dart';
import 'model/marketplace_model/category_item_model.dart';

class NEWEW extends StatefulWidget {
  @override
  _NEWEWState createState() => _NEWEWState();
}

class _NEWEWState extends State<NEWEW> {
  List<CategoryItem> list = new List<CategoryItem>();

  getData() async {
    await repopo().getData().then((value) {
      list = value;
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: list.length,
          shrinkWrap: true,
          itemBuilder: (context, index){
            return Text(list[index].name);
          },),
    );
  }
}

class repopo {
  Future getData() async {
    /*String url = '$base_url/item/1/category/filter?page=1';

    var x = ['is_promo', 'is_promo'];
    var y = ["created_at", "asc"];

    Map<String, String> headers = {'Content-Type': 'application/json'};
    final msg = jsonEncode({"filter": x, "sort": y, "keyword": "p"});

    var response = await http.post(url, headers: headers, body: msg);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return jsonParse(response.body);
    } else {
      print("error repository : ${response.statusCode} : \n ${response.body}");
      throw Exception('Internal Server Error...');
    }*/

    String url = '$base_url/item/1/category?page=2';

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json['message'] != null) {
        return json;
      } else {
        return jsonParse(response.body);
      }
    } else {
      print("error repository : ${response.statusCode} : \n ${response.body}");
      throw Exception('Internal Server Error...');
    }
  }

  List<CategoryItem> jsonParse(final response) {
    var json = jsonDecode(response);
    var data = json['data']['data'];

    print('data $data');
    return new List<CategoryItem>.from(
        data.map((value) => CategoryItem.fromJson(value)));

  }
}
