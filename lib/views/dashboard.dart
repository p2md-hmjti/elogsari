import 'package:elogsari_mobile/views/auth/reset_password.dart';
import 'package:elogsari_mobile/views/product/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth/login_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("ELOGSARI"),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text(
                'SUMBERWARU MAJU',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              accountEmail: Text(
                'Azizatur Rohma',
                style: TextStyle(
                  color: Color.fromARGB(255, 202, 200, 200),
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.jpg'),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              title: const Text('Kategori Produk'),
              leading: const Icon(Icons.production_quantity_limits),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Produk'),
              leading: const Icon(Icons.add_circle),
              onTap: () {
                Get.to(ProductView());
              },
            ),
            ListTile(
              title: const Text('Update Password'),
              leading: const Icon(Icons.lock_open),
              onTap: () {
                Get.to(ResetPassword());
              },
            ),
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(Icons.logout),
              onTap: () async {
                final SharedPreferences prefs = await _prefs;
                prefs.clear();
                Get.offAll(const LoginPage());
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome, Admin!',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
              ),
            ),
            TextButton(
              onPressed: () async {
                final SharedPreferences prefs = await _prefs;
                print(
                  prefs.get('token'),
                );
              },
              child: const Text('Print token'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(221, 228, 228, 228),
        selectedItemColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Tambah Produk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
