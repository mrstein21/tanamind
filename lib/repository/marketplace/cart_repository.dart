import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tanamind/helper/base_url.dart';
import 'package:tanamind/helper/shared_preferences.dart';
import 'package:tanamind/model/marketplace_model/cart_model.dart';

class CartRepository {
  Future getData() async {
    String url = '$base_url/auth/cart';
    String token = await UserPreferences.getUserToken();

    var response =
        await http.get(url, headers: {'Authorization': 'bearer $token'});

    if (response.statusCode == 200) {
      return jsonParse(response.body);
      /*return response.body;*/
    } else {
      print("error repository : ${response.statusCode}\n${response.body}");
      throw Exception();
    }
  }

  Future addData(var id) async {
    String url = '$base_url/auth/cart';
    String token = await UserPreferences.getUserToken();

    var response = await http.post(url,
        headers: {'Authorization': 'bearer $token'}, body: {'item_id': '$id'});

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print("error repository : ${response.statusCode}\n${response.body}");
      throw Exception();
    }
  }

  Future deleteData(var id) async {
    String url = '$base_url/auth/cart/$id/delete';
    String token = await UserPreferences.getUserToken();

    var response =
        await http.post(url, headers: {'Authorization': 'bearer $token'});

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print("error repository : ${response.statusCode}\n${response.body}");
      throw Exception();
    }
  }

  List<CartModel> jsonParse(final response) {
    var json = jsonDecode(response);
    if (json['data'] == null) {
      return List();
    } else {
      var data = json['data'];
      return new List<CartModel>.from(data.map((e) => CartModel.fromJson(e)));
    }
  }
}
