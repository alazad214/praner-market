import 'package:flutter/material.dart';

class Custom_Title_SubTitle extends StatelessWidget {
  const Custom_Title_SubTitle({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 25,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue.shade500,
            ),
          ),
        ],
      ),
    );
  }
}
