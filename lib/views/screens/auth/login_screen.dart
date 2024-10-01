import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shop_app/controllers/auth_controller.dart';
import 'package:shop_app/views/screens/auth/register_screen.dart';
import 'package:shop_app/views/screens/home_screen.dart';
import 'package:shop_app/views/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();

  late String email;
  late String password;

  loginUser() async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show();
      String res = await _authController.loginUser(email, password);
      if (res == 'success') {
        Get.snackbar('Success', 'Login SuccessFully',
            backgroundColor: Colors.pink,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
        Get.offAll(MainScreen());
      } else
        Get.snackbar('ERROR', 'Given Login Details Are Wrong',
            backgroundColor: Colors.pink,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      EasyLoading.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login Account',
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 4),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty)
                  return 'Enter Email Address';
                else
                  return null;
              },
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                  labelText: 'Email Address',
                  hintText: 'Email',
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.pink,
                  ),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty)
                  return 'Enter the password';
                else
                  return null;
              },
              onChanged: (value) {
                password = value;
              },
              decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.pink,
                  ),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                loginUser();
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      letterSpacing: 4,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Get.to(RegisterScreen());
                },
                child: Text('Need An Account?'))
          ],
        ),
      ),
    ));
  }
}
