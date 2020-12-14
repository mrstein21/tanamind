import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tanamind/helper/base_url.dart';
import 'package:tanamind/helper/shared_preferences.dart';
import 'package:tanamind/model/kelola_model/plant_model.dart';

class PlantRepository {
  Future<List<PlantCategoryModel>> getData() async {
    String url = '$base_url/auth/tanaman/category';
    var token = await UserPreferences.getUserToken();
    print('token $token');

    var response = await http.get(url,
        headers: {'Authorization': 'bearer $token'});

    print('response = $url \n ${response.body}');

    if (response.statusCode == 200) {
      return jsonParse(response.body);
    } else {
      print('Print error : ${response.statusCode} + ${response.body}');
      throw Exception(['${response.statusCode} + ${response.body}']);
    }
  }

  List<PlantCategoryModel> jsonParse(final response) {
    var json = jsonDecode(response);
    var data = json['data']['response'];

    return new List<PlantCategoryModel>.from(
        data.map((e) => PlantCategoryModel.fromJson(e)));
  }
}
