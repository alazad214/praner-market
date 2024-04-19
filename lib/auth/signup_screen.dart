import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:praner_market/auth/login_screen.dart';
import 'package:praner_market/controllers/auth_controllers.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textField.dart';
import '../widgets/custom_title_subtitle.dart';

class Signup_screeen extends StatelessWidget {
  Signup_screeen({super.key});
  final _emailformkey = GlobalKey<FormState>();
  final _passformkey = GlobalKey<FormState>();

  final controller = Get.put(Auth_Controller());

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const Custom_AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Lottie.asset("assets/animations/login.json",
                  height: Height / 2.5),
              const Custom_Title_SubTitle(
                title: "SignIn!",
                subtitle: "Just a few quick things to get started",
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
                        onchanged: (emeil) {
                          controller.email.value = emeil;
                        },
                        hinttext: "Email",
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
                    Custom_formField(
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
                    const SizedBox(
                      height: 15,
                    ),
                    Form(
                      key: _passformkey,
                      child: Custom_formField(
                        prefixicon: Icons.remove_red_eye,
                        hinttext: "Confirm password",
                        obscuretext: true,
                        onchanged: (confirmpassword) {
                          controller.confirmpassword.value = confirmpassword;
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
                      text: "Signup",
                      isloading: controller.isloading.value,
                      ontap: () {
                        if (_emailformkey.currentState!.validate() &&
                            _passformkey.currentState!.validate()) {
                          controller.SignUp();
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
                          Get.to(Login_Screen());
                        },
                        child: const Text(
                          "Allready have an account?",
                          style: TextStyle(color: Colors.white),
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
