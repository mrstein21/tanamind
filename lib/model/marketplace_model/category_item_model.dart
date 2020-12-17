

class CategoryItem {
  int id;
  String name;
  String description;
  String price;
  String images;

  CategoryItem({this.id, this.name, this.images, this.description, this.price});

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
        id: json['id'],
        name: json['name'],
        images: json['image'],
        description: json['sort_desc'],
        price: json['price']);
  }
}
