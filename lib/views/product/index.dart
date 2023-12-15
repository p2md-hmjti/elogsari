// import 'package:elogsari_mobile/views/dashboard.dart';
// import 'package:elogsari_mobile/views/product/create.dart';
// import 'package:elogsari_mobile/views/product/edit.dart';
// import 'package:flutter/material.dart';
// import '/controllers/product_controller.dart';
// import 'package:get/get.dart';

// class ProductView extends StatefulWidget {
//   const ProductView({super.key});

//   @override
//   State<ProductView> createState() => ProductController();

//   Widget build(context, ProductController controller) {
//     controller.view = this;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Semua Produk',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.green,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Get.to(Dashboard());
//           },
//         ),
//         actions: [
//           CircleAvatar(
//             child: Text(
//               "${controller.products.length}",
//               style: const TextStyle(fontSize: 14.0),
//             ),
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         padding: EdgeInsets.all(20.0),
//         itemCount: controller.products.length,
//         physics: ScrollPhysics(),
//         itemBuilder: (BuildContext context, int index) {
//           var item = controller.products[index];
//           return Card(
//             child: ListTile(
//               leading: CircleAvatar(
//                 backgroundColor: Colors.green,
//                 backgroundImage: AssetImage('assets/images/logo.png'),
//               ),
//               trailing: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(
//                     icon: Icon(
//                       Icons.edit,
//                       color: Colors.blue,
//                     ),
//                     onPressed: () {
//                       Get.to(EditProductForm());
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(
//                       Icons.delete,
//                       color: Colors.red,
//                     ),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//               title: Text(item['product_name']),
//               subtitle: Text("${item['price']}"),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () async {
//           await Get.to(CreateProduct());
//           controller.getProducts();
//         },
//       ),
//     );
//   }
// }
