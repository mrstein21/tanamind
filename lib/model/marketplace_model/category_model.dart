class MarketplaceCategoryModel {
  int id;
  String name;

  MarketplaceCategoryModel({this.id, this.name});

  factory MarketplaceCategoryModel.fromJson(Map<String, dynamic> json) {
    return MarketplaceCategoryModel(id: json['id'], name: json['name']);
  }
}
