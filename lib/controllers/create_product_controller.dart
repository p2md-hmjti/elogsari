import 'package:elogsari_mobile/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/views/product/create.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateProductController extends State<CreateProduct> {
  static late CreateProductController instance;
  late CreateProduct view;

  late List<String> categories;

  @override
  void initState() {
    instance = this;
    _userData();
    _fetchCategories();
    super.initState();
  }

  _userData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('user_id');
  }

  _fetchCategories() async {
    try {
      List<dynamic> categoryList = await ProductService().getCategories();
      List<String> categoryNames = categoryList
          .map((category) => category['cat_name'].toString())
          .toList();

      setState(() {
        categories = categoryNames;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int? userId;
  int? categoryId;
  String? productName;
  String? productDesc;
  int? price;
  String? availability;
  // String? image;

  doSave() async {
    await ProductService().create(
      userId: userId!,
      categoryId: categoryId!,
      productName: productName!,
      productDesc: productDesc!,
      price: price!,
      availability: availability!,
    );

    Get.back();
  }
}
