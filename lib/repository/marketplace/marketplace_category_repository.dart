import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tanamind/helper/base_url.dart';
import 'package:tanamind/model/marketplace_model/category_model.dart';

class CategoryRepository {
  Future<List<MarketplaceCategoryModel>> getData() async {
    String url = '$base_url/item/category';

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonParse(response.body);
    } else {
      print("repository error : ${response.statusCode}\n${response.body}");
      throw Exception('Something went wrong...');
    }
  }

  List<MarketplaceCategoryModel> jsonParse(final response) {
    var json = jsonDecode(response);
    var data = json['data'];

    return new List<MarketplaceCategoryModel>.from(
        data.map((value) => MarketplaceCategoryModel.fromJson(value)));
  }
}
