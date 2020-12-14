class PlantCategoryModel {
  int id;
  String name;

  PlantCategoryModel({this.id, this.name});

  factory PlantCategoryModel.fromJson(Map<String, dynamic> json) {
    return PlantCategoryModel(id: json['id'], name: json['name']);
  }
}
