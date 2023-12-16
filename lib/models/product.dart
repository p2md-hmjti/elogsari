import 'user.dart';

class Product {
  int? id;
  User? user;
  int? categoryId;
  String? productName;
  String? productDesc;
  int? price;
  String? availability;
  String? image;

  Product({
    this.id,
    this.user,
    this.categoryId,
    this.productName,
    this.productDesc,
    this.price,
    this.availability,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      categoryId: json['category_id'],
      productName: json['product_name'],
      productDesc: json['product_desc'],
      price: json['price'],
      availability: json['availability'],
      image: json['image'],
      user: User(
        id: json['user']['id'],
        username: json['user']['username'],
      ),
    );
  }
}
