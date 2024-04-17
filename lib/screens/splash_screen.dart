import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:praner_market/auth/profile_setup.dart';
import 'package:praner_market/screens/bottomnav_screen.dart';
import 'package:praner_market/screens/home_screen.dart';
import 'package:praner_market/screens/profile_screen.dart';
import 'package:praner_market/screens/welcome_screen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Get.offAll(() => Welcome_Screen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
      children: [
        Container(
          height: screenSize.height / 1,
          alignment: Alignment.center,
          child: Center(
              child: Lottie.asset("assets/animations/anim.json", height: 100)),
        )
      ],
    ));
  }
}
