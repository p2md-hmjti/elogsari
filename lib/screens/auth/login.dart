import '/models/api_response.dart';
import '/models/user.dart';
import '/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/screens/dashboard.dart';

class Login extends StatefulWidget {
  // const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late Size mediaSize;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool rememberUser = false;
  bool showPassword = false;

  void _login() async {
    ApiResponse response = await login(email.text, password.text);
    if (response.error == null) {
      _dashboard(response.data as User);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${response.error}'),
        ),
      );
    }
  }

  void _dashboard(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Dashboard()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(top: 15, child: _buildTop()),
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
            keyboardType: TextInputType.emailAddress,
            controller: email,
            validator: (value) =>
                value == '' ? 'Email tidak boleh kosong' : null,
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
            controller: password,
            validator: (value) =>
                value == '' ? 'Password tidak boleh kosong' : null,
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
          setState(
            () {
              _login();
            },
          );
        }
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
