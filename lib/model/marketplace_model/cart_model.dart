class CartModel {
  int cartId;
  int total;
  CartDetail cartDetail;

  CartModel({this.cartId, this.cartDetail, this.total});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        cartId: json['id'], cartDetail: CartDetail.fromJson(json['item']));
  }
}

class CartDetail {
  int id;
  String name;
  String description;
  String price;
  String image;
  int qty;

  CartDetail(
      {this.id, this.name, this.image, this.description, this.price, this.qty});

  factory CartDetail.fromJson(Map<String, dynamic> json) {
    return CartDetail(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        price: json['price'],
        description: json['sort_desc']);
  }
}
