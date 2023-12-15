import 'package:elogsari_mobile/views/product/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controllers/create_product_controller.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => CreateProductController();

  Widget build(context, CreateProductController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            //Get.to(ProductView());
          },
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
                    TextFormField(
                      validator: (value) {
                        if (value == '') {
                          return 'Data tidak boleh kosong';
                        }
                      },
                      onChanged: (value) {
                        controller.productName = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    const Text('Kategori Produk'),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(),
                      ),
                      child: DropdownButtonFormField<String>(
                        validator: (value) {
                          if (value == '') {
                            return 'Data tidak boleh kosong';
                          }
                        },
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20.0),
                          border: InputBorder.none,
                        ),
                        items: controller.categories
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // Update categoryId based on selected category
                          int index = controller.categories.indexOf(newValue!);
                          controller.categoryId =
                              index + 1; // Assuming category IDs start from 1
                        },
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    const Text('Harga Produk'),
                    TextFormField(
                      validator: (value) {
                        if (value == '') {
                          return 'Data tidak boleh kosong';
                        }
                      },
                      onChanged: (value) {
                        controller.price = int.tryParse(value);
                        // NumberFormat.currency(
                        //         locale: 'id', symbol: 'Rp.', decimalDigits: 0)
                        //     .format(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    const Text('Foto Produk'),
                    Row(
                      children: [
                        ElevatedButton(
                          child: Icon(Icons.image),
                          onPressed: () {},
                        ),
                        ElevatedButton(
                          child: Icon(Icons.image),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    const Text('Ketersediaan Produk'),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(),
                      ),
                      child: DropdownButtonFormField<String>(
                        validator: (value) {
                          if (value == '') {
                            return 'Data tidak boleh kosong';
                          }
                        },
                        onChanged: (value) {
                          controller.availability = value;
                        },
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20.0),
                          border: InputBorder.none,
                        ),
                        items: <String>[
                          'Tersedia',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    const Text('Deskripsi'),
                    TextFormField(
                      validator: (value) {
                        if (value == '') {
                          return 'Data tidak boleh kosong';
                        }
                      },
                      onChanged: (value) {
                        controller.productDesc = value;
                      },
                      keyboardType: TextInputType.multiline,
                      maxLength: 150,
                      maxLines: 7,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
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
          onPressed: () => {
            controller.doSave(),
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(18.0),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
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
    );
  }
}
