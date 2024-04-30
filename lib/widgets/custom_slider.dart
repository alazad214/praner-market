import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custom_Slider extends StatelessWidget {
  const Custom_Slider({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("slider").snapshots(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          return Container(
            height: 140,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: CarouselSlider.builder(
                itemCount: snapshot.data!.docs.length,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  height: 140,
                ),
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  final data = snapshot.data!.docs[itemIndex];

                  return CachedNetworkImage(
                    height: 140,
                    fit: BoxFit.cover,
                    imageUrl: data["image"],
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  );
                }),
          );
        });
  }
}
