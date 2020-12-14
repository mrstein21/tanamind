import 'package:tanamind/helper/base_url.dart';
import 'package:http/http.dart' as http;

class LogoutRepository {
  Future logout(String token) async {
    String url = '$base_url/auth/logout';

    var response =
        await http.post(url, headers: {'Authorization': 'bearer $token'});

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print('repository error : ${response.statusCode} - ${response.body}');
      throw Exception('Connection request');
    }
  }
}
