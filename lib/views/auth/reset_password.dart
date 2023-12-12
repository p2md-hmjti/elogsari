import 'package:elogsari_mobile/views/auth/login_page.dart';
import 'package:elogsari_mobile/views/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(const ResetPassword());
}

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Update Password",
          style: TextStyle(color: Colors.white),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Password Lama',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45.0),
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.green,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45.0),
                ),
              ),
            ),
            SizedBox(height: 14),
            Text(
              'Password Baru',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45.0),
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.green,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45.0),
                ),
              ),
            ),
            SizedBox(height: 14),
            Text(
              'Konfirmasi Password',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45.0),
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.green,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45.0),
                ),
              ),
            ),
            SizedBox(height: 29),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Simpan"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
