import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Product {
  Product({
    required this.userId,
    required this.categoryId,
    required this.productName,
    required this.price,
    required this.availability,
    required this.productDesc,
  }) : id = uuid.v4();

  final String id;
  final int userId;
  final int categoryId;
  final String productName;
  final int price;
  final String availability;
  final String productDesc;
}
