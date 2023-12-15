import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../views/product/create_view.dart';

class ProductController extends State<CreateProductView> {
  static late ProductController instance;
  late CreateProductView view;

  List<dynamic> categories = [];
  String selectedCategory = '';
  String selectedAvailability = '';
  File? selectedImage;

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    try {
      List<dynamic> fetchedCategories = await fetchCategories();
      setState(() {
        categories = fetchedCategories;
      });
    } catch (e) {
      print(e);
    }
  }

  void _takePictureFromCamera() async {
    final image = ImagePicker();
    final pickedImage =
        await image.pickImage(source: ImageSource.camera, maxWidth: 600);

    if (pickedImage == null) {
      return;
    }

    setState(() {
      selectedImage = File(pickedImage.path);
    });
  }

  Future<void> createProduct() async {
    String categoryId = categories.firstWhere(
        (category) => category['cat_name'] == selectedCategory)['id'];
    String userId = "1";
    String price = productController.price.text;
    String availability = selectedAvailability;

    Map<String, String> requestBody = {
      'user_id': userId,
      'category_id': categoryId,
      'product_name': productName,
      'product_desc': productDesc,
      'price': price,
      'availability': availability,
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://127.0.0.1:8000/api/add-product'),
    );

    request.fields.addAll(requestBody);

    if (selectedImage != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          selectedImage!.path,
        ),
      );
    }

    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(await response.stream.bytesToString());

        print(jsonResponse);

        // Get.to(ProductView());
      } else {
        print('Gagal menambahkan produk');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<dynamic>> fetchCategories() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/categories'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Connection error');
    }
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int? userId;
  int? categoryId;
  String? productName;
  String? productDesc;
  int? price;
  String? availability;
  String? image;
}
