import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_title_subtitle.dart';

class Custom_HeaderTitle extends StatelessWidget {
  const Custom_HeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return      StreamBuilder(
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

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Custom_Title_SubTitle(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                textalign: TextAlign.start,
                title: name,
                subtitle:
                "Buy one product form any place, at any time.very easily with dhamaka."),
          ],
        );
      },
    );
  }
}
