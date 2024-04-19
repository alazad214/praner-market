import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:praner_market/widgets/custom_appbar.dart';

import '../widgets/custom_listtile.dart';

class Profile_Screen extends StatelessWidget {
  const Profile_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My profile",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const SizedBox(
                  height: 55,
                  width: 55,
                  child: CircleAvatar(),
                ),
                const SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "name",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "email",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.9),
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 30),
            const Profile_Listtile(
                title: "My Orders", subtitle: "You have 12 order.."),
            const SizedBox(height: 20),
            Profile_Listtile(title: "Shipping Address", subtitle: "address"),
            const SizedBox(height: 20),
            const Profile_Listtile(title: "Payment Method", subtitle: "Bkash"),
            const SizedBox(height: 20),
            const Profile_Listtile(
                title: "My Reviews", subtitle: "You have 4 reviews in products")
          ],
        ),
      )),
    );
  }
}
