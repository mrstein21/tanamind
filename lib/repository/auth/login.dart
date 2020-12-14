import 'package:http/http.dart' as http;
import 'package:tanamind/helper/base_url.dart';

class LoginRepository {
  Future userLogin(String param, String password) async {
    String url = '$base_url/login';

    var response = await http
        .post(url, body: {'email_phone': param, 'password': password});

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print("print error : ${response.body} + ${response.statusCode}");
      throw Exception(['Exception Error']);
    }
  }
}
