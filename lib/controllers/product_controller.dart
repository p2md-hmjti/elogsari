// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import '/views/product/create_view.dart';
// import '../service/product_service.dart';
// import 'package:image_picker/image_picker.dart';

// class ProductController extends State<CreateProductView> {
//   static late ProductController instance;
//   late CreateProductView view;

//   List<dynamic> categories = [];
//   String? selectedCategory;
//   File? selectedImage;

//   @override
//   void initState() {
//     instance = this;
//     _fetchCategories();
//     _takePictureFromCamera();
//     super.initState();
//   }

//   Future<List<dynamic>> fetchCategories() async {
//     final response =
//         await http.get(Uri.parse('http://127.0.0.1:8000/api/categories'));

//     if (response.statusCode == 200) {
//       return json.decode(response.body)['data'];
//     } else {
//       throw Exception('Connection error');
//     }
//   }

//   Future<void> _fetchCategories() async {
//     try {
//       List<dynamic> fetchedCategories = await fetchCategories();
//       setState(() {
//         categories = fetchedCategories;
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   void _takePictureFromCamera() async {
//     final image = ImagePicker();
//     final pickedImage =
//         await image.pickImage(source: ImageSource.camera, maxWidth: 600);

//     if (pickedImage == null) {
//       return;
//     }

//     setState(() {
//       selectedImage = File(pickedImage.path);
//     });
//   }

//   @override
//   Widget build(BuildContext context) => widget.build(context, this);

//   int? userId;
//   int? categoryId;
//   String? productName;
//   String? productDesc;
//   int? price;
//   String? availability;
//   String? image;

//   addProduct() async {
//     await ProductService().create(
//       userId: userId!,
//       categoryId: categoryId!,
//       productName: productName!,
//       productDesc: productDesc!,
//       price: price!,
//       availability: availability!,
//       image: image!,
//     );

//     // Get.back();
//   }
// }
