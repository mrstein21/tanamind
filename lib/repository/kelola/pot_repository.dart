import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:async/async.dart';

import 'package:http/http.dart' as http;
import 'package:image/image.dart';
import 'package:tanamind/helper/base_url.dart';
import 'package:tanamind/helper/shared_preferences.dart';
import 'package:tanamind/model/kelola_model/pot_model.dart';

class PotRepository {
  Future getData() async {
    String url = '$base_url/auth/pot';
    String token = await UserPreferences.getUserToken();

    var response =
        await http.get(url, headers: {'Authorization': 'bearer $token'});

    if (response.statusCode == 200) {
      return jsonParse(response.body);
    } else {
      print("error repository : ${response.statusCode}\n${response.body}");
      throw Exception();
    }
  }


  /*Image imageS = decodeImage(image.readAsBytesSync());
    Image thumbnail = copyResize(imageS, width: 150, height: 150);
    var f = File('thumbnail.jpg')..writeAsBytesSync(encodeJpg(thumbnail));
    print('$imageS\n$thumbnail\n$f');*/


  Future addPot(var name, var desc, var image) async {
    String url = '$base_url/auth/pot';
    String token = await UserPreferences.getUserToken();
    var header = {
      'Authorization': 'bearer $token',
      'content-type': 'multipart/form-data'
    };
    var stream = new http.ByteStream(DelegatingStream.typed(image.openRead()));

    File file;
    file = image;
    var fileLength = file.lengthSync();

    print(file.toString().split('/').last);

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(header);
    request.fields['name'] = name;
    request.fields['description'] = desc;
    request.files.add(new http.MultipartFile('image', stream, fileLength,
        contentType: MediaType('image', 'jpg'),
        filename: name));

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    print('repo ${response.statusCode}');
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      print('error ${response.statusCode}\n${response.body}');
    }
  }

  Future deletePot(var id) async {
    String url = '$base_url/auth/pot/$id/delete';
    String token = await UserPreferences.getUserToken();

    var response =
        await http.post(url, headers: {'Authorization': 'bearer $token'});

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print("error repository : ${response.statusCode}\n${response.body}");
      throw Exception();
    }
  }
}
