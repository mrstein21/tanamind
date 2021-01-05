import 'package:http/http.dart' as http;
import 'package:tanamind/helper/base_url.dart';

class RegisterRepository {
  Future sentData(String firstName, String lastName, String email,
      String password, var phone) async {
    String url = '$base_url/register';

    print('$url\n$firstName, $lastName, $email, $password, $phone');

    final response = await http.post(url, body: {
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
      'phone': phone,
      'password': password
    });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print('${response.body} + ${response.statusCode}');
      throw Exception();
    }
  }
}
