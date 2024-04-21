import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:praner_market/widgets/custom_appbar.dart';
import 'package:praner_market/widgets/custom_button.dart';

class Details_Screen extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>>? data;
  const Details_Screen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(
        backgroundcolor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 220,
            clipBehavior: Clip.antiAlias,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: data?["image"],
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    data?["name"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
                CircleAvatar(
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 25,
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "৳ " + data?["dis_price"],
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
                Text(
                  "৳ " + data?["ori_price"],
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 18),
                )
              ],
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Discription",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              data?["dis"],
              style:
                  TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 16),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                      child: Custom_Button(
                    ontap: () {},
                    text: "Add to card",
                    color: Colors.green,
                  )),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Custom_Button(
                    ontap: () {},
                    text: "Buy Now",
                    color: Colors.blue,
                  ))
                ],
              ))
        ],
      )),
    );
  }
}
