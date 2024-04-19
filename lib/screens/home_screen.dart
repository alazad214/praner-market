import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:praner_market/widgets/custom_category_list.dart';
import 'package:praner_market/widgets/custom_slider.dart';
import 'package:praner_market/widgets/custom_title_subtitle.dart';
import 'package:praner_market/widgets/custom_title_subtitle2.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: const SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 5, bottom: 10, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom_Title_SubTitle(
                  title: "Al Azad",
                  subtitle:
                      "Buy one product form any place, at any time.very easily with dhamaka."),
              Custom_Slider(),
              Custom_Title_Subtitle2(),
              Custom_CategoryList()
            ],
          ),
        ),
      )),
    );
  }
}
