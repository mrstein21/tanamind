import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tanamind/helper/base_url.dart';
import 'package:tanamind/model/marketplace_model/promo_model.dart';

class MarketplacePromoRepository {
  Future<List<MarketplacePromotionModel>> getPromotion() async {
    String url = '$base_url/market/promo';

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonParse(response.body);
    } else {
      print('response error : ${response.statusCode} : ${response.body}');
      throw Exception();
    }
  }

  List<MarketplacePromotionModel> jsonParse(final response) {
    var json = jsonDecode(response);
    var data = json['data'];

    return new List<MarketplacePromotionModel>.from(
        data.map(((e) => MarketplacePromotionModel.fromJson(e))));
  }
}
