import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praner_market/controllers/auth_controllers.dart';
import 'package:praner_market/widgets/custom_listtile.dart';

final controller = Get.put(Auth_Controller());

class Profile_Screen extends StatelessWidget {
  const Profile_Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "My Profile",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("Users").snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final data = snapshot.data!.docs;

                  // Find the current user's document based on email
                  final currentUserEmail =
                      FirebaseAuth.instance.currentUser?.email;
                  final currentUserDoc = data
                      .firstWhere((doc) => doc['email'] == currentUserEmail);

                  // Extract user data
                  final name = currentUserDoc['full_name'];
                  final email = currentUserDoc['email'];
                  final address = currentUserDoc['address'];
                  final phone = currentUserDoc['phone_Number'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Profile_Listtile(title: "Name", subtitle: name),
                      Profile_Listtile(title: "Email", subtitle: email),
                      Profile_Listtile(title: "Address", subtitle: address),
                      Profile_Listtile(title: "Phone", subtitle: phone),


                      const SizedBox(height: 20.0),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
