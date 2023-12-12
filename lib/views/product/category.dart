// import 'package:flutter/material.dart';
// import '/controllers/product_form_controller.dart';
// import 'package:get/get.dart';

// class ProductCategories extends StatefulWidget {
//   const ProductCategories({super.key});

//   @override
//   State<ProductCategories> createState() => ProductFormController();

//   Widget build(context, ProductFormController controller) {
//     controller.view = this;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Kategori Produk',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.green,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//         actions: [
//           CircleAvatar(
//             child: Text(
//               "${controller.categories.length}",
//               style: const TextStyle(fontSize: 14.0),
//             ),
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         padding: EdgeInsets.all(20.0),
//         itemCount: controller.categories.length,
//         physics: ScrollPhysics(),
//         itemBuilder: (BuildContext context, int category) {
//           var item = controller.categories[category];
//           return Card(
//             child: ListTile(
//               leading: CircleAvatar(
//                 backgroundColor: Colors.green,
//                 backgroundImage: AssetImage('assets/images/logo.png'),
//                 // NetworkImage(
//                 //   item['image'],
//                 // ),
//               ),
//               title: Text(item['cat_name']),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
