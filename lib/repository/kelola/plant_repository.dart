import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tanamind/helper/base_url.dart';
import 'package:tanamind/helper/shared_preferences.dart';
import 'package:tanamind/model/kelola_model/plant_model.dart';

class PlantRepository {
  Future getData() async {
    String url = '$base_url/auth/tanaman';
    String token = await UserPreferences.getUserToken();

    var response =
        await http.get(url, headers: {"Authorization": 'bearer $token'});

    if (response.statusCode == 200) {
      return jsonParse(response.body);
    } else {
      print("error repository : ${response.statusCode}\n${response.body}");
      throw Exception();
    }
  }

  Future getCategory(var key) async {
    String url = '$base_url/auth/tanaman/$key/category';
    String token = await UserPreferences.getUserToken();

    var response =
        await http.get(url, headers: {'Authorization': 'bearer $token'});

    if (response.statusCode == 200) {
      return jsonParse(response.body);
    } else {
      print("error repository : ${response.statusCode}\n${response.body}");
      throw Exception();
    }
  }

  Future getSearch(var key) async {
    String url = '$base_url/auth/tanaman/search';
    String token = await UserPreferences.getUserToken();

    var response = await http.post(url,
        headers: {'Authorization': 'bearer $token'}, body: {'keyword': key});

    if (response.statusCode == 200) {
      return jsonParse(response.body);
    } else {
      print("error repository : ${response.statusCode}\n${response.body}");
      throw Exception();
    }
  }

  List<PlantModel> jsonParse(final response) {
    var json = jsonDecode(response);
    var data = json['data'];

    print(data);

    return new List<PlantModel>.from(data.map((e) => PlantModel.fromJson(e)));
  }
}
