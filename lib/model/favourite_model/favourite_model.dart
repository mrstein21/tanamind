class FavouriteModel {
  int id;
  DetailModel detailModel;

  FavouriteModel({this.id, this.detailModel});

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
        id: json['id'], detailModel: DetailModel.fromJson(json['item']));
  }
}

class DetailModel {
  int id;
  int userId;
  String name;
  String description;
  String image;
  String price;

  DetailModel(
      {this.id,
      this.price,
      this.description,
      this.userId,
      this.image,
      this.name});


  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
        id: json['id'],
        name: json['name'],
        description: json['sort_desc'],
        price: json['price'],
        image: json['image'] ?? '',
        userId: json['user_id']);
  }
}
