import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  // FileImage? image;

  // Future getImageGallery() async {
  //   var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     image = imageFile;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {},
          ),
          title: const Text(
            'Tambah Produk',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('Nama Produk'),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      const Text('Kategori Produk'),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          border: Border.all(),
                        ),
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.0),
                            border: InputBorder.none,
                          ),
                          items: <String>[
                            'Jamu',
                            'Kopi',
                            'Makanan',
                            'Anyaman',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {},
                        ),
                      ),
                      const Text('Harga Produk'),
                      TextField(
                        onChanged: (value) {
                          NumberFormat.currency(
                                  locale: 'id', symbol: 'Rp.', decimalDigits: 0)
                              .format(value);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                      const Text('Foto Produk'),
                      // ElevatedButton(
                      //   child: Icon(Icons.image),
                      //   onPressed: getImageGallery,
                      // ),
                      // ElevatedButton(
                      //   child: Icon(Icons.image),
                      //   onPressed: getImageCamera,
                      // ),
                      const Text('Ketersediaan Produk'),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          border: Border.all(),
                        ),
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.0),
                            border: InputBorder.none,
                          ),
                          items: <String>[
                            'Tersedia',
                            'Habis',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {},
                        ),
                      ),
                      const Text('Deskripsi'),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        maxLength: 250,
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 35.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const CreateProduct();
                  },
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(18.0),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'SIMPAN',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
