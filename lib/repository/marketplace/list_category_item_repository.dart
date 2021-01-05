import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tanamind/helper/base_url.dart';
import 'package:tanamind/model/marketplace_model/category_item_model.dart';

class CategoryItemRepository {
  Future getData(String id, int page) async {
    String url = '$base_url/item/$id/category?page=$page';

    var response = await http.get(url);

    print(url);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json['message'] != null) {
        print('message not null ${json['message']}');
        return jsonParse(response.body);
      } else {
        print('message null');
        return jsonParse(response.body);
      }
    } else {
      print("error repository : ${response.statusCode} : \n ${response.body}");
      throw Exception('Internal Server Error...');
    }
  }

  Future getFilter(String id, String page, var filter, var sort) async {
    String url = '$base_url/item/$id/category/filter?page=$page';

    Map<String, String> headers = {'Content-Type': 'application/json'};
    final msg = jsonEncode({"filter": filter, "sort": sort, "keyword": ""});

    var response = await http.post(url, headers: headers, body: msg);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json['message'] != null) {
        return jsonParse(response.body);
      } else {
        return jsonParse(response.body);
      }
    } else {
      print("error repository : ${response.statusCode} : \n ${response.body}");
      throw Exception('Internal Server Error...');
    }
  }

  Future getSearch(
      String id, String page, var filter, var sort, var key) async {
    String url = '$base_url/item/$id/category/filter?page=$page';

    print('key search : $key');

    Map<String, String> headers = {'Content-Type': 'application/json'};
    final msg = jsonEncode({"filter": [], "sort": [], "keyword": key});

    var response = await http.post(url, headers: headers, body: msg);

    print('response ${response.body}');

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json['message'] != null) {
        return jsonParse(response.body);
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
    var data = json['data'];

    return new List<CategoryItem>.from(
        data.map((value) => CategoryItem.fromJson(value)));
  }
}
