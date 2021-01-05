import 'package:hive/hive.dart';
part 'hive_cart_model.g.dart';

@HiveType()
class HiveCartModel {
  @HiveField(0)
  int id;

  @HiveField(1)
  int itemId;

  @HiveField(2)
  String name;

  @HiveField(3)
  String description;

  @HiveField(4)
  String price;

  @HiveField(6)
  String image;

  @HiveField(7)
  int qty;

  HiveCartModel(
      {this.id,
      this.itemId,
      this.name,
      this.image,
      this.description,
      this.price,
      this.qty});
}
