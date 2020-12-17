import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tanamind/helper/base_url.dart';
import 'package:tanamind/model/marketplace_model/category_item_model.dart';

class CategoryItemRepository {
  Future getData(String id) async {
    String url = '$base_url/item/$id/category';

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if(json['message'] != null){
        return response.body;
      }
      else{
        return jsonParse(response.body);
      }
    } else {
      print("error repository : ${response.statusCode} : \n ${response.body}");
      throw Exception('Internal Server Error...');
    }
  }

  List<CategoryItem> jsonParse(final response) {
    var json = jsonDecode(response);
    var data = json['data']['response'];

    return new List<CategoryItem>.from(
        data.map((value) => CategoryItem.fromJson(value)));
  }
}
