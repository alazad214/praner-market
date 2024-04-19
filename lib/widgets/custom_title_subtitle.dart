import 'package:flutter/material.dart';

class Custom_Title_SubTitle extends StatelessWidget {
  const Custom_Title_SubTitle(
      {super.key,
      required this.title,
      required this.subtitle,
      this.mainAxisAlignment,
      this.crossAxisAlignment, this.textalign});
  final String title;
  final String subtitle;
  final mainAxisAlignment;
  final crossAxisAlignment;
  final textalign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 25,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            textAlign: textalign??TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}
