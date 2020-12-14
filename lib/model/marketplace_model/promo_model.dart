class MarketplacePromotionModel {
  int id;
  String title;
  String images;

  MarketplacePromotionModel({this.id, this.title, this.images});

  factory MarketplacePromotionModel.fromJson(Map<String, dynamic> json) {
    return MarketplacePromotionModel(
        id: json['id'], title: json['title'], images: json['image']);
  }
}
