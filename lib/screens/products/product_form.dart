// import 'dart:io';

// import '/constant.dart';
// import '/models/api_response.dart';
// import '/models/product.dart';
// import '/services/product_service.dart';
// import '/services/user_service.dart';
// import '/models/product.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// import '/screens/auth/login.dart';

// class ProductForm extends StatefulWidget {
//   final Product? product;
//   final String? title;

//   ProductForm({this.product, this.title});

//   @override
//   _ProductFormState createState() => _ProductFormState();
// }

// class _ProductFormState extends State<ProductForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _categoryId = TextEditingController();
//   final TextEditingController _productName = TextEditingController();
//   final TextEditingController _price = TextEditingController();
//   final TextEditingController _availability = TextEditingController();
//   final TextEditingController _productDesc = TextEditingController();

//   File? _imageFile;
//   final _picker = ImagePicker();

//   Future getImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(
//         () {
//           _imageFile = File(pickedFile.path);
//         },
//       );
//     }
//   }

//   void _createProduct() async {
//     String? image = _imageFile == null ? null : getImage(_imageFile);
//     ApiResponse response = await createProduct(
//       //_categoryId.text,
//       _productName.text,
//       //_price.text,
//       _availability.text,
//       _productDesc.text,
//       //image,
//     );

//     if (response.error == null) {
//       Navigator.of(context).pop();
//     } else if (response.error == unauthorized) {
//       logout().then((value) => {
//             Navigator.of(context).pushAndRemoveUntil(
//                 MaterialPageRoute(builder: (context) => Login()),
//                 (route) => false)
//           });
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('${response.error}'),
//         ),
//       );
//     }
//   }

//   // edit post
//   void _editProduct(int id) async {
//     ApiResponse response = await editProduct(
//       id,
//       //_categoryId.text,
//       _productName.text,
//       _price.text,
//       //_availability.text,
//       _productDesc.text,
//       //image,
//     );
//     if (response.error == null) {
//       Navigator.of(context).pop();
//     } else if (response.error == unauthorized) {
//       logout().then((value) => {
//             Navigator.of(context).pushAndRemoveUntil(
//                 MaterialPageRoute(builder: (context) => Login()),
//                 (route) => false)
//           });
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('${response.error}'),
//         ),
//       );
//     }
//   }

//   @override
//   void initState() {
//     if (widget.product != null) {
//       //_categoryId.text = widget.product!.categoryId ?? '';
//       _productName.text = widget.product!.productName ?? '';
//       //_price.text = widget.product!.price ?? '';
//       _availability.text = widget.product!.availability ?? '';
//       _productDesc.text = widget.product!.productDesc ?? '';
//       //image = widget.product!.image ?? '';
//     }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${widget.title}'),
//       ),
//       body: ListView(
//         children: [
//           widget.product != null
//               ? SizedBox()
//               : Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 200,
//                   decoration: BoxDecoration(
//                       image: _imageFile == null
//                           ? null
//                           : DecorationImage(
//                               image: FileImage(_imageFile ?? File('')),
//                               fit: BoxFit.cover)),
//                   child: Center(
//                     child: IconButton(
//                       icon: Icon(Icons.image, size: 50, color: Colors.black38),
//                       onPressed: () {
//                         getImage();
//                       },
//                     ),
//                   ),
//                 ),
//           Form(
//             key: _formKey,
//             child: Padding(
//               padding: EdgeInsets.all(8),
//               child: TextFormField(
//                 controller: _productName,
//                 keyboardType: TextInputType.multiline,
//                 maxLines: 9,
//                 validator: (val) =>
//                     val!.isEmpty ? 'Product body is required' : null,
//                 decoration: InputDecoration(
//                   hintText: "Product body...",
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(width: 1, color: Colors.black38),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 8),
//             child: kTextButton(
//               'Product',
//               () {
//                 if (_formKey.currentState!.validate()) {
//                   if (widget.product == null) {
//                     _createProduct();
//                   } else {
//                     _editProduct(widget.product!.id ?? 0);
//                   }
//                 }
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
