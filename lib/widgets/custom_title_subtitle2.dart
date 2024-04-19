import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custom_Title_Subtitle2 extends StatelessWidget {
  const Custom_Title_Subtitle2({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Top Categories",
          style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              "View all",
              style: TextStyle(
                color: Colors.blue,
              ),
            ))
      ],
    );
  }
}
