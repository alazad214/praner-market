import 'package:flutter/material.dart';
import 'package:praner_market/screens/cart_screen.dart';
import 'package:praner_market/screens/faviorite_screen.dart';
import 'package:praner_market/screens/home_screen.dart';
import 'package:praner_market/screens/profile_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNav_Screen extends StatefulWidget {
  BottomNav_Screen({super.key});

  @override
  State<BottomNav_Screen> createState() => _BottomNav_ScreenState();
}

class _BottomNav_ScreenState extends State<BottomNav_Screen> {
  var _currentIndex = 0;
  final _pages = [
    const Home_Screen(),
    const Cart_Screen(),
    const Faviorite_Screen(),
    const Profile_Screen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
              icon: const Icon(Icons.home_outlined),
              title: const Text("Home"),
              selectedColor: Colors.blueGrey,
              activeIcon: const Icon(
                Icons.home_filled,
                color: Colors.blue,
              )),

          /// Likes
          SalomonBottomBarItem(
              icon: const Icon(Icons.shopping_cart_outlined),
              title: const Text("Cart"),
              selectedColor: Colors.pink,
              activeIcon: const Icon(
                Icons.shopping_cart,
                color: Colors.blue,
              )),

          /// Search
          SalomonBottomBarItem(
              icon: const Icon(Icons.favorite_outline),
              title: const Text("Favorite"),
              selectedColor: Colors.orange,
              activeIcon: const Icon(
                Icons.favorite,
                color: Colors.blue,
              )),

          /// Profile
          SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
              selectedColor: Colors.teal,
              activeIcon: const Icon(
                Icons.person,
                color: Colors.blue,
              )),
        ],
      ),
    );
  }
}
