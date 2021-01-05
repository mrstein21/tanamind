import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tanamind/helper/base_url.dart';
import 'package:tanamind/helper/shared_preferences.dart';
import 'package:tanamind/model/favourite_model/favourite_model.dart';

class FavouriteRepository {
  Future<List<FavouriteModel>> getData() async {
    String url = '$base_url/auth/favorite';
    String token = await UserPreferences.getUserToken();

    var response =
        await http.get(url, headers: {'Authorization': 'bearer $token'});

    if (response.statusCode == 200) {
      return jsonParse(response.body);
    } else {
      print("error repository : ${response.statusCode} \n ${response.body}");
      throw Exception('Internal Server Error...');
    }
  }

  List<FavouriteModel> jsonParse(final response) {
    var json = jsonDecode(response);
    if(json['data'] == null){
      return List();
    }else {
      var data = json['data'];

      return new List<FavouriteModel>.from(
          data.map((value) => FavouriteModel.fromJson(value)));
    }
  }


  Future deleteItem(String id) async {
    String url = '$base_url/auth/favorite/$id/delete';
    String token = await UserPreferences.getUserToken();

    var response =
    await http.post(url, headers: {'Authorization': 'bearer $token'});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Error repository : ${response.statusCode} \n ${response.body}');
      throw Exception('Internal Server Error');
    }
  }
}

class FavoriteAdd {
  Future addItem(String id) async {
    String url = '$base_url/auth/favorite';
    String token = await UserPreferences.getUserToken();

    var response = await http.post(url,
        headers: {'Authorization': 'bearer $token'}, body: {'item_id': id});

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print("error repository : ${response.statusCode} \n ${response.body}");
      throw Exception('Internal Server Error');
    }
  }
}
