import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:praner_market/auth/signup_screen.dart';
import 'package:praner_market/controllers/auth_controllers.dart';
import 'package:praner_market/screens/home_screen.dart';
import 'package:praner_market/widgets/custom_appbar.dart';
import 'package:praner_market/widgets/custom_button.dart';
import 'package:praner_market/widgets/custom_textField.dart';

import '../widgets/custom_title_subtitle.dart';

class Login_Screen extends StatelessWidget {
  Login_Screen({super.key});

  final _emailformkey = GlobalKey<FormState>();
  final _passformkey = GlobalKey<FormState>();

  final controller = Get.put(Auth_Controller());

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    return Scaffold(

      appBar: const Custom_AppBar(
        backgroundcolor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Lottie.asset("assets/animations/login.json",
                  height: Height / 2.5),
              const Custom_Title_SubTitle(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                title: "Login!",
                subtitle:
                    "Login with your email and password if you have already signed up to the app.",
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Form(
                      key: _emailformkey,
                      child: Custom_formField(
                        prefixicon: Icons.email,
                        hinttext: "Email",
                        onchanged: (emeil) {
                          controller.email.value = emeil;
                        },
                        validation: (value) {
                          if (value!.isEmpty) {
                            return "Fill The Form";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Form(
                      key: _passformkey,
                      child: Custom_formField(
                        prefixicon: Icons.remove_red_eye,
                        hinttext: "Password",
                        obscuretext: true,
                        onchanged: (password) {
                          controller.password.value = password;
                        },
                        validation: (value) {
                          if (value!.isEmpty) {
                            return "Fill The Form";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                        height:
                            20), // Add some space between TextFormField and Button
                    Custom_Button(
                      text: "LogIn",
                      isloading: controller.isloading.value,
                      ontap: () {
                        if (_emailformkey.currentState!.validate() &&
                            _passformkey.currentState!.validate()) {
                          controller.Log_In();
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          Get.to(Signup_screeen());
                        },
                        child: const Text(
                          "Create new account?",
                          style: TextStyle(color: Colors.blue),
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
