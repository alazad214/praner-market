import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custom_CategoryList extends StatelessWidget {
  const Custom_CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("category").snapshots(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              color: Colors.blue,
            );
          }

          return SizedBox(
            height: 100,
            child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                primary: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  final data = snapshot.data!.docs[index];

                  return Container(
                    margin: const EdgeInsets.all(5),
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.lime,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.blue),
                    ),
                    child: Image.network(
                      data["image"],
                      fit: BoxFit.cover,
                    ),
                  );
                }),
          );
        });
  }
}
