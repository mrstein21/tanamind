class SimilarModel {
  int id;
  String name;
  String description;
  String price;
  String image;

  SimilarModel({this.name, this.image, this.id, this.price, this.description});

  factory SimilarModel.fromJson(Map<String, dynamic> json) {
    return SimilarModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        description: json['sort_desc'],
        price: json['price']);
  }
}
