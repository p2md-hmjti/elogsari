import 'dart:convert';
import '/models/api_response.dart';
import '/models/product.dart';
import '/services/user_service.dart';
import '/constant.dart';
import 'package:http/http.dart' as http;

Future<ApiResponse> getProduct() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(
      Uri.parse(productsURL),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['products']
            .map(
              (p) => Product.fromJson(p),
            )
            .toList();

        apiResponse.data as List<dynamic>;
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

Future<ApiResponse> createProduct(
  int categoryId,
  String productName,
  int price,
  String availability,
  String? image,
  String productDesc,
) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.post(
      Uri.parse(productsURL),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
      body: image != null
          ? {
              'category_id': categoryId,
              'product_name': productName,
              'price': price,
              'availability': availability,
              'product_desc': productDesc,
              'image': image
            }
          : {
              'category_id': categoryId,
              'product_name': productName,
              'price': price,
              'availability': availability,
              'product_desc': productDesc,
            },
    );

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        print(response.body);
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

Future<ApiResponse> editProduct(
  int id,
  int categoryId,
  String productName,
  int price,
  String availability,
  String? image,
  String productDesc,
) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.put(
      Uri.parse('$productsURL/$id'),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
      body: {
        'category_id': categoryId,
        'product_name': productName,
        'price': price,
        'availability': availability,
        'product_desc': productDesc,
        'image': image,
      },
    );

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['message'];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

Future<ApiResponse> deleteProduct(int id) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.delete(Uri.parse('$productsURL/$id'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['message'];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}
