import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praner_market/screens/details_screen.dart';

class Custom_SingleProduct extends StatelessWidget {
  const Custom_SingleProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("products").snapshots(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          return SizedBox(
            child: GridView.builder(
                itemCount: snapshot.data!.docs.length,
                primary: false,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.8),
                itemBuilder: (_, index) {
                  final data = snapshot.data!.docs[index];

                  return InkWell(
                    onTap: () {
                      Get.to(Details_Screen(data: data));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.blue)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "30% off",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 16),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite_border))
                            ],
                          ),
                          CachedNetworkImage(
                            height: 100,
                            fit: BoxFit.cover,
                            imageUrl: data["image"],
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          Text(
                            data["name"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  data["dis_price"],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  data["ori_price"],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 12),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          );
        });
  }
}
