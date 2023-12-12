import 'package:flutter/material.dart';
import '/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Size mediaSize;

  LoginController loginController = Get.put(LoginController());

  bool rememberUser = false;
  bool showPassword = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(top: 25, child: _buildTop()),
          Positioned(bottom: 0, child: _buildBottom()),
        ],
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        children: [
          Image(
            image: AssetImage('assets/images/logo.png'),
          ),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        color: Colors.green,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        const Text(
          "ELOGSARI",
          style: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        _buildWhiteText("Silahkan login menggunakan email dan password Anda"),
        const SizedBox(height: 30),
        _buildInputField(),
        const SizedBox(height: 10),
        _buildRememberUser(),
        const SizedBox(height: 20),
        _buildLoginButton(),
        const SizedBox(height: 30),
        // _buildGoogleLogin(),
        // const SizedBox(height: 45),
      ],
    );
  }

  Widget _buildWhiteText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildInputField() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: loginController.emailController,
            validator: (value) {
              if (value == '') {
                return 'Email tidak boleh kosong';
              }
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Email',
            ),
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            controller: loginController.passwordController,
            validator: (value) {
              if (value == '') {
                return 'Password tidak boleh kosong';
              }
            },
            obscureText: !showPassword,
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: const Icon(
                Icons.key,
                color: Colors.white,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                child: Icon(
                  showPassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRememberUser() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
                activeColor: Colors.white,
                checkColor: Colors.green,
                value: rememberUser,
                onChanged: (value) {
                  setState(() {
                    rememberUser = value!;
                  });
                }),
            _buildWhiteText("Ingat saya"),
          ],
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          loginController.login();
        } else {}
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: Colors.green,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text(
        "LOGIN",
        style: TextStyle(
          color: Colors.green,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  // Widget _buildGoogleLogin() {
  //   return Center(
  //     child: Column(
  //       children: [
  //         _buildWhiteText("Atau Login dengan"),
  //         const SizedBox(height: 30),
  //         Tab(
  //           icon: ClipOval(
  //             child: Image.asset(
  //               "assets/images/logo-google.png",
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
