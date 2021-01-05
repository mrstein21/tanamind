import 'dart:convert';

List<PotModel> jsonParse(final response) {
  var json = jsonDecode(response);
  var data = json['data'];

  return new List<PotModel>.from(
      data.map((value) => PotModel.fromJson(value)));
}

class PotModel {
  int id;
  String name;
  String description;
  String image;

  PotModel({this.id, this.name, this.image, this.description});

  factory PotModel.fromJson(Map<String, dynamic> json) {
    return PotModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image: json['image']);
  }
}
