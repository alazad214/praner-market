import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:praner_market/auth/login_screen.dart';
import 'package:praner_market/auth/signup_screen.dart';
import 'package:praner_market/widgets/custom_button.dart';
import 'package:praner_market/widgets/custom_title_subtitle.dart';

class Welcome_Screen extends StatelessWidget {
  const Welcome_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Lottie.asset("assets/animations/shopping_cart.json",
                height: Height / 2.5),
            const Custom_Title_SubTitle(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                title: "Praner Market",
                subtitle:
                    "Welcome to Praner Market App. Delivery charge is free only when shopping for the first time. Enjoy shopping"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                      child: Custom_Button(
                    text: "Login",
                    color: Colors.blueAccent.shade400,
                    ontap: () {
                      Get.to(() => Login_Screen());
                    },
                  )),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Custom_Button(
                    ontap: () {
                      Get.to(() => Signup_screeen());
                    },
                    text: "Signup",
                  )),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
