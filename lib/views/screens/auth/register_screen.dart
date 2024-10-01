import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/controllers/auth_controller.dart';
import 'package:shop_app/views/screens/auth/login_screen.dart';
import 'package:shop_app/views/screens/home_screen.dart';
import 'package:shop_app/views/screens/main_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AuthController _authController = AuthController();

  late String email;
  late String fullName;
  late String password;
  Uint8List? _image; //bytes

  selectGaleryImage() async {
    Uint8List im = await _authController.pickProfileImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  captureImage() async {
    Uint8List im = await _authController.pickProfileImage(ImageSource.camera);
    setState(() {
      _image = im;
    });
  }

  registerUser() async {
    if (_image != null) {
      if (_formKey.currentState!.validate()) {
        EasyLoading.show();
        String res = await _authController
            .createNewUser(email, fullName, password, _image)
            .whenComplete(() {
          EasyLoading.dismiss();
        });
        if (res == 'success') {
          Get.offAll(MainScreen());
          Get.snackbar('Success', 'Account Has Been Successfully Created!!!',
              backgroundColor: Colors.pink,
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM);
        }
      } else
        Get.snackbar('ERROR', 'Form Is Not Valid',
            backgroundColor: Colors.pink,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
    } else
      Get.snackbar('Warning!!!', 'Image Not Picked',
          backgroundColor: Colors.pink,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          icon: Icon(Icons.image));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Register Account',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4),
                ),
                SizedBox(
                  height: 15,
                ),
                Stack(
                  children: [
                    _image == null
                        ? CircleAvatar(
                            radius: 65,
                            child: Icon(
                              Icons.person,
                              size: 60,
                            ),
                          )
                        : CircleAvatar(
                            radius: 65,
                            backgroundImage: MemoryImage(_image!),
                          ),
                    Positioned(
                        right: 0,
                        top: 15,
                        child: IconButton(
                            onPressed: () {
                              selectGaleryImage();
                            },
                            icon: Icon(Icons.camera)))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter The Full Name';
                    } else
                      return null;
                  },
                  onChanged: (value) {
                    fullName = value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Full Name',
                      hintText: 'Full Name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.pink,
                      ),
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter the Email';
                    } else
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
                    if (value!.isEmpty) {
                      return 'Enter the Password';
                    } else
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
                    registerUser();
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      'Sign Up',
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
                      Get.offAll(MainScreen());
                    },
                    child: Text('Already Have An Account!'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
