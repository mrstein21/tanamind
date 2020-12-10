import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tanamind/helper/base_url.dart';
import 'package:tanamind/model/auth_model/user_model.dart';

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

    if (response.statusCode == 201) {
      return response.body;
    } else if(response.statusCode == 400){
      return response.body;
    }else{
      throw Exception();
    }
  }
}
