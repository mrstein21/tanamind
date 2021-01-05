import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tanamind/helper/base_url.dart';
import 'package:tanamind/model/marketplace_model/similar_item_model.dart';

class SimilarRepository {
  Future getData(var id) async {
    String url = '$base_url/item/$id/similar-item';

    var response = await http.get(url);
    print(url);

    if (response.statusCode == 200)
      return jsonParse(response.body);
    else {
      print('error repository : \n${response.statusCode}\n${response.body}');
      throw Exception('Internal server error...');
    }
  }

  List<SimilarModel> jsonParse(final response) {
    var json = jsonDecode(response);
    var data = json['data'];

    return new List<SimilarModel>.from(
        data.map((e) => SimilarModel.fromJson(e)));
  }
}
