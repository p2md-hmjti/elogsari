import '/constant.dart';
import '/models/api_response.dart';
import '/models/product.dart';
import '/services/product_service.dart';
import '/services/user_service.dart';
import 'package:flutter/material.dart';

import '/screens/auth/login.dart';
import 'product_form.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<dynamic> _productList = [];
  int userId = 0;

  Future<void> retrievePosts() async {
    userId = await getUserId();
    ApiResponse response = await getProduct();

    if (response.error == null) {
      setState(
        () {
          _productList = response.data as List<dynamic>;
        },
      );
    } else if (response.error == unauthorized) {
      logout().then(
        (value) => {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Login()),
              (route) => false)
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${response.error}'),
        ),
      );
    }
  }

  void _handleDeleteProduct(int id) async {
    ApiResponse response = await deleteProduct(id);
    if (response.error == null) {
      retrievePosts();
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Login()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  @override
  void initState() {
    retrievePosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return retrievePosts();
      },
      child: ListView.builder(
        itemCount: _productList.length,
        itemBuilder: (BuildContext context, int index) {
          Product product = _productList[index];
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    product.user!.id == userId
                        ? PopupMenuButton(
                            child: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.more_vert,
                                  color: Colors.black,
                                )),
                            itemBuilder: (context) => [
                              PopupMenuItem(child: Text('Edit'), value: 'edit'),
                              PopupMenuItem(
                                  child: Text('Delete'), value: 'delete')
                            ],
                            onSelected: (val) {
                              // if (val == 'edit') {
                              //   Navigator.of(context).push(
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //       (
                              //         title: 'Edit Produk',
                              //         product: product,
                              //       ),
                              //     ),
                              //   );
                              // } else {
                              //   _handleDeleteProduct(product.id ?? 0);
                              // }
                            },
                          )
                        : SizedBox()
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                // Text('${product.body}'),
                product.image != null
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage('${product.image}'),
                              fit: BoxFit.cover),
                        ),
                      )
                    : SizedBox(
                        height: product.image != null ? 0 : 10,
                      ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 0.5,
                  color: Colors.black26,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
