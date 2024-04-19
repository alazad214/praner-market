import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custom_CategoryList extends StatelessWidget {
  const Custom_CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return Container(
              margin: const EdgeInsets.all(5),
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                  color: Colors.lime,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.blue)),
            );
          }),
    );
  }
}
