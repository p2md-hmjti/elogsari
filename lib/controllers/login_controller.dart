import 'dart:convert';

import 'package:elogsari_mobile/views/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> login() async {
    var headers = {'Content-Type': 'application/json'};

    try {
      var url = Uri.parse('http://127.0.0.1:8000/api/login');

      Map body = {
        'email': emailController.text,
        'password': passwordController.text,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      print(response.body);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['status'] == true) {
          var token = json['data']['token'];

          final SharedPreferences prefs = await _prefs;
          await prefs.setString('token', token);

          emailController.clear();
          passwordController.clear();

          Get.off(const Dashboard());
        } else if (json['status'] == false) {
          throw jsonDecode(response.body)['message'];
        }
      } else {
        throw jsonDecode(response.body)['message'] ?? "Error Tidak Diketahui";
      }
    } catch (error) {
      Get.back();

      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Error'),
            contentPadding: const EdgeInsets.all(20),
            children: [Text(error.toString())],
          );
        },
      );
    }
  }
}
