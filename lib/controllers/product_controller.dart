import 'package:elogsari_mobile/services/product_service.dart';
import 'package:flutter/material.dart';
import '../views/product/index.dart';

class ProductController extends State<ProductView> {
  static late ProductController instance;
  late ProductView view;

  @override
  void initState() {
    instance = this;
    getProducts();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List products = [];
  getProducts() async {
    products = await ProductService().get();
    print(products);
    setState(() {});
  }
}
