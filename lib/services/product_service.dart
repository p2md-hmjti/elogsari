import 'package:dio/dio.dart';

class ProductService {
  Future<List> get() async {
    var response = await Dio().get(
      'http://127.0.0.1:8000/api/products',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer ${LoginController.token}',
        },
      ),
    );

    Map obj = response.data;
    return obj['data'];
  }

  Future<List> getCategories() async {
    var response = await Dio().get(
      'http://127.0.0.1:8000/api/categories',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    Map obj = response.data;
    return obj['data'];
  }

  Future create({
    required int userId,
    required int categoryId,
    required String productName,
    required String productDesc,
    required int price,
    required String availability,
    // required String image,
  }) async {
    var response = await Dio().post(
      'http://127.0.0.1:8000/api/add-product',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer ${LoginController.token}',
        },
      ),
      data: {
        'user_id': userId,
        'category_id': categoryId,
        'product_name': productName,
        'product_desc': productDesc,
        'price': price,
        'availability': availability,
        // 'image': image,
      },
    );

    Map obj = response.data;
    return obj['data'];
  }

  Future update({
    required int id,
    required int userId,
    required int categoryId,
    required String productName,
    required String productDesc,
    required int price,
    required String availability,
    // required String image,
  }) async {
    var response = await Dio().put(
      'http://127.0.0.1:8000/api/update-product/$id',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer ${LoginController.token}',
        },
      ),
      data: {
        'user_id': userId,
        'category_id': categoryId,
        'product_name': productName,
        'product_desc': productDesc,
        'price': price,
        'availability': availability,
        // 'image': image,
      },
    );

    Map obj = response.data;
    return obj['data'];
  }

  Future delete(int id) async {
    var response = await Dio().delete(
      'http://127.0.0.1:8000/api/delete-product/$id',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer ${LoginController.token}',
        },
      ),
    );
    print(response.statusCode);
  }
}
