import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/controllers/product_controller.dart';
import 'dart:convert';

class CreateProductView extends StatefulWidget {
  const CreateProductView({super.key});

  @override
  State<CreateProductView> createState() => ProductController();

  Widget build(context, ProductController controller) {
    controller.view = this;

    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              // Get.to(const ProductView());
            },
          ),
          title: const Text(
            'Tambah Produk',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _text('Nama Produk'),
                _productNameField(),
                const SizedBox(height: 30),
                _text('Kategori Produk'),
                _categoryField(),
                const SizedBox(height: 30),
                _text('Harga'),
                _priceField(),
                const SizedBox(height: 30),
                _text('Foto Produk'),
                _imageField(),
                const SizedBox(height: 30),
                _text('Ketersediaan Produk'),
                _availabilityField(),
                const SizedBox(height: 30),
                _text('Deskripsi Produk'),
                _productDescField(),
                const SizedBox(height: 30),
                _button(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _text(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _productNameField() {
    return TextFormField(
      validator: (value) =>
          value == '' ? 'Nama produk tidak boleh kosong' : null,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _categoryField() {
    return DropdownButtonFormField(
      value: selectedCategory,
      items: categories.map((category) {
        return DropdownMenuItem(
          value: category['cat_name'],
          child: Text(category['cat_name']),
        );
      }).toList(),
      onChanged: (value) {
        setState(
          () {
            selectedCategory = value.toString();
          },
        );
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }

  Widget _priceField() {
    return TextFormField(
      validator: (value) => value == '' ? 'Harga tidak boleh kosong' : null,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _imageField() {
    Widget content = TextButton.icon(
      icon: const Icon(Icons.camera),
      label: const Text('Ambil Foto'),
      onPressed: () {
        _takePictureFromCamera();
      },
    );

    if (_selectedImage != null) {
      content = GestureDetector(
        onTap: _takePictureFromCamera,
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.green),
      ),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: content,
    );
  }

  Widget _availabilityField() {
    return DropdownButtonFormField<String>(
      validator: (value) => value == '' ? 'Data tidak boleh kosong' : null,
      onChanged: (value) {},
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
        border: InputBorder.none,
      ),
      items: ['Tersedia'].map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
    );
  }

  Widget _productDescField() {
    return TextFormField(
      validator: (value) => value == '' ? 'Deskripsi tidak boleh kosong' : null,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _button() {
    return ElevatedButton(
      onPressed: createProduct,
      child: const Text('Create Product'),
    );
  }
}
